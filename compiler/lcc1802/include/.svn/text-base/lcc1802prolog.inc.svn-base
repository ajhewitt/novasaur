	RELAXED ON
;definitions and prolog functions needed for smc1802 programs (Hi Bill)
;dec 21 packaged version for the christmas compiler (Ho Ho Ho)
;Dec 24 fixed shift macros to use memaddr as a work register and not corrupt the shift count
;jan 6 fixed shift left macro as above
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
RCALL:	equ 	4 ;standard call routine
RRET:	equ 	5 ;standard return register
RPC:	equ 	3 ; standard program counter

	listing	off

;macro definitions
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
	
ldA2:	macro	reg1,OorD,destBase,destOff ;2 byte load address direct or base+offset
	if	(OorD='O')
		glo	destBase
		adi	(destOff)#256
		plo	reg1
		ghi	destBase
		adci	(destOff)>>8; was/256
		phi	reg1
	else
		ldi	(destBase)&255
		plo	reg1
		ldi	(destBase)>>8; was/256
		phi	reg1
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
	ldi	0	;clear bits 0-7
	shlc		;sign to bit 0
	xri	1	;bit 0 is now 1 for positive numbers, 0 for negative
	smi	1	;D is now 0 for +v numbers, FF for -v
	phi	reg	;et voila
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
-	glo	regn		;the + and - are nameless temporary symbols
	lbz	+
	plo	memaddr
	shl2	reg
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
		glo	destBase
		adi	(destOff)&255
		plo	memAddr
		ghi	destBase
		adci	(destOff)>>8; was/256
		phi	memAddr
	else
		ldi	(destBase)&255
		plo	memAddr
		ldi	(destBase)>>8; was /256
		phi	memAddr
	endif
	ghi	reg
	str	memAddr
	inc	memAddr
	glo	reg
	str	memAddr
	endm
ld2:	macro	reg,OorD,destBase,destOff ;2 byte load from direct memory address or base+offset
	if	(OorD='O')
		glo	destBase
		adi	(destOff)&255
		plo	memAddr
		ghi	destBase
		adci	(destOff)>>8; was/256
		phi	memAddr
	else
		ldi	(destBase)&255
		plo	memAddr
		ldi	(destBase)>>8; was/256
		phi	memAddr
	endif
	lda	memAddr
	phi	reg
	ldn	memAddr
	plo	reg
	endm
	
st1:	macro	reg,OorD,destBase,destOff ;1 byte store to direct memory address or base+offset
	if	(OorD='O')
		glo	destBase
		adi	(destOff)&255
		plo	memAddr
		ghi	destBase
		adci	(destOff)>>8; was/256
		phi	memAddr
	else
		ldi	(destBase)&255
		plo	memAddr
		ldi	(destBase)>>8; was/256
		phi	memAddr
	endif
	glo	reg
	str	memAddr
	endm
ld1:	macro	reg,OorD,destBase,destOff ;1 byte load from direct memory address or base+offset
	if	(OorD='O')
		glo	destBase
		adi	(destOff)&255
		plo	memAddr
		ghi	destBase
		adci	(destOff)>>8; was/256
		phi	memAddr
	else
		ldi	(destBase)&255
		plo	memAddr
		ldi	(destBase)>>8; was/256
		phi	memAddr
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
	listing	on
	lbr	lcc1802Init