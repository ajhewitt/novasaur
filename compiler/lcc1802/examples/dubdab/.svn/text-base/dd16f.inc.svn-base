_dubdab16f:	
;experimental binay-ascii conversion using the double-dabble algorithm for 16 bits
;thanks to Charles Richmond for the suggestion and code
;interger is passed in r12
;buffer pointer is passed in r13
;a pointer to the 1st non-zero byte in the buffer is passed back in r15
;r8-11 are used as temps
;r8 is the working pointer
;r15.0 is bit count(32) and the return value register
;r9.0 is digit count
;15-03-06 first optimization prep - need to run both shift and pre-check backwards.
	cpy2 r8,r13 ;buffer address
	ldi 6	;digit count+1 for trailing 0
	plo r9
$$clrlp:	;clear the passed buffer
	ldi 0	
	str r8	;clear a byte
	inc r8
	dec r9
	glo r9	;check the count
	bnz $$clrlp ;back for more
	dec r8	;back off to terminating 0
	cpy2 r14,r8 ;save end location

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
	ldi 5	;digit count
	plo r9
	cpy2 r8,r14 ;point past the units digit
$$dcklp:
	dec r8
	ldn r8 	;pick up a digit
	smi 5	;see if it's greater than 4
	bnf $$dnoadd ;if not, bypass add
	adi 0x08	;add the 5 black and 3 more
	str r8	;put it back
$$dnoadd:
	dec r9	;decrement digit count
	glo r9
	bnz $$dcklp ;and back for next digit
	
	shl2 r12 ;shift the input number
	
	ldi 5	;load the digit count again
	plo r9

	cpy2 r8,r14	;point r8 just past the units location - ready to walk back
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
	
	cpy2 r15,r13	;save the starting location of the number
	ldi 5		;digit count again
	plo r9
$$upnxt:
	ldn r8		;get digit
	ori 0x30	;make ascii
	str r8		;put it back
	inc r8		;next digit
	dec r9		;counter
	glo r9
	bnz $$upnxt	;upgrade all spots
	
	ldi 4		;max number of 0's to skip
	plo r9		;number of leading 0's to skip
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
