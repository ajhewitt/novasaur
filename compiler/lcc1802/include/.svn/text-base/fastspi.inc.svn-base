;unsigned char xferspi(unsigned char value){
;  int i;
;  for(i=0;i<8;i++){
;    digitalWrite(mosi,(value&0x80));      //by setting mosi for each bit
;    value=(value<<1)|digitalRead(miso);;
;    digitalWrite(sck,HIGH);              //then pulsing the clock
;    digitalWrite(sck,LOW);
;  }
;  return value;
;}
	align	64
spisck:	equ	5
clkport: equ	2
spimosi: equ	7
_xferspif:	;spi transfer routine - uses bit 7 of port 4 for mosi, bit 4 for clock
	ldAD	memaddr,_PIN4	;point at the current value of the output port
	sex	memaddr
	ldi	8		;bit count
	plo	r8		;for loop exit test
$$loop:
	ldn	memaddr		;pick it up
	ani	0xff-0x80-(1<<spisck)	;clear clock and data bits
	str	memaddr		;now ready to combine with incoming data from R12
;
	glo	r12		;first parameter
	ani	0x80		;data bit
	or			;combine with PIN4 value
	str	memaddr		;prepare to send out
	out	4		;put out data bit with clock 0
	dec	memaddr		;back up the X register
;now we have to read the incoming data on ef3
	glo	r12		;get the data byte
	shl			;advance to the next bit
	b3	$$zeroin	;check the external line
	ori	1		;if ef3 is high, put a 1 in bit 0
$$zeroin:			
	plo	r12		;put it back
;now we clock out our outbound bit
	ldn	memaddr
	ori	(1<<spisck)		;raise the clock bit
	str	memaddr
	out	4		;send it out
	dec	memaddr
	ani	0xff-(1<<spisck)	;clear the clock bit
	str	memaddr
	out	4		;send out the falling clock edge
	dec	memaddr		
;now we check the bit count to do the rest of the byte
	dec	r8		;bit count-1
	glo	r8		;see if we're done
	bnz	$$loop		;go back for more if not
;clean up and return the incoming data
	glo	r12
	plo	retval		;put return value in correct register
	zext	retval
	sex	sp		;re-establish sp as X
	cretn
	align	64
_xferspif2:	;spi transfer routine - uses bit 7 of port 4 for mosi, N1 for clock
	ldAD	memaddr,_PIN4	;point at the current value of the output port
	sex	memaddr
	ldi	8		;bit count
	plo	r8		;for loop exit test
$$loop:
	ldn	memaddr		;pick it up
	ani	0xff-0x80-(1<<spisck)	;clear clock and data bits
	str	memaddr		;now ready to combine with incoming data from R12
;
	glo	r12		;first parameter
	ani	0x80		;data bit
	or			;combine with PIN4 value
	str	memaddr		;prepare to send out
	out	4		;put out data bit with clock 0
	dec	memaddr		;back up the X register
;now we have to read the incoming data on ef3
	glo	r12		;get the data byte
	shl			;advance to the next bit
	b3	$$zeroin	;check the external line
	ori	1		;if ef3 is high, put a 1 in bit 0
$$zeroin:			
	plo	r12		;put it back
;now we clock out our outbound bit
	out	clkport		;send out the clock pulse
	dec	memaddr
;now we check the bit count to do the rest of the byte
	dec	r8		;bit count-1
	glo	r8		;see if we're done
	bnz	$$loop		;go back for more if not(19 instructions/bit)
;clean up and return the incoming data
	glo	r12
	plo	retval		;put return value in correct register
	zext	retval
	sex	sp		;re-establish sp as X
	cretn
	align 64
_shiftoutf:	;spi shift out routine - uses bit 7 of port 4 for mosi, N1 for clock
	ldAD	memaddr,_PIN4	;point at the current value of the output port
	ldn	memaddr		;pick up PIN4 value
	ani	0x7f		;make sure mosi is off
	dec	sp		;make a work area
	str	sp		;save pin4 value
	ldi	8		;bit count
	plo	r8		;for loop exit test
$$loop:
	glo	regarg1		;get the value
	shl			;shift left for next bit
	plo	regarg1		;save it
	shrc			;get the top bit back
	ani	0x80		;isolate it
	or			;combine with PIN4 value
	dec 	sp		;make a work area
	str	sp		;place value to be output
	out 	4		;put it in the latch
	dec	sp		;prep for clock
	out	clkport		;send clock signal
	dec	r8		;bit count
	glo	r8
	bnz	$$loop		;back for more (13 instructions per byte)
	inc	sp		;release work area
	cretn
_sendwizrd:	;spi shift out 0F routine - uses bit 7 of port 4 for mosi, N1 for clock
subpc:	equ	3		;i'll need to chnge this
	ldAD	memaddr,_PIN4	;point at the current value of the output port
	ldn	memaddr		;pick up PIN4 value
	ani	0x7f		;make sure mosi is on for 0 part of 0F
	br	sendbdy		;go send 8 bits
_sendwizwrt:	;spi shift out F0 routine - uses bit 7 of port 4 for mosi, N1 for clock
	ldAD	memaddr,_PIN4	;point at the current value of the output port
	ldn	memaddr		;pick up PIN4 value
	ori	0x80		;make sure mosi is on for F part of F0
sendbdy:
	str	memaddr		;save pin4 value
	sex	memaddr
	out	4		;send it out
	dec	memaddr		;point back to PIN4
	xri	0x80		;prep to ttoggle mosi
	str	memaddr		;save it
	sex	subpc		;set up to toggle N1 *************
	out	clkport		;toggle out bit 7
	db	7		;dummy
	out	clkport		;toggle out bit 6
	db	6		;dummy
	out	clkport		;toggle out bit 5
	db	5		;dummy
	out	clkport		;toggle out bit 4
	db	4		;dummy
	sex	memaddr		;point back to pin4 with mosi off
	out	4		;send it out
	sex	subpc		;make pc
	out	clkport		;toggle out bit 3
	db	3		;dummy
	out	clkport		;toggle out bit 2
	db	2		;dummy
	out	clkport		;toggle out bit 1
	db	1		;dummy
	out	clkport		;toggle out bit 0
	db	0		;dummy
	sex	sp		;put things back to normal
	cretn
_xferspif3:	;fast spi using send	
_shiftinf:	;spi input routine - uses ef3 for miso, N1 for clock
	ldi	0		;initial value
	plo	retval		;prepare to return as an int
	phi	retval
	ldi	8		;bit count		
	plo	r8		;for read loop
$$loop:
;now we have to read the incoming data on ef3
	glo	retval		;get the data byte
	shl			;advance to the next bit
	b3	$$zeroin	;check the external line
	ori	1		;if ef3 is high, put a 1 in bit 0
$$zeroin:			
	plo	retval		;put it back
;now we cycle the clock for our next inbound bit
	dec	sp		;make a work area
	out	clkport		;clock the next bit
	
;now we check the bit count to do the rest of the byte
	dec	r8		;bit count-1
	glo	r8		;see if we're done
	bnz	$$loop		;go back for more if not(10 instructions per bit)

	sex	sp		;re-establish sp as X
	cretn
	
