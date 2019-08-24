;lcc1802Epilog.inc initialization and runtime functions needed for lcc1802 programs
;Dec 21 2012 - out5/putc moved to separate putc.inc for christmas compiler
;this is the version published with the lcc1802121229 release
;jan 1 2013 incleasing stack beginning lcation to 3fff (16K)
;jan 2 removed test routines, moved code not needing short branches to before the align 256
;jan 11 going back to SCRT conventions for NG compiler
;Jan 21 adding _mulu4 32 bit multiplication - really s.b. mulI4
;Jan 28 archived before beginning work on Birthday Compiler
;Feb 5 dubdab algorithm being brought in for ltoa itoa
;Feb 12 fixed bugs in modi2/u2
;feb 27 changed stack to start at 7fff
;mar 3, 2013 saved as epiloNO for optimization round
rwork	equ	memAddr	;work register
lcc1802init:	
	ldiReg	RCALL,_call
	ldiReg	RRET,_return
	ldiReg	SP,0x7fff	;wjr jan 1 start stack at 32K-1
	sex	SP
	ldiReg	RPC,$$_00000
	sep	RPC
$$_00000:
	Ccall _main	;call the main routine
$$_die:	lbr	$$_die		;loop here when main returns
	db	0xde,0xad

;the following routines don't have short jumps and don't need to worry about alignment
_setqOn:
	seq
	Cretn
_setqOff:
	req
	Cretn

_modU2:	;16 bit unsigned remainder
	; just calls the 16 bit division then puts remainder into return value
    Ccall _divU2
    glo regArg2
    plo retVal
    ghi regArg2
    phi retVal
    Cretn
    
_modI2:	;16 bit signed remainder
	; just calls the 16 bit division then puts remainder into return value
    Ccall _divI2
    glo regArg2
    plo retVal
    ghi regArg2
    phi retVal
    Cretn

_out4:	
	glo	regArg1
	dec	sp
	str	sp
	out	4
	Cretn

;the following routines have short branches so all the code has to stay within the same page
	align 256
;non-standard Call routine invoked as D4xxxx - using z80 stack convention
;requires programs to save the return address if they destroy it (by using call for example)
	sep     R3 ;go to subroutine
_call	sex	SP ;make sure X=SP
	ghi	retAddr ;save previous return pointer on stack
	dec	sp
	stxd
	glo	retAddr
	str	sp	
	glo	RPC ;copy old PC to retAddr
	plo	retAddr
	ghi	RPC
	phi	retAddr
	lda	retAddr ;pick up subroutine address into RPC
	phi	RPC
	lda	retAddr
	plo	RPC
	br	_call-1

;non-standard subroutine return - using z80 stack discipline (decrement 1st, little endian)
;requires programs to save the return address if they destroy it (by using call for example)
	sep	RPC	;return to the original program
_return	glo	retAddr	;transfer the current return address to RPC
	plo	RPC
	ghi	retAddr
	phi	RPC
	lda	SP	;pick up old return address
	plo	retAddr
	lda	SP
	phi	retAddr
	br	_return-1

_oneMs:		;execute 100 instructions including call(15)/return(10) sequence. takes about 1 ms
	ldi	(100-15-10-2)/2
$$mslp:	smi	1
	bnz	$$mslp
	Cretn


	
;16 bit unsigned multiply thanks to Ted Rossin!
;retVal=regArg1*regArg2. uses register rwork as a work regitsr
_mulu2:		
    dec sp
    ldi 16
    plo	rwork	;bit count
    ldi 0
    phi	retVal	;quotient
    plo retVal
$$MultLoop16_16:
    ghi regArg1
    shr
    phi regArg1
    glo regArg1
    shrc
    plo regArg1
    bnf $$MultSkip16_16
    glo regArg2
    str sp
    glo retVal
    add 
    plo retVal
    ghi regArg2
    str sp
    ghi retVal
    adc
    phi retVal
$$MultSkip16_16:
    glo regArg2
    shl
    plo regArg2
    ghi regArg2
    shlc
    phi regArg2
    dec rwork
    glo rwork
    bnz $$MultLoop16_16
    inc sp
    sep 5


_divU2:
	; retVal = regArg1/regArg2  (remainder in regArg1)
	; This is really an unsigned 23 bit divide
	;thanks to Ted Rossin
	;bodged Dec 12 to shuffle registers at the end.
    dec sp
    ldi 16
    plo rwork
    ldi 0
    phi retVal
    plo retVal
    phi rwork
$$DivLoop16_16:
    glo regArg1
    shl
    plo regArg1
    ghi regArg1
    shlc
    phi regArg1
    glo retVal
    shlc
    plo retVal
    ghi retVal
    shlc
    phi retVal
    ghi rwork
    shlc
    phi rwork
    bnf $$DivSub16_16
    glo regArg2
    str sp
    glo retVal
    add 
    plo retVal
    ghi regArg2
    str sp
    ghi retVal
    adc 
    phi retVal
    ghi rwork
    adci 0
    phi rwork
    br $$DivSkip16_16
$$DivSub16_16:
    glo regArg2
    str sp
    glo retVal
    sm
    plo retVal
    ghi regArg2
    str sp
    ghi retVal
    smb 
    phi retVal
    ghi rwork
    smbi 0
    phi rwork 
$$DivSkip16_16:
    shl
    bdf $$DivSkipClear16_16
$$DivSetBit16_16:
    glo regArg1
    ori  0x01
    plo regArg1
$$DivSkipClear16_16:
    dec rwork
    glo rwork
    bnz $$DivLoop16_16
    ghi rwork
    shl
    bnf $$DivSkipFinalAdd16_16
    glo regArg2
    str sp
    glo retVal
    add
    plo retVal
    ghi regArg2
    str sp
    ghi retVal
    adc
    phi retVal
$$DivSkipFinalAdd16_16:
    inc sp
;here I have the quotient in regArg1 and remainder in retVal
    glo retVal
    plo regArg2
    ghi retVal
    phi regArg2
    glo regArg1
    plo retVal
    ghi regArg1
    phi retVal
    ;return with quotient in retVal and remainder in regArg2
    sep 5

;signed integer division retVal=regArg1/regArg2, remainder in regArg1
;uses unsigned division of absolute values then negates the quotient if the signs were originally different
_divI2:
    ;pushr retAddr	;save the return address NG doesnot need
    dec	sp	;leave a work area available
    ghi regArg1
    str sp	;save the sign of the 1st arg
    shl
    bnf $$pos1	;if the 1st arg is -v
    negI2 regArg1,regArg1 ;flip it to positive
$$pos1: ;1st is now +v, check 2nd
    ghi regArg2
    xor	
    str sp ;the stack now has bit 8 set if the signs are different
    ghi regArg2
    shl
    bnf $$pos2	;if the 2nd arg is -v
    negI2 regArg2,regArg2 ;flip it to +v
$$pos2: ; both args now +v
    Ccall _divU2	;call unsigned division
;now the quotient is in retVal and the remainder is in regArg2
    lda	sp ;get back the sign bits and restore SP
    shl
    bnf $$done ;if the signs were different
    negI2 retVal,retVal ;negate the quotient
$$done:
    ;popr RetAddr ;restore the return address NG doesnot need
    Cretn ;and we're done - I hope!


	align 256    ;32 bit operations follow
_divu4:
;This is an unsigned 32 bit restoring division
;The arguments are in RL8 and RL10, the result RL8/RL10 is in RL8, and the remainder is in Rp1p2
;Rp1p2:RL8 form a 64 bit work area A:Q
;the dividend, in RL10 is repeatedly combined with the top 32 bits and the two shifted left
;the algorithm is described in http://www2.informatik.hu-berlin.de/~rok/ca/TEMP/CA_2000/engl/ca12/ca12_1-4.pdf

	ldi 32		;set loop count
	plo memaddr	;in temp register
	ldi4 Rp1p2,0	;clear Rp1p2
$$loop:
	shL4 RL8	;shift bottom 32 bits left 1
	shLC4 Rp1p2	;continue the shift into the top 32 bits

	alu4 Rp1p2,Rp1p2,RL10,sm,smb	;subtract dividend from top 32 bits

	ani 0x80	;check the top bit
	bz $$norestore	;if it's 0
		glo RL8
		ani 0xfe	;turn off the bottom bit
		plo RL8
		alu4 Rp1p2,Rp1p2,RL10,add,adc
	br $$endlp 	;else
$$norestore:
		glo RL8
		ori 1	;turn on the bottom bit
		plo RL8
	;end if
$$endlp:
	dec memaddr	;check the cycle count
	glo memaddr
	bnz $$loop	;back for more if needed
	
	Cretn		;and we're done - quotient is in RL8, remainder in Rp1p2
		

_mulu4:
	;this is a 32 bit signed multiplication using booth's algorithm
	;much thanks to David Schultz for the code and Charles Richmond for help with the algorithm
	;input is in register pairs R8:R9 and R10:R11 (called RL8 and RL10)
	;output is in R8:R9, with the top 32 bits in r12:13 (called Rp1p2)
	;the bottom byte of memaddr is used as a cycle count
	;initially	R12:13=0,	R8:R9=operand 1, DF=0
	;for 32 cycles we check the low bit of R8:R9 and DF
	;for 01 we add the R10:R11 to R12:13 and shift the whole 64 bits right once into DF
	;for 10 we subtract and shift
	;for 00 and 11 we just shift

    ldi4 rp1p2,0	;eventual product top 32 bits
    ldi 32
    plo memaddr		;cycle count
    adi 0		;clear df
$$mloop:
    glo RL8
    ani 1		;isolate bottom bit of result
    bnf	$$check_sub	;
    bnz	$$shift		;that would be the 11 case
;this is case 01: add second operand to top 32 bits and shift all 64 bits right
    alu4 Rp1p2,Rp1p2,RL10,add,adc	;32 bit add
    br $$shift
$$check_sub:
    bz $$shift	;that would be the 00 case
;this is case 10: subtract 2nd operand from top 32 bits then shift right
    alu4 Rp1p2,Rp1p2,RL10,sm,smb
$$shift:
    shRI4 Rp1p2		;shift the top 32 bits
    shRC4 RL8		;continue the shift to the bottom 32 bits

    dec memaddr		;cycle count
    glo memaddr
    bnz $$mloop		;repeat cycle once for each bit position
    
    cretn	;and we're done. if Rp1p2 is not 0 or -1 we've overflowed 

	align 256
;signed integer division RL8=RL8/RL10, remainder in Rp1p2
;uses unsigned division of absolute values then negates the quotient if the signs were originally different
_divI4:
    dec	sp	;leave a work area available
    ghi RL8-1	;get the top of the dividend
    str sp	;save the sign of the 1st arg
    shl
    bnf $$pos1	;if the 1st arg is -v
    negI4 RL8,RL8 ;flip it to positive
$$pos1: ;1st is now +v, check 2nd
    ghi RL10-1
    xor	
    str sp ;the stack now has bit 8 set if the signs are different
    ghi RL10-1
    shl
    bnf $$pos2	;if the 2nd arg is -v
    negI4 RL10,RL10 ;flip it to +v
$$pos2: ; both args now +v
    Ccall _divU4	;call unsigned division
;now the quotient is in RL8 and the remainder is in Rp1p2
    lda	sp ;get back the sign bits and restore SP
    shl
    bnf $$done ;if the signs were different
    negI4 RL8,RL8 ;negate the quotient
$$done:
    Cretn ;and we're done - I hope!

_dubdabx:	
;experimental binay-ascii conversion using the double-dabble algorithm
;thanks to Charles Richmond for the suggestion and code
;long interger is passed in rp1p2
;buffer pointer is passed at sp+2+4
;a pointer to the 1st non-zero byte in the buffer is passed back in r15
;r8-11 are used as temps
;r8 is the working pointer
;r9.0 is bit count(32)
;r10.0 is digit count
	ld2 r8,'O',sp,(2+4); pick up the buffer pointer
	cpy2 r15,r8 ;save it for now
	ldi 11	;digit count+1 for trailing 0
	plo r9
$$clrlp:	;clear the passed buffer
	ldi 0	
	str r8	;clear a byte
	inc r8
	dec r9
	glo r9	;check the count
	bnz $$clrlp ;back for more
	cpy2 r8,r15 ;get the address back

	ldi 32	;bit count
	plo r15
;now i'm going to spin off any leading 0's in the binary number
$$cktop:
	ghi rp1p2-1	;get the top bit of the number
	shl		;check for a 1
	bdf $$bitloop	;move on if we have one
	shl4 rp1p2	;shift the input number
	dec r15		;reduce the number of times to shift
	glo r15
	bnz $$cktop	;
	inc r15		;our whole number was 0 but force at least one pass
$$bitloop:
	ldi 10	;digit count
	plo r9
$$dcklp:
	ldn r8 	;pick up a digit
	smi 5	;see if it's greater than 4
	bnf $$dnoadd ;if not, bypass add
	adi 0x08	;add the 5 black and 3 more
	str r8	;put it back
$$dnoadd:
	inc r8
	dec r9	;decrement digit count
	glo r9
	bnz $$dcklp ;and back for next digit
	
	shl4 rp1p2 ;shift the input number
	
	ldi 10	;load the digit count again
	plo r9
;r8 is now just past the units location and ready to walk back
$$dshlp:
	dec r8	;walk back from 0's position
	ldn r8	;get the digit back
	shlc	;continue the shift
	phi r15 ;save it for the carry test
	ani 0x0f ;clear the 10 bit
	str r8	;put the digit back
	ghi r15	;now test for carry
	smi 0x10 ; this will make df 1 if the 10 bit is set
	dec r9	;decrement the digit count
	glo r9
	bnz $$dshlp ;back for more if needed
	
	dec r15
	glo r15
	bnz $$bitloop
	
	cpy2 r15,r8	;save the starting location of the digits
	ldi 10		;digit count again
	plo r9
$$upnxt:
	ldn r8		;get digit
	ori 0x30	;make ascii
	str r8		;put it back
	inc r8		;next digit
	dec r9		;counter
	glo r9
	bnz $$upnxt	;upgrade all 10 spots
	
	ldi 9		;now to skip up to 9 zeros
	plo r9
$$cknext:
	ldn r15		;check digit
	smi 0x30	;for '0'
	bnz $$done
	inc r15		;next digit
	dec r9		;reduce count
	glo r9
	bnz $$cknext
$$done:
	cretn
	
	
_modU4:	;32 bit unsigned remainder
	; just calls the 32 bit division then puts remainder into return value
    Ccall _divU4
    cpy4 RL8,Rp1p2
    Cretn
    
_modI4:	;32 bit signed remainder
	; just calls the 32 bit division then puts remainder into return value
    Ccall _divI4
    cpy4 RL8,Rp1p2
    Cretn
    
	
 