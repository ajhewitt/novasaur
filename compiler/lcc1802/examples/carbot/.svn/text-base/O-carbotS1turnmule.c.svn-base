//olduino carbot simple turn mule August 15 2015
//
#include <olduino.h>
#include <nstdlib.h> //supports c d s x l cx
#include "cpu1802spd4port7.h"
#include "carbot.h"
#define maxfprox 160 //max front barrier proximity

unsigned int sharpy(){  //reads the Sharp GP2D12 IR rangefinder via the MCP3002 ADC, returns raw ADC value
	asm("	dec	sp\n" //make a work area
		"	sex 3\n"	//set x to pc
		"	out 6\n	db 0x68\n"	//send 68 to read channel 0
		"	sex sp\n	inp 6\n" //pick up top bits
		"	ani 3\n	phi 15\n"	//put bits 8&9 of result into return register

		"	sex 3\n"	//set x to pc
		"	out 6\n	db 0xAA\n"	//send pattern to read low bits
		"	sex sp\n	inp 6\n	plo 15\n" //pick up low bits to return register
		"	inc	sp\n"	//restore stack pointer
		"	cretn\n");	//actual return
	return 0;	//dummy return for compiler
}
unsigned int sharp2(){//read the sensor twice and return the lower reading to ignore spikes
	unsigned int fprox1,fprox2;
	digitalWrite(7,LOW);fprox1=sharpy(); digitalWrite(7,HIGH);
	digitalWrite(7,LOW);fprox2=sharpy(); digitalWrite(7,HIGH);
	return min(fprox1,fprox2);
}
void killdrive(){//stops both motors
	digitalWrite(pwmb,LOW);//kill power right
	digitalWrite(pwma,LOW);//kill power left
}
void turn(unsigned int howlong){
		digitalWrite(pwmb,HIGH);//full power right
		digitalWrite(pwma,HIGH);//full power left
		digitalWrite(bin1,HIGH); digitalWrite(bin2,LOW);
		digitalWrite(ain1,LOW); digitalWrite(ain2,HIGH); //reverse left wheel
		delay(howlong);
		digitalWrite(pwmb,LOW);//kill power right
		digitalWrite(pwma,LOW);//kill power left
}
void main(){
	unsigned int fprox=0,ttl=5;
	printf("Carbot Turn Mule maxfprof=%d ttl=%d\n",fprox,ttl);
	PIN4=0x80;out(4,0x80);
  while(ttl-- >0){
	fprox=sharp2();
	while(fprox<maxfprox){
		fprox=sharp2();
	}
	asm(" seq\n");
	turn(5);
	//delay(5);
	fprox=sharp2();
	while(fprox>=(maxfprox-50)){
		turn(5);
		//delay(5);
		fprox=sharp2();
	}
	asm(" req\n");
	//following is an attempt to stop dead by briefly reversing the motors
		digitalWrite(ain1,HIGH); digitalWrite(ain2,LOW);
		digitalWrite(bin1,LOW); digitalWrite(bin2,HIGH);
		digitalWrite(pwmb,HIGH);//full power right
		digitalWrite(pwma,HIGH);//full power left
		delay(5);

	PIN4=0;out(4,0); //kill it all
  }
}
#include <olduino.c>
#include <nstdlib.c>
