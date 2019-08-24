/* TMS1638 code adapted from the Library for TM1638.
Copyright (C) 2011 Ricardo Batista <rjbatista at gmail dot com>
*/
#include "olduino.h" //for digitalWrite
#include "nstdlib.h" //for min
#define tmdatapin 7
#define tmclockpin 4
#define tmclockbit 1<<tmclockpin
#define strobePin 5
#define tmsred 1
#define tmsgreen 2
typedef unsigned char uchar;

void send(unsigned char data){ //shift out a byte -lsb first
	asm("	ldi 8	; loop count\n"
		"	plo rt1	; in temp register\n"
		"	lda2 rt2,'D',_PIN4,0	;point rt2 to PIN4 which holds current output data\n"
		"	ldn	 rt2	;pick up PIN4 value\n"
		"	ani	 0x7f!(1<<4) ;turn off data and strobe bits\n"
		"	str  rt2\n	;and put it back\n"

		"$$slp: ; we will do this 8 times\n"
		"	sex  rt2		;temporarily use rt2 as X\n"
		"	glo regArg1	; get the data byte\n"
		"	ani	0x01 ;isolate the bottom bit\n"
		"   lsz     ;need to have it in the top position though\n"
		"   ldi 0x80 ;there it is\n"
		"	or		 ; combine PIN4 with the current data bit\n"

		"	sex sp	;return to normal index reg\n"
		"	dec sp	; work space\n"
		"	str sp	;prep for output\n"
		"	out 4 	;put it out\n"
		"	ori 1<<4 ;blip the spi clock\n"
		"	dec sp	; work space\n"
		"	str sp	;prep for output\n"
		"	out 4 	;put it out\n"

		"	glo	regArg1	; get the data back\n"
		"	shr		; rotate the next bit into position\n"
		"	plo regArg1	;prepare to repeat\n"

		"	dec rt1 ;decrement loop count\n"
		"	glo rt1	;get the loop count\n"
		"	lbnz $$slp ; back for more\n"
	);
}

void sendCommand(uchar cmd){
  digitalWrite(strobePin, LOW);
  send(cmd);
  digitalWrite(strobePin, HIGH);
}

void sendData(uchar address, uchar data){
  sendCommand(0x44);
  digitalWrite(strobePin, LOW);
  send(0xC0 | address);
  send(data);
  digitalWrite(strobePin, HIGH);
}
void setLED(unsigned char color, unsigned char pos)
{
    sendData((pos << 1) + 1, color);
}
void setDisplay(const unsigned char values[], unsigned char size){
  unsigned char i;
  for (i = 0; i<size; i++) {
    sendData(i<<1, values[i]);
  }
}
void tms1638init(){
  unsigned char i;
  digitalWrite(strobePin, HIGH);
  digitalWrite(tmclockpin, HIGH);
  sendCommand(0x40);
  sendCommand(0x80 | (8) | min(7, 3));
  digitalWrite(strobePin, LOW);
  send(0xC0);
  for (i = 0; i < 16; i++) {
    send(0x00);
  }
  digitalWrite(strobePin, HIGH);
}
void setDisplayTo1802(uchar offset)
{

//The bits are displayed by mapping below
//  -- 0 --
// |       |
// 5       1
//  -- 6 --
// 4       2
// |       |
// -- 3 --  .7
//

const unsigned char RCA_DATA[] = {
  0x00, //0b00000000 -blank
  0x00, //0b00000000 -blank
  0x00, //0b00000000 -blank
  0x00, //0b00000000 -blank
  0x06, //0b00000110 -	1
  0x7f, //0b01111111 -	8
  0x3f, //0b00111111 -	0
  0x5b, //0b01011011 -	2
  0x00, //0b00000000 -blank
  0x00, //0b00000000 -blank
  0x00, //0b00000000 -blank
  0x00  //0b00000000 -blank
  };
  setDisplay(RCA_DATA+offset, 8);
}
void sparkle(){  //just run the leds in sequence
	static unsigned char pos=3,color=tmsred;
  		setLED(tmsgreen,pos);
  		delay(150);
  		setLED(0,pos);
  		delay(150);
  		pos=(pos+1)%8;
  		setLED(tmsgreen,pos);
  		delay(150);
  		setLED(0,pos);
  		pos=(pos+1)%8;
}

void main(){
  tms1638init();
  delay(10);
  while(1){
    setDisplayTo1802(4);
    sparkle();
    setDisplayTo1802(0);
    sparkle();
  }
}
#include "olduino.c"
#include "nstdlib.c"
