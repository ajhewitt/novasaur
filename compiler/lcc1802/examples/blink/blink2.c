/*
    blink the q led
*/
#include "nstdlib.h"
#include "olduino.h"
void mysetqOn(){
	asm("	seq\n");
}
void main()
{
	unsigned char flippy=0;
	while(1){
		out(4,flippy);
		if (flippy==0){
			flippy=0xff;
		}else {
			flippy=0;
		}
		//out(7,'!');
		mysetqOn();
		delay(250);
		setqOff();
		delay(250);
		mysetqOn();
		delay(250);
		setqOff();
		delay(250);
		mysetqOn();
		delay(250);
		setqOff();
		delay(1000);
	}
}

#include "olduino.c" //for the delay routine
#include <nstdlib.c> //for printf
