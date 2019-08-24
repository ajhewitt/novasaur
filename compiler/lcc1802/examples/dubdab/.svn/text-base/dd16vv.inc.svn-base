_dubdab16v:	
;experimental binay-ascii conversion using the double-dabble algorithm for 16 bits
;thanks to Charles Richmond for the suggestion and code
;15-04-29 upgraged to variable digit processing
;15-04-29 16vv treating 0 and first bit separately
;15-05-02 working with the binary number in memory
;integer is passed in r12
;buffer pointer is passed in r13
;a pointer to the 1st non-zero byte in the buffer is passed back in r15
;r8-11 are used as temps
;r8 is the working pointer
;r15.0 is bit count in the current byte and the return value register
;after storing the number, r12 is the count of bytes
;r10.0 is the count of digits as the bcd number is developed
;r9.0 is digit count for the current pass
	alu2i r8,r13,6,adi,adci	;point to the terminator position
	ldi 0	;source a 0
	str r8	;terminate the buffer
	dec r8	;back to units position
	str r8	;initialize bcd number to 0
	ldi 1	; initialize the bcd digit count at 1
	plo r10 ;
;at this point the bcd return buffer has been initialized and the digit count is 1
	pushr r12	;put the number on the stack
	ldi 2		;bytes to process
	plo r12
$$nxtbyte:
	ldi 8		;bits in byte
	plo r15
$$nxtbit:
	ldn sp		;pick up current byte
	shl		;check top bit
	bdf $$bitloop	;move on for a 1 bit
	str sp		;put the byte back
	
	dec r15		;decrement and test bits in byte
	glo r15
	bnz $$nxtbit 
	
	dec r12		;decrement and test bytes in number
	glo r12
	bz $$done	;the whole number was 0! no need for further processing
	
	inc sp		;point to the next byte
	br $$nxtbyte	;go back for it

$$bitloop:
	glo r10	;digit count 
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
	
	ldn sp ;shift the current byte of the input number
	shl
	str sp
	
	glo r10	;load the digit count again 
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
;we are now out of digit positions but if DF is 1 we need another digit 
	bnf $$nextbit	;no need to increase digits 
	inc r10	;increase BCD digit count 
	dec r8	;back up pointer to new digit position 
	ldi 1	;source a 1 
	str r8	;initialize the position 

$$nextbit:	
	dec r15		;see if bits left in byte
	glo r15
	bnz $$bitloop
	
	dec r12		;see if bytes left in number
	glo r12
	bz $$done	
	inc sp		;point to next byte of number
	ldi 8		;prep for 8 more bits
	plo r15
	br $$bitloop
	
$$done: ;this is also used for for an early exit.  R8 and R10 must be correct	
	cpy2 r15,r8	;save the starting location of the digits to return
	glo r10		;digit count again 
	plo r9
$$upnxt:
	ldn r8		;get digit
	ori 0x30	;make ascii
	str r8		;put it back
	inc r8		;next digit
	dec r9		;counter
	glo r9
	bnz $$upnxt	;upgrade all spots
	inc sp		;remove the last byte from the stack
	cretn		;return with pointer to 1st digit in r15
