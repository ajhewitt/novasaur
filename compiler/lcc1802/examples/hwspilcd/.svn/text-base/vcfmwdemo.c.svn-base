/*
Demo program for the Midwest Vintage Computer fair
Runs a standard animation on a nokia LCD
Reads an ultrasonic sensor and updates the display with a distance.
*/
#include <olduino.h>
#include <nstdlib.h>
#define putc(x) out(7,x)
#include <hspi2.h>
#include <hspi2Lcd.h>
#include <spiship.h>
#include <lcdchar.h>

void animone(){
	static unsigned int offset=01;
	{
		gotoXY(0,1); //position to 1st line with ship in it
		digitalWrite(lcdcmd,LCD_D); //get out of command mode
		LcdWriteN(spibytes+84+offset,84-offset);
		//if (offset>0){
			LcdWriteN(spibytes+84,offset);
		//}
		gotoXY(0,2); //position to 2nd line with ship in it
		digitalWrite(lcdcmd,LCD_D); //get out of command mode
		LcdWriteN(spibytes+168+offset,84-offset);
		//if (offset>0){
			LcdWriteN(spibytes+168,offset);
		//}
		gotoXY(0,3); //position to 3rd line with ship in it
		digitalWrite(lcdcmd,LCD_D); //get out of command mode
		LcdWriteN(spibytes+252+offset,84-offset);
		//if (offset>0){
			LcdWriteN(spibytes+252,offset);
		//}
	}
	offset++; if (offset>83) offset=1;
}

void pingerholder(){ //dummy function
//pinger() read an ultrasonic ping distance sensor
//pulsing the Q line high then low starts the ultrasonic sensor
//it responds in around a ms with a pulse on EF1 with a length equal to the echo time
//the distance in cm is approximately (flight time in microseconds) /29 (inverse speed of sound in us/cm)/2 (round trip)
//with the mc running at 1.6mhz, each instruction is about 10 us
// so a 3 inst. loop yields a rough result in cm for the round trip
	asm("	align 16\n" //make sure branches stay on page
		"_pinger:\n" //label looks like pinger() to C
		"	seq\n"	//begin a short pulse
		"	seq\n"	//extend the pulse to 20 us
		"	req\n" //end the short pulse
		"	ldaD R15,0\n"
		"yn1: b1 yn1\n"	//wait for the return pulse to start
		"nn1: inc R15\n"	//count pulse length
		"	skp\n	idl\n"	//soak up one instruction time
		"	bn1 nn1\n"	//keep counting while return pulse is high
		"	Cretn\n"		//return to caller with count in r15
	);
}

void main()
{
	char buff[8]; //buffer for ascii conversion
 	PIN4=0;			//initialize output port
	LcdInitialise();//and LCD
	LcdClear();
	LcdWriteN(spibytes,504);//write the base starship image
	while(1){//forever
		animone();//move the starship image one frame
		gotoXY(0,5);//point to the bottom line of the display to print the ping reading
		LcdString("Dist. ");LcdString(itoa((pinger()+3)/5,buff));LcdString(" in  ");
	}
}
#include <hspi2.c>
#include <hspi2Lcd.c>
#include <lcdchar.c>
#include <olduino.c>
#include <nstdlib.c>
