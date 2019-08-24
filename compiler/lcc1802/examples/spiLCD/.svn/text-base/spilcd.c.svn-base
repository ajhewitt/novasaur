/*
	an attempt to do bit-bang spi output from the 1802 olduino
	July 22 2012
*/
#include "olduino.h"
#include "lcd.h"
#include "spiship.h"
void main()
{

 	PIN4=0;
 	setqon();
	LcdInitialise();
	LcdClear(0x00);
 	setqoff();
 	delay(100);
 	setqon();
	LcdWriteN(spibytes,252);
	LcdWriteN(spibytes+252,252);
 	setqoff();
}
#include "olduino.c"
#include "lcd.c"
