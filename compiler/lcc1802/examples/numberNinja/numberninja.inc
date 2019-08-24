_numberninja:
;fierce and flexible - be careful with the inputs!
;binay-ascii conversion originally based the double-dabble algorithm 
;handles variable length input and output
;thanks to Charles Richmond for the suggestion and code
;15-05-02 initial version
;POINTER to integer is passed in r12
;pointer to LAST BYTE of buffer is passed in r13
;number of bytes to convert is passed as the 3rd parameter
;a pointer to the 1st non-zero byte in the buffer is passed back in r15
;r8-11 are used as temps
;r13 is the working pointer to the BCD number
;r12 is the pointer to the input
;r15.0 is bit count in the current byte and the return value register
;r11.0 is the number of bytes to convert
;r10.0 is the count of digits as the bcd number is developed
;r9.0 is digit count for the current pass
	ld2 r11,'O',sp,(2+4); pick up the number of bytes to convert
	
	ldi 0	;source a 0
	str r13	;terminate the buffer
	dec r13	;back to units position
	str r13	;initialize bcd number to 0
	ldi 1	; initialize the bcd digit count at 1
	plo r10 ;

$$nxtbyte:
	ldi 8		;bits in byte
	plo r15
$$nxtbit:
	ldn r12		;pick up current byte
	shl		;check top bit
	bdf $$bitloop	;move on for a 1 bit
	str r12		;put the byte back
	
	dec r15		;decrement and test bits in byte
	glo r15
	bnz $$nxtbit 
	
	dec r11		;decrement and test bytes in number
	glo 11
	bz $$done	;the whole number was 0! no need for further processing
	
	inc r12		;point to the next byte
	br $$nxtbyte	;go back for it
$$bitloop:
	glo r10	;digit count 
	plo r9
$$dcklp:
	ldn r13 	;pick up a bcd digit
	smi 5	;see if it's greater than 4
	bnf $$dnoadd ;if not, bypass add
	adi 128	;add the 5 black and 3 more and 120 per charles
	str r13	;put it back
$$dnoadd:
	inc r13
	dec r9	;decrement digit count
	glo r9
	bnz $$dcklp ;and back for next digit
	
	ldn r12 ;shift the current byte of the input number
	shl
	str r12
	
	glo r10	;load the digit count again 
	plo r9
;r13 is now just past the units location and ready to walk back
$$dshlp:
	dec r13	;walk back from 0's position
	ldn r13	;get the digit back
	shlc	;continue the shift
;	phi r15 ;save it for the carry test
;	ani 0x0f ;clear the 10 bit
	str r13	;put the digit back
;	ghi r15	;now test for carry
;	smi 0x10 ; this will make df 1 if the 10 bit is set
	dec r9	;decrement the digit count
	glo r9
	bnz $$dshlp ;back for more if needed
;we are now out of digit positions but if DF is 1 we need another digit 
	bnf $$nextbit	;no need to increase digits 
	inc r10	;increase BCD digit count 
	dec r13	;back up pointer to new digit position 
	ldi 1	;source a 1 
	str r13	;initialize the position 

$$nextbit:	
	dec r15		;see if bits left in byte
	glo r15
	bnz $$bitloop
	
	dec r11		;see if bytes left in number
	glo r11
	bz $$done	
	inc r12		;point to next byte of number
	ldi 8		;prep for 8 more bits
	plo r15
	br $$bitloop
	
$$done: ;this is also used for for an early exit.  R13 and R10 must be correct	
	cpy2 r15,r13	;save the starting location of the digits to return
	glo r10		;digit count again 
	plo r9
$$upnxt:
	ldn r13		;get digit
	ori 0x30	;make ascii
	str r13		;put it back
	inc r13		;next digit
	dec r9		;counter
	glo r9
	bnz $$upnxt	;upgrade all spots
	cretn		;return with pointer to 1st digit in r15
