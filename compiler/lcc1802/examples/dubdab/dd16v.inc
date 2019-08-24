_dubdab16v:	
;experimental binay-ascii conversion using the double-dabble algorithm for 16 bits
;thanks to Charles Richmond for the suggestion and code
;15-04-29 upgraged to variable digit processing
;interger is passed in r12
;buffer pointer is passed in r13
;a pointer to the 1st non-zero byte in the buffer is passed back in r15
;r8-11 are used as temps
;r8 is the working pointer
;r15.0 is bit count(16) and the return value register
;r10.0 is the count of digits as the bcd number is developed
;r9.0 is digit count for the current pass
	alu2i r8,r13,6,adi,adci	;point to the terminator position
	ldi 0	;source a 0
	str r8	;terminate the buffer
	dec r8	;back to units position
	str r8	;initialize bcd number to 0
	ldi 1	;vdc initialize the bcd digit count at 1
	plo r10 ;vdc
;at this point the bcd return buffer has been initialized and the digit count is 1
	ldi 16	;bit count
	plo r15
;now i'm going to spin off any leading 0's in the binary number
$$cktop:
	ghi r12		;get the top bit of the number
	shl		;check for a 1
	bdf $$bitloop	;move on if we have one
	shl2 r12	;shift the input number
	dec r15		;reduce the number of times to shift
	glo r15
	bnz $$cktop	;
	inc r15		;our whole number was 0 but force at least one pass
$$bitloop:
	glo r10	;digit count vdc
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
	
	shl2 r12 ;shift the input number
	
	glo r10	;load the digit count again vdc
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
;we are now out of digit positions but if DF is 1 we need another digit vdc
	bnf $$nextbit	;no need to increase digits vdc
	inc r10	;increase BCD digit count vdc
	dec r8	;back up pointer to new digit position vdc
	ldi 1	;source a 1 vdc
	str r8	;initialize the position vdc

$$nextbit:	
	dec r15
	glo r15
	bnz $$bitloop
	
	cpy2 r15,r8	;save the starting location of the digits to return
	glo r10		;digit count again vdc
	plo r9
$$upnxt:
	ldn r8		;get digit
	ori 0x30	;make ascii
	str r8		;put it back
	inc r8		;next digit
	dec r9		;counter
	glo r9
	bnz $$upnxt	;upgrade all spots

	cretn		;return with pointer to 1st digit in r15
