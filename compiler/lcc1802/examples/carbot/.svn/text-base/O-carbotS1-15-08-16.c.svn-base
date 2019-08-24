//olduino carbot with sharp front sensor
//Trying lessons from the mule: sharp reverse at end of turn, no chatter, double call to sharpy
//fairly successful
#include <olduino.h>
#include <nstdlib.h> //supports c d s x l cx
#include "cpu1802spd4port7.h"
#include "softpwm.h"
#include "carbot.h"
#include "pingBN.h"
unsigned int wdist,oldwdist, fprox; // distance to wall on right current & previous, proximity of barrier in front
#define maxfprox 200 //max front barrier proximity
#define clearfprox 150 //indicates the road ahead is clear
#define minwdist 30 //min right barrier dist
#define basespeed 192 //128/0/15 worked fairly well but slow
#define lowspeed 16
#define leftdelay 5
#define cruisecycles 15

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
void killturn(){//briefly reverses power to both motors
	digitalWrite(pwmb,LOW);//kill power right
	digitalWrite(pwma,LOW);//kill power left
	digitalWrite(ain1,HIGH); digitalWrite(ain2,LOW);
	digitalWrite(bin1,LOW); digitalWrite(bin2,HIGH);
	digitalWrite(pwmb,HIGH);//full power right
	digitalWrite(pwma,HIGH);//full power left
	delay(5);
	digitalWrite(pwmb,LOW);//kill power right
	digitalWrite(pwma,LOW);//kill power left
}
void hardleft(){// turn with left wheel running backwards
	printf("L>\n");
	digitalWrite(pwmb,HIGH);//full power right
	digitalWrite(pwma,HIGH);//full power left
	digitalWrite(bin1,HIGH); digitalWrite(bin2,LOW);
	digitalWrite(ain1,LOW); digitalWrite(ain2,HIGH); //reverse left wheel
	delay(leftdelay);
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
void cruiseAlongWall(){
	if (0!=wdist) oldwdist=wdist; //track the wall distance after the first time
	wdist=pingQ()/2; //get the wall distance in cm
	printf("cw %d\n",wdist);
	if (wdist<minwdist){
		tooclose();
	}else{
		toofar();
	}
	//the routines above will have set the motor power levels, now we activate them
	digitalWrite(bin1,HIGH); digitalWrite(bin2,LOW);
	digitalWrite(ain1,HIGH); digitalWrite(ain2,LOW);
	pwmcycleN(cruisecycles);//forward a bit
}

void main(){
	unsigned int ttl=300; //time to live limit,
	printf("Carbot O-carbotS1-15-08-15.c with deliberate reverse at end of turn \n");
	//printf("maxfprox %d, minwdist %d\n",maxfprox,minwdist);
	//printf("basespeed %d, lowspeed %d\n",basespeed,lowspeed);
	//printf("leftdelay %d, cruisecycles %d\n",basespeed,lowspeed,leftdelay,cruisecycles);
	printf("no chatter\n");
	PIN4=0x80;out(4,0x80);
	while(ttl!=00){
		//printf("@ %d:",ttl);
		fprox=sharp2();
		if (fprox<clearfprox){ // we have cleared the barrier
			killturn();//kill any turn that was going on
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
