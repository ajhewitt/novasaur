/*
	Toggle the bits on port 4
*/
#include "nstdlib.h"
#include "olduino.h"
void mysetqOn(){
	asm("	seq\n");
}
void misoget(){
	asm(
		"	dec 2\n"
		"$$in6again:\n"
		"	inp 6\n"
		"	br $$in6again\n");
}
void mosiput(){
	asm(
		"$$out6again:\n"
		"	sex 2\n"
		"	dec 2\n"
		"	out 6\n"
		"	br $$out6again\n");
}
void spisend(){
	asm("	sex 3\n"
		"$$spiagain:\n"
		"	out 4\n	db 00\n"
		"	out 6\n	db 0x55\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 4\n	db 0xff\n"
		"	br $$spiagain\n");
}
unsigned char spisendrxv(){
	asm("	sex 3\n"
		"	out 4\n	db 00\n"
		"	out 6\n	db 0xaa\n"
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
		"	sex 3\n"
		"	out 4\n	db 0xff\n"
		"	sex 2\n"
		"	cretn\n");
		return 0; //not executed but it keeps the compiler happy
}
void go4it(){
	asm("	sex 3\n"
		"	out 1\n"
		"	db	0x55\n"
		"	out 2\n"
		"	db	0xaa\n"
		"	out 3\n"
		"	db	0x55\n"
		"	out 6\n"
		"	db	0xaa\n"
		"	out 7\n"
		"	db	0x55\n"
		"	sex 2\n"
		"	seq \n");
}
void go2it(){
	asm("	sex 3\n"
		"again2it:\n"
		"	out 2\n"
		"	db	0xaa\n"
		"	br again2it\n");
}
void go6it(){
	asm("	sex 3\n"
		"$$again6it:\n"
		//"	seq\n"
		"	out 6\n" "	db	0xAA\n"
		//"	req\n"
		"	br $$again6it\n");
}
void main()
{
	unsigned char what;
	PIN4=0;
	go6it();
/*
	while(1);
 	setqon();delay(17);setqoff();
	//delay(3000);
	out4(0xff); delay(42);out4(0);
	while(1);
	while(1){
		setqon();
		out(6,0xAA);
		delay(250);
		setqoff();
		delay(750);
	}
*/
}

#include <olduino.c> //for the delay routine
#include <nstdlib.c>
