;Feb 8 2013, first version of assembler routines for olduino support	
;may 31 - incredibly, there's an error in digitalWrite.  lda2 changed to ldAD
;digitalWrite(unsigned char n, unsigned char hilo){ //set a bit in the output port on or off
	align 64	;needed to make sure all on same page
_digitalWrite:
	glo regArg1	;get the bit number
	adi $$bvtable&255	;add the table offset
	plo memaddr
	ghi RPC		;get the top byte of the current page
	phi memaddr	
	ldn memaddr	;pick up the bit pattern
	plo rt1		;save it in a temp
	ldAD memaddr,_PIN4 ;address the current port value
	sex memaddr	;prepare to change it
	glo regArg2	;get on/off switch
	bz $$setbitoff
; here we have the bit pattern in rt1 and we're ready to apply it with OR
	glo rt1		;get the bit value back
	or		;apply it
	str memaddr	;and save it
	br $$outit	;go fnish up
$$setbitoff:
	glo rt1		;get the bit pattern
	xri 0xff	;reverse it
	and		;combine it with the existing pin value
	str memaddr	;and save it
;here we gave set/reset the correct bit in PIN4 and we just have to send it out
$$outit:
	out 4		;X was already set to memaddr
	sex sp		;reset X
	cretn
$$bvtable db 1,2,4,8,16,32,64,128	;table of bit values
;int digitalRead(unsigned char pin){//for now this will always read ef3
	align 8	;protect jump boundary
_digitalRead:
	ldi 0		;default is false
	plo R15
	phi R15
	b3 +		;i have to reverse the sense of the external line
	inc R15		;if external line is high, supply a 1
+	cretn
