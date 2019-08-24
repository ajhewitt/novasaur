/*
	Toggle the bits on port 4
*/
#include "nstdlib.h"
#include "olduino.h"
void mysetqOn(){
	asm("	seq\n");
}
void main()
{
	while(1){
		mysetqOn();
		out(4,0xAA);
		delay(10000);
		setqOff();
		out(4,0x55);
		delay(10000);
	}
}

#include <olduino.c> //for the delay routine
#include <nstdlib.c>
