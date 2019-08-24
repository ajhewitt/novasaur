;lcc1802Epilog.inc initialization and runtime functions needed for lcc1802 programs
;Dec 21 2012 - out5/putc moved to separate putc.inc for christmas compiler
;this is the version published with the lcc1802121229 release
;jan 1 2013 incleasing stack beginning lcation to 3fff (16K)
;jan 2 removed test routines, moved code not needing short branches to before the align 256
rwork	equ	memAddr	;work register
lcc1802init:	
	ldiReg	RCALL,_call
	ldiReg	RRET,_return
	ldiReg	SP,0x3fff	;wjr jan 1 start stack at 16K-1
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
    pushr retAddr
    Ccall _divU2
    glo regArg2
    plo retVal
    ghi regArg2
    plo retVal
    popr retAddr
    Cretn
    
_modI2:	;16 bit signed remainder
	; just calls the 16 bit division then puts remainder into return value
    pushr RetAddr	;save the return address
    Ccall _divI2
    glo regArg2
    plo retVal
    ghi regArg2
    plo retVal
    popr RetAddr	;restore the return address
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
	;ghi	retAddr ;save previous return pointer on stack
	;dec	sp
	;stxd
	;glo	retAddr
	;str	sp	
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
	;lda	SP	;pick up old return address
	;plo	retAddr
	;lda	SP
	;phi	retAddr
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


	; retVal = regArg1/regArg2  (remainder in regArg1)
	; This is really an unsigned 23 bit divide
	;thanks to Ted Rossin
	;bodged Dec 12 to shuffle registers at the end.
_divU2:
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
    pushr retAddr	;save the return address
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
    popr RetAddr ;restore the return address
    Cretn ;and we're done - I hope!
    
