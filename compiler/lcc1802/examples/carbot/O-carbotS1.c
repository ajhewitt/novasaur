//olduino carbot simple version Jan 24, 2015
//15-04-26 using <> version of cpu1802spd4port7.h
//15-04-29 cruising speed increased, left turn now 5 ms
#include <olduino.h>
#include <nstdlib.h> //supports c d s x l cx
#include <cpu1802spd4port7.h>
#include "softpwm.h"
#include "carbot.h"
#include "pingBN.h"
unsigned int wdist,oldwdist, fprox; // distance to wall on right current & previous, proximity of barrier in front
#define maxfprox 160 //max front barrier proximity
#define maxwdist 30 //min right barrier dist
#define minwdist 25 //min right barrier dist
#define basespeed 255	//was 192
#define lowspeed 64	//was 32
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
void killdrive(){//stops both motors
	digitalWrite(pwmb,LOW);//kill power right
	digitalWrite(pwma,LOW);//kill power left
}
void hardleft(){//5 ms turn with left wheel running backwards
	printf("L>\n");
	digitalWrite(pwmb,HIGH);//full power right
	digitalWrite(pwma,HIGH);//full power left
	digitalWrite(bin1,HIGH); digitalWrite(bin2,LOW);
	digitalWrite(ain1,LOW); digitalWrite(ain2,HIGH); //reverse left wheel
	delay(1); //nominal delay only
}

void tooclose(){ //if we are closer than minwdist to the wall on our right side
    if (wdist>oldwdist) {//but going the right way
		analogWrite(pwma,basespeed);analogWrite(pwmb,basespeed); //proceed
		printf(" wf-1 ");
    }
    else{
		analogWrite(pwma,lowspeed);analogWrite(pwmb,basespeed); //bear left
		printf(" wvlft ");
    }
}
void toofar(){//if we are further than minwdist from the wall on our right side
    if (wdist<oldwdist) {//but going the right way
		analogWrite(pwma,basespeed);analogWrite(pwmb,basespeed); //proceed
		printf(" wf-2 ");
    }
    else{
		analogWrite(pwma,basespeed);analogWrite(pwmb,lowspeed); //bear right
		printf(" wvrt ");
    }
}

void inthezone(){ //if we are between minwdist and maxwdist
	analogWrite(pwma,basespeed);analogWrite(pwmb,basespeed); //proceed
	printf(" wf-3 ");
}

void cruiseAlongWall(){
	if (0!=wdist) oldwdist=wdist; //track the wall distance after the first time
	wdist=pingQ()/2; //get the wall distance in cm
	printf("cw %d\n",wdist);
	if (wdist<minwdist){
		tooclose();
	}else if (wdist>maxwdist){
		toofar();
	}else{
		inthezone();
	}
	//the routines above will have set the motor power levels, now we activate them
	digitalWrite(bin1,HIGH); digitalWrite(bin2,LOW);
	digitalWrite(ain1,HIGH); digitalWrite(ain2,LOW);
	pwmcycleN(15);//forward a bit
}

void main(){
	unsigned int ttl=300; //time to live limit,
	printf("Simpler Panopticon Carbot(L=1,B=255,S=64,min/max=25/30) O-carbotS1.c\n");
	PIN4=0x80;out(4,0x80);
	while(ttl!=00){
		printf("@%d:",ttl);
		digitalWrite(7,LOW);fprox=sharpy(); digitalWrite(7,HIGH);
		printf("<%d ",fprox);
		if (fprox<maxfprox){ // more than 1 ft from barrier
			killdrive();//kill any turn that was going on
			printf("F>\n");
			cruiseAlongWall();//set a course to track the wall
		}else{
			hardleft();
		}
		ttl--; //reduce time to live
	}
	PIN4=0;out(4,0); //kill it all
}
#include <olduino.c>
#include <nstdlib.c>
#include "softpwm.c"
#include "pingBN.c"
