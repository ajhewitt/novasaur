;IO1802.inc contains input/output runtime routines for LCC1802
;The port is in regArg1, the output byte is in regArg2
	align 64
_putc:
_out5:	
	glo	regArg1
	dec	sp
	str	sp
	out	5
	Cretn
_inp:		;raw port input
		;stores a small tailored program on the stack and executes it
	dec	sp	;work backwards
	ldi	0xD3	;return instruction
	stxd		
	glo	regarg1	;get the port number
	ani	0x07	;clean it
	bz	+	; inp(0) isn't valid
	ori	0x68	;make it an input instruction
	stxd		;store it for execution
	cpy2	rt1,sp	;rt1&sp now point to an empty byte to be overwritten by the inp instruction
	inc	rt1	;rt1 points to the 6x instruction
	sep	rt1	;execute it
;we will come back to here with the input byte in D
	inc	sp	;step over the work area
	plo	retVal	;save it to return
	ldi	0
	phi	retval	;clear top byte
+	inc	sp	;need to get rid of the 6x instruction
	inc	sp	;and the D3
	Cretn		;and we're done
	
_out:		;raw port output
		;stores a small tailored program on the stack and executes it
		;this could be bolder:
		;store the program as 6x cc D5 where x is the port number and cc is the char
		;then SEP sp
		;the D5 would return to the calling program and finish fixing the stack.
		;saves 6 instructions but it's a bit tricky.
	dec	sp	;work backwards
	ldi	0xD3	;return instruction
	stxd		
	cpy2	rt1,sp	;rt1 will point to the OUT instruction
	glo	regarg1	;get the port number
	ani	0x07	;clean it
	ori	0x60	;make it an out instruction - 60 is harmless
	stxd		;store it for execution
	glo	regarg2	;get the byte to be written
	str	sp	;store it where sp points
	sep	rt1	;execute it
;we will come back to here with sp stepped up by one
+	inc	sp	;need to get rid of the 6x instruction
	inc	sp	;and the D3
	Cretn		;and we're done
	
	
