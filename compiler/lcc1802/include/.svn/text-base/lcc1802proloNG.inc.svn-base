	RELAXED ON
;definitions and prolog functions needed for smc1802 programs (Hi Bill)
;dec 21 packaged version for the christmas compiler (Ho Ho Ho)
;Dec 24 fixed shift macros to use memaddr as a work register and not corrupt the shift count
;jan 6 fixed shift left macro as above
;jan 11 saving as lcc1802epiloNG.inc for the NG compiler
;jan 12 minor correction to rldmi
;jan 14 minor correction to ldi4
;jan 16 adding shri4I
;jan20 correct error in shl2r
;jan21 moved 4 byte macros to bottom and added shrc4
;Jan 28 archived before beginning work on Birthday Compiler
;Feb 7 adding nointerrupts/interrupts to control interruptability
;Feb 13 changing address mode macros
;Feb 14 removing nointerrupts, adding reserve/release for stack frame, ld2z macro
;Mar 3 changing reserve/release to use inc/dec for 8 or less bytes
R0:	equ	0
R1:	equ	1
R2:	equ	2
R3:	equ	3
R4:	equ	4
R5:	equ	5
R6:	equ	6
R7:	equ	7
R8:	equ	8
R9:	equ	9
R10:	equ	10
R11:	equ	11
R12:	equ	12
R13:	equ	13
R14:	equ	14
R15:	equ	15
RL0:	equ	1 ;long register pairs are identified by their odd numbered register
RL8:	equ	9 ;temp 1
RL10:	equ	11;temp 2
RL12:	equ	13 ;return value register for longs
Rp1p2:	equ	13 ;argument register for longs
Rt1:	equ	8  ;1st temp register
Rt2:	equ	9  ;2nd temp register
RCALL:	equ 	4 ;standard call routine
RRET:	equ 	5 ;standard return register
RPC:	equ 	3 ; standard program counter

	listing	off
	macexp off	;this seems to have to go before the definitions
;macro definitions
reserve: macro	framesize	;reserve the stack frame
	if (framesize<9)
	    reserveS framesize	;use dec for small amounts
	else
	    reserveL framesize	;use subtract for large amounts
	endif
	endm
reserveS: macro	framesize
	rept	framesize
	dec sp
	endm
	endm
reserveL: macro framesize
;this calculation looks awkward but we're adjusting the top byte of sp first 
;so if there's an interrupt in mid calculation the sp will be pointing to free memory
	glo sp		;grab low byte of stack pointer
	smi framesize&255 ;claculate new low byte
	plo memAddr	;save it for a moment
	ghi sp		;grab high byte
	smbi (framesize>>8)&255	;calculate the new page
	phi sp		;adjust page first
	glo memAddr	;get new low byte
	plo sp		;finish adjusting the stack pointer
	endm
release: macro	framesize	;release the stack frame
	if (framesize<9)
	    releaseS framesize	;use dec for small amounts
	else
	    releaseL framesize	;use subtract for large amounts
	endif
	endm
releaseS: macro	framesize
	rept	framesize
	inc sp
	endm
	endm
releaseL: macro	framesize	;release the stack frame
;for release we adjust the low byte first 
;so if there's an interrupt in mid calculation the sp will be pointing to free memory
	alu2i sp,sp,framesize,adi,adci
	endm
blkcpy:	macro	tgt,src,len	;move memory length len from memory addressed by src to memory addressed by tgt
	ldiReg	retVal,len	;length to move
$$nxt:	glo	retVal
	lbnz	$$go
	ghi	retVal
	lbz	$$done
$$go:	lda	src		;get byte to move - nb, src reg altered
	str	tgt		;place in dest 
	inc	tgt		;advance target ptr - nb dest reg altered
	dec	retval		;decrease move count
	lbr	$$nxt
$$done:
	endm
	
jcI2:	macro	reg1,reg2,brop,label	;signed comparison 
	dec	sp ;make a work area
	glo	reg2
	str	sp 
	glo	reg1
	sm
	ghi	reg2
	str	sp
	ghi	reg1
	smb          ;that's a standard signed subtraction
	ghi	reg1 ;
	xor           ;sets the top bit if the signs are different
	inc	sp ;release the work area
	shlc          ;the original df is now in bit 0 and df=1 if signs were different
	lsnf	;bypass the flip if signs were the same
	xri	01     ;invert original df if signs were different
	shrc           ;put it back in df
	brop	label  ;execute 
	endm

jcI4:	macro	reg1,reg2,brop,label	;signed comparison of two longs
	dec	sp ;make a work area
	glo	reg2	;lowest order byte
	str	sp 
	glo	reg1
	sm
	ghi	reg2
	str	sp
	ghi	reg1
	smb          ;that's a standard signed subtraction of one reg
	glo	reg2-1	;lowest order byte of the top register
	str	sp 
	glo	reg1-1
	smb
	ghi	reg2-1
	str	sp
	ghi	reg1-1
	smb          ;that's a standard signed subtraction of a double register
	ghi	reg1-1 ;
	xor           ;sets the top bit if the signs are different
	inc	sp ;release the work area
	shlc          ;the original df is now in bit 0 and df=1 if signs were different
	lsnf	;bypass the flip if signs were the same
	xri	01     ;invert original df if signs were different
	shrc           ;put it back in df
	brop	label  ;execute 
	endm

jcU2:	macro	reg1,reg2,brop,label
	dec	sp
	glo	reg2
	str	sp
	glo	reg1
	sm
	ghi	reg2
	str	sp
	ghi	reg1
	smb
	inc	sp
	brop	label
	endm
jcU4:	macro	reg1,reg2,brop,label
	dec	sp
	glo	reg2	;start with the low byte of the low order register
	str	sp
	glo	reg1
	sm
	ghi	reg2
	str	sp
	ghi	reg1
	smb		;that's the low order register comparison done
	glo	reg2-1
	str	sp
	glo	reg1-1
	smb
	ghi	reg2-1
	str	sp
	ghi	reg1-1	;finish with the high byte of the high order register
	smb
	inc	sp
	brop	label
	endm
jcI2I:	macro	reg1,ival,brop,label	;signed comparison - register immediate
	glo	reg1
	smi	(ival)#256
	ghi	reg1
	smbi    (ival)>>8; was/256	;that's a standard signed subtraction
	ghi	reg1 ;
	xri	(ival)>>8; was/256	;sets the top bit if the signs are different
	shlc          ;the original df is now in bit 0 and df=1 if signs were different
	lsnf	;bypass the df flip if signs were the same
	xri	01     ;invert original df if signs were different
	shrc           ;put it back in df
	brop	label  ;execute 
	endm
jnI2I:	macro	reg1,ival,brop,label	;reverse signed comparison - register immediate
	glo	reg1
	sdi	(ival)#256	;subtract d FROM immediate value
	ghi	reg1
	sdbi    (ival)>>8; was/256	;that's a standard signed subtraction (of register FROM immediate)
	ghi	reg1 ;
	xri	(ival)>>8; was/256	;sets the top bit if the signs are different
	shlc          ;the original df is now in bit 0 and df=1 if signs were different
	lsnf	;bypass the df flip if signs were the same
	xri	01     ;invert original df if signs were different
	shrc           ;put it back in df
	brop	label  ;execute 
	endm
jcU2I:	macro	reg1,ival,brop,label
	glo	reg1
	smi	(ival)#256
	ghi	reg1
	smbi	(ival)>>8; was/256
	brop	label
	endm
jnU2I:	macro	reg1,ival,brop,label	;reverse unsigned comparison
	glo	reg1
	sdi	(ival)#256	;subtract d FROM immediate value
	ghi	reg1
	sdbi	(ival)>>8; was/256 ; sfinish subtracting register FROM immediate value
	brop	label
	endm
jneU2:	macro	reg1,reg2,label
	dec	sp
	glo	reg2
	str	sp
	glo	reg1
	sm
	inc	sp
	lbnz	label
	dec	sp
	ghi	reg2
	str	sp
	ghi	reg1
	smb
	inc	sp
	lbnz	label
	endm
jneU2I:	macro	reg1,ival,label
	glo	reg1
	smi	(ival)#256
	lbnz	label
	ghi	reg1
	smbi	(ival)>>8; was/256
	lbnz	label
	endm
jnzU2:	macro	reg1,label
	glo	reg1
	lbnz	label
	ghi	reg1
	lbnz	label
	endm
jeqI4:	macro	reg1,reg2,label
	dec	sp	;make a work area
	glo	reg2	;get the low byte of the low register of the pair for the 2nd operand
	str	sp
	glo	reg1
	sm		;subtract from corresponding byte of the 1st operand
	inc	sp
	lbnz	$$nobr	;bail on test if not equal
	dec	sp
	ghi	reg2	;repeat for high order byte of low register
	str	sp
	ghi	reg1
	sm
	inc	sp
	lbnz	$$nobr
	dec	sp
	glo	reg2-1	;low order byte of high order register
	str	sp
	glo	reg1-1
	sm
	inc	sp
	lbnz	$$nobr
	dec	sp
	ghi	reg2-1	;lhigh order byte of high order register
	str	sp
	ghi	reg1-1
	sm
	inc	sp
	lbz	label	;if we get to here all other bytes have been equal so branch if this one is too
$$nobr:
	endm

jneu4:	macro	reg1,reg2,label
	jeqi4	reg1,reg2,+
	lbr	label
+
	endm

jeqI2:	macro	reg1,reg2,label
	dec	sp
	glo	reg2
	str	sp
	glo	reg1
	sm
	inc	sp
	lbnz	$$nobr
	dec	sp
	ghi	reg2
	str	sp
	ghi	reg1
	smb
	inc	sp
	lbz	label
$$nobr:
	endm
jeqU2I:	macro	reg1,ival,label
	glo	reg1
	smi	(ival)#256
	lbnz	$$nobr
	ghi	reg1
	smbi	(ival)>>8; was/256
	lbz	label
$$nobr:
	endm
ld2z:	macro	reg1	;load zero into a 16 bit register
	ldi	0
	plo	reg1
	phi	reg1
	endm
ldAD:	macro	reg1,directaddress	;load an absolute address or a constant into a register
	ldi	(directaddress)&255
	plo	reg1
	ldi	(directaddress)>>8; was/256
	phi	reg1
	endm
ldAX:	macro	reg1,basereg,offset	;load a base+offset address into a register
	glo	basereg
	adi	(offset)#256
	plo	reg1
	ghi	basereg
	adci	(offset)>>8; was/256
	phi	reg1
	endm
ldA2:	macro	reg1,OorD,destBase,destOff ;2 byte load address direct or base+offset
	if	(OorD='O')
		ldAX	reg1,destbase,destoff
	else
		ldAD	reg1,destbase
	endif
	endm

cpy2:	macro	tgt,src			;2 byte register copy
	glo	src
	plo	tgt
	ghi	src
	phi	tgt
	endm
cpy1:	macro	tgt,src			;1 byte register copy
	glo	src
	plo	tgt
	endm
zext:	macro	reg			;zero extend(clear) the top byte of register
	ldi	0
	phi	reg
	endm
sext:	macro	reg			;sign extend the byte in d to the register
	shl		;put the sign in df
	ldi	0	;clear bits 0-7
	shlc		;sign to bit 0
	xri	1	;bit 0 is now 1 for positive numbers, 0 for negative
	smi	1	;D is now 0 for +v numbers, FF for -v
	phi	reg	;et voila
	endm
sext4:	macro	lreg	;sign extend from the bottom register to the top of a register pair
	ghi	lreg	;get the top of the bottom of the pair (long regs are addressed by the low member)
	shl		;put the sign in df
	ldi	0	;clear bits 0-7
	shlc		;sign to bit 0
	xri	1	;bit 0 is now 1 for positive numbers, 0 for negative
	smi	1	;D is now 0 for +v numbers, FF for -v
	plo	lreg-1	;low order of top of pair
	phi	lreg-1	;high byte
	endm	
zext4:	macro	lreg	;clear the top of a register pair
	ldi	0	;source a 0
	plo	lreg-1	;low order of top of pair
	phi	lreg-1	;high byte
	endm	
shL2I:	macro	reg,n	;shift register left n bits
	rept	n
	shl2	reg
	endm
	endm
shl2:	macro	reg	;shift register left 1 bir
	glo	reg
	shl
	plo	reg
	ghi	reg
	shlc
	phi	reg
	endm
shL2R:	macro	reg,regn	;shift register left by count in regn
	glo	regn		;the + and - are nameless temporary symbols
	lbz	+
	plo	memaddr
-	shl2	reg
	dec	memaddr
	glo	memaddr
	lbnz	-
+
	endm
shRU2I:	macro	reg,n	;shift register right n bits - unsigned
	rept	n
	shrU2	reg
	endm
	endm
shrU2:	macro	reg	;shift register right once - unsigned
	ghi	reg
	shr
	phi	reg
	glo	reg
	shrc
	plo	reg
	endm
shRU2R:	macro	reg,regn	;shift register right by count in regn - unsigned
	glo	regn		;the + and - are nameless temporary symbols
	lbz	+
	plo	memaddr
-	shrU2	reg
	dec	memaddr
	glo	memaddr
	lbnz	-
+
	endm
shrI2I:	macro	reg,n	;shift register right n bits - signed
	rept	n
	shrI2	reg
	endm
	endm
shrI2:	macro	reg	;shift register right once - signed
	ghi	reg
	shl		;set DF to the sign
	ghi	reg	;get the top byte back
	shrc		;shift one bit extending the sign
	phi	reg
	glo	reg
	shrc
	plo	reg
	endm
shRI2R:	macro	reg,regn	;shift register right by count in regn - signed
	glo	regn		;the + and - are nameless temporary symbols
	plo	memaddr		;save the shift count
	lbz	+
-	shrI2	reg
	dec	memaddr		;decrement the shift count
	glo	memaddr		;get it
	lbnz	-
+
	endm
negI2:	macro	tgt,src			;two byte negation from src to tgt
	glo	src			;(flip all the bits and add 1)
	xri	0xff
	plo	tgt
	ghi	src
	xri	0xff
	phi	tgt
	inc	tgt
	endm
alu2I: macro	tgt,src,imm,op1,op2	;2 byte register/immediate alu operation 
	glo 	src
	op1	(imm)#256
	plo	tgt
	ghi	src
	op2	(imm)>>8; was/256
	phi	tgt
	endm
alu2: macro	tgt,src1,src2,op1,op2	;2 byte register/register alu operation 
	dec	sp ;make a work ares
	glo 	src2
	str	sp
	glo	src1
	op1		;calculate the low order byte
	plo	tgt
	ghi	src2
	str	sp
	ghi	src1
	op2		;calculate the high byte
	phi	tgt
	inc	sp 	;release the work area
	endm	
st2:	macro	reg,OorD,destBase,destOff ;2 byte store to direct memory address or base+offset
	if	(OorD='O')
		ldAX	memAddr,destbase,destoff
	else
		ldAD	memAddr,destBase
	endif
	ghi	reg
	str	memAddr
	inc	memAddr
	glo	reg
	str	memAddr
	endm
ld2:	macro	reg,OorD,destBase,destOff ;2 byte load from direct memory address or base+offset
	if	(OorD='O')
		ldAX	memAddr,destbase,destoff
	else
		ldAD	memAddr,destBase
	endif
	lda	memAddr
	phi	reg
	ldn	memAddr
	plo	reg
	endm
st1:	macro	reg,OorD,destBase,destOff ;1 byte store to direct memory address or base+offset
	if	(OorD='O')
		ldAX	memAddr,destbase,destoff
	else
		ldAD	memAddr,destBase
	endif
	glo	reg
	str	memAddr
	endm
ld1:	macro	reg,OorD,destBase,destOff ;1 byte load from direct memory address or base+offset
	if	(OorD='O')
		ldAX	memAddr,destbase,destoff
	else
		ldAD	memAddr,destBase
	endif
	ldn	memAddr
	plo	reg
	endm

Ccall:	macro	target
	sep	RCALL
	dw	target
	endm
Cretn:	macro
	sep	RRET
	endm
savmi:	macro	reg	;this is a form of push used in a sequence of regiter saves
	glo	reg
	stxd		;reg x is primed to the spot to start the saves
	ghi	reg
	stxd		;and it end up where needed to do the next one
	endm
rldmi:	macro	reg,ptr	;this is a form of pop used to reload sequence of registers
	lda	ptr	;reg ptr is primed to the spot to start the reloads
	phi	reg
	lda	ptr	;and it end up where needed to do the next one
	plo	reg
	endm
pushr:	macro	reg
	dec	sp
	glo	reg
	stxd
	ghi	reg
	str	sp
	endm
popr:	macro	reg
	lda	sp
	phi	reg
	lda	sp
	plo 	reg
	endm
	
;more natural 1802 macros
ldiReg:	macro	reg,value
	ldi	(value)&255
	plo	reg
	ldi	(value)>>8; was/256
	phi	reg
	endm		

inc4:	macro	Lreg	;increment a 4 byte register pair
	alu4i	Lreg,Lreg,1,adi,adci
	endm
	
alu4i:	macro	ltgt,lsrc,immval,op1,op2
	glo	Lsrc	;long regs are equated to the second reg which has the low order word 
	op1	(immval)&255
	plo	Ltgt
	ghi	Lsrc
	op2	((immval)>>8)&255; 
	phi	Ltgt
	glo	Lsrc-1
	op2	((immval)>>16)&255; 
	plo	Ltgt-1
	ghi	Lsrc-1
	op2	((immval)>>24)&255; 
	phi	Ltgt-1
	endm

ldi4	macro	lreg,immval ;4 byte load signed literal
	ldi	(immval)&255
	plo	lreg
	ldi	((immval)>>8)&255; 
	phi	lreg
	ldi	((immval)>>16)&255; 
	plo	lreg-1
	ldi	((immval)>>24)&255; 
	phi	lreg-1
	endm

cpy4:	macro	tgt,src			;4 byte register pair copy
	cpy2	tgt,src	;long reg pairs are addressed as the low order pair
	cpy2	tgt-1,src-1
	endm	
st4:	macro	reg,OorD,destBase,destOff ;4 byte store to direct memory address or base+offset
	if	(OorD='O')
		ldAX	memAddr,destbase,destoff
	else
		ldAD	memAddr,destBase
	endif
	ghi	reg-1	;long register pairs are addressed by their second member
	str	memAddr ;but load and store start with the 1st
	inc	memAddr
	glo	reg-1
	str	memAddr
	inc	memAddr
	ghi	reg
	str	memAddr
	inc	memAddr
	glo	reg
	str	memAddr
	endm
ld4:	macro	reg,OorD,destBase,destOff ;4 byte load from direct memory address or base+offset
	if	(OorD='O')
		ldAX	memAddr,destbase,destoff
	else
		ldAD	memAddr,destBase
	endif
	lda	memAddr
	phi	reg-1	;long register pairs are addressed by their second member
	lda	memAddr ;but load and store start with the 1st
	plo	reg-1
	lda	memAddr
	phi	reg
	ldn	memAddr
	plo	reg
	endm

alu4: macro	tgt,src1,src2,op1,op2	;4 byte register/register alu operation 
	dec	sp ;make a work ares
	glo 	src2	;long register pairs are addressed by their second member
	str	sp	;so arithmetic operations start there
	glo	src1
	op1		;calculate the low order byte
	plo	tgt
	ghi	src2
	str	sp
	ghi	src1
	op2		;calculate the second byte
	phi	tgt
	glo 	src2-1
	str	sp
	glo	src1-1
	op2		;calculate the third byte
	plo	tgt-1
	ghi	src2-1
	str	sp
	ghi	src1-1
	op2		;calculate the high byte
	phi	tgt-1
	inc	sp 	;release the work area
	endm	
shrI4I:	macro	reg,n	;shift register right n bits - signed
	rept	n
	shrI4	reg
	endm
	endm
shRI4R:	macro	reg,regn	;shift long register right by count in regn - signed
	glo	regn		;the + and - are nameless temporary symbols
	plo	memaddr		;save the shift count
	lbz	+
-	shrI4	reg
	dec	memaddr		;decrement the shift count
	glo	memaddr		;get it
	lbnz	-
+
	endm
shrI4:	macro	reg	;shift register right once - signed
	ghi	reg-1	;long reg pairs start at reg-1
	shl		;set DF to the sign
	ghi	reg-1	;get the top byte back
	shrc		;shift one bit extending the sign
	phi	reg-1
	glo	reg-1
	shrc
	plo	reg-1
	ghi	reg	;get the top byte of the low order reg
	shrc		;shift one bit extending the sign
	phi	reg
	glo	reg	;finish with the low byte of the 2nd reg of the pair
	shrc
	plo	reg
	endm
shRC4:	macro	reg	;shift register right once - signed continuing from previous shift
	ghi	reg-1	;long reg pairs start at reg-1
	shrc		;shift one bit extending the sign
	phi	reg-1
	glo	reg-1
	shrc
	plo	reg-1
	ghi	reg	;get the top byte of the low order reg
	shrc		;shift one bit extending the sign
	phi	reg
	glo	reg	;finish with the low byte of the 2nd reg of the pair
	shrc
	plo	reg
	endm
shrU4I:	macro	reg,n	;shift register right n bits - signed
	rept	n
	shrU4	reg
	endm
	endm
shRU4R:	macro	reg,regn	;shift long register right by count in regn - signed
	glo	regn		;the + and - are nameless temporary symbols
	plo	memaddr		;save the shift count
	lbz	+
-	shrU4	reg
	dec	memaddr		;decrement the shift count
	glo	memaddr		;get it
	lbnz	-
+
	endm
shrU4:	macro	reg	;shift long register right once - usigned
	ghi	reg-1	;long reg pairs start at reg-1
	shr		;shift one bit 
	phi	reg-1
	glo	reg-1
	shrc		;continue the shift
	plo	reg-1
	ghi	reg	;get the top byte of the low order reg
	shrc		;continue the shift
	phi	reg
	glo	reg	;finish with the low byte of the 2nd reg of the pair
	shrc
	plo	reg
	endm
shL4:	macro	reg	;shift long register left once
	glo	reg	;start with low byte of second register
	shl		;shift left once
	plo	reg	; save it
	ghi	reg	;high byte of second reg
	shlc		;shift one bit carrying
	phi	reg	;save it
	glo	reg-1	;now the bottom byte of top reg
	shlc
	plo	reg-1
	ghi	reg-1	;finally the top byte of the high order reg
	shlc		;gets the last shift
	phi	reg-1	;and we're done
	endm

shL4R:	macro	reg,regn	;shift register right by count in regn - signed
	glo	regn		;the + and - are nameless temporary symbols
	plo	memaddr		;save the shift count
	lbz	+
-	shL4	reg
	dec	memaddr		;decrement the shift count
	glo	memaddr		;get it
	lbnz	-
+
	endm
shL4I:	macro	reg,n	;shift long register left by constant
	rept	n
		shL4	reg
	endm	;ends the rept
	endm	;ends the macro

shLC4:	macro	reg	;shift long register left once continuing previous shift
	glo	reg	;start with low byte of second register
	shlc		;shift left once continuing carry
	plo	reg	; save it
	ghi	reg	;high byte of second reg
	shlc		;shift one bit carrying
	phi	reg	;save it
	glo	reg-1	;now the bottom byte of top reg
	shlc
	plo	reg-1
	ghi	reg-1	;finally the top byte of the high order reg
	shlc		;gets the last shift
	phi	reg-1	;and we're done
	endm
negI4:	macro	tgt,src			;four byte negation from src to tgt
	alu4I	tgt,src,0xffffffff,xri,xri 	;flip all the bits
	alu4i	tgt,tgt,1,adi,adci		;and add 1
	endm
	listing	on
	lbr	lcc1802Init
