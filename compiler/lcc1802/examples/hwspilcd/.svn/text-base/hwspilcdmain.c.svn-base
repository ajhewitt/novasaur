/*
	Display the COSMAC starship on a nokia LCD using hardware SPI shift register
	Nov 12 2013
*/
#include <olduino.h>
#include <nstdlib.h>
#include "hwspilcd.h"
#include <spiship.h>
void animate(){
	unsigned int offset;
	for (offset=0;offset<84;offset++){
		gotoXY(0,1); //position to 1st line with ship in it
		digitalWrite(lcdcmd,LCD_D); //get out of command mode
		LcdWriterN(spibytes+84+offset,84-offset);
		if (offset>0){
			LcdWriterN(spibytes+84,offset);
		}
		gotoXY(0,2); //position to 2nd line with ship in it
		digitalWrite(lcdcmd,LCD_D); //get out of command mode
		LcdWriterN(spibytes+168+offset,84-offset);
		if (offset>0){
			LcdWriterN(spibytes+168,offset);
		}
		gotoXY(0,3); //position to 2nd line with ship in it
		digitalWrite(lcdcmd,LCD_D); //get out of command mode
		LcdWriterN(spibytes+252+offset,84-offset);
		if (offset>0){
			LcdWriterN(spibytes+252,offset);
		}
		//delay(100);
	}
}

void main()
{
 	PIN4=0;
 	setqon();
	LcdInitialise();
	LcdWrite(LCD_D,0xFF);LcdWrite(LCD_D,0xFF);
	setqoff();
	while(1);
	LcdClear();
	LcdWriterN(spibytes,504);
	while(1){
	//animate();
}
}
#include "hwspilcd.c"
#include <olduino.c>
#include <nstdlib.c>
