#include "nstdlib.h"
#include "olduino.h"
#define lcdreset 6
#define lcdcmd 5
unsigned char spixfer(){
	asm("	glo 12\n"
		"	dec 2\n"
		"	str 2\n"
		"	out 6\n"
		"	sex 3\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	sex 2\n"
		"	dec 2\n"
		"	inp 6\n"
		"	plo 15\n"
		"	inc 2\n"
		"	cretn\n");
}
void main()
{
	unsigned char what;
	PIN4=0; out4(0);
	setqOn();
	digitalWrite(lcdreset,LOW);digitalWrite(lcdreset,HIGH);//reset sequence
	setqOff();
	digitalWrite(lcdcmd,LOW); //sending commands
	what=spixfer(0x20);
	what=spixfer(0x0C);
	setqOn();
	digitalWrite(lcdcmd,HIGH); //sending data
	what=spixfer(0xff);
	what=spixfer(0xFf);
	what=spixfer(0xff);
	what=spixfer(0xFf);
	what=spixfer(0xff);
	what=spixfer(0xFf);
	what=spixfer(0xff);
	what=spixfer(0xFf);
}

#include <olduino.c> //for the delay routine
#include <nstdlib.c>
//#include "hwlcd.c"
