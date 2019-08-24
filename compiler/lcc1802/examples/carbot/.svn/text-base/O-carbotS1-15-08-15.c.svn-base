//olduino carbot with sharp front sensor
//This version turns too hard
#include <olduino.h>
#include <nstdlib.h> //supports c d s x l cx
#include "cpu1802spd4port7.h"
#include "softpwm.h"
#include "carbot.h"
#include "pingBN.h"
unsigned int wdist,oldwdist, fprox; // distance to wall on right current & previous, proximity of barrier in front
#define maxfprox 200 //max front barrier proximity
#define minwdist 30 //min right barrier dist
#define basespeed 128
#define lowspeed 0
#define leftdelay 1
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
void killdrive(){//stops both motors
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
	printf("cw\n"); //printf("cw %d\n",wdist);
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
	printf("Carbot O-carbotS1-15-08-15.c\n");
	printf("maxfprox %d, minwdist %d, basespeed %d, lowspeed %d, leftdelay %d, cruisecycles %d\n",maxfprox,minwdist,basespeed,lowspeed,leftdelay,cruisecycles);
	printf("no ttl print, no prox print, no cw dist print\n");

	PIN4=0x80;out(4,0x80);
	while(ttl!=00){
		//printf("@ %d:",ttl);
		digitalWrite(7,LOW);fprox=sharpy(); digitalWrite(7,HIGH);
		printf("<");//printf("<%d ",fprox);
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
/* noon trial - turned a bit too far
@ 267:<191 L>
11:54:50.198> @ 266:<195 L>
11:54:50.307> @ 265:<207 L>
11:54:50.432> @ 264:<211 L>
11:54:50.432> @ 263:<202 L>
11:54:50.619> @ 262:<173 L>
** 5 cycles 420 ms

Later on test stand, no motor
13:49:28.815> @ 300:<260 L>
13:49:28.815> @ 299:<261 L>
13:49:28.815> @ 298:<260 L>
13:49:29.064> @ 297:<257 L>
13:49:29.064> @ 296:<259 L>
13:49:29.064> @ 295:<257 L>
13:49:29.064> @ 294:<264 L>
13:49:29.283> @ 293:<259 L>
**8 cycles 500 ms

Later on test stand WITH motor and some free run lead in
13:57:41.088> @ 262:223 L>
13:57:41.088> @ 261:<224 L>
13:57:41.229> @ 260:<234 L>
13:57:41.229> @ 259:<247 L>
13:57:41.354> @ 258:<143 F>
**5 cycles 250 ms

Later on test stand witn NO motor and some free run lead in
14:01:19.832>  wvlft @ 280:<229 L>
14:01:19.894> @ 279:<260 L>
14:01:20.019> @ 278:<283 L>
14:01:20.081> @ 277:<283 L>
14:01:20.144> @ 276:<282 L>
14:01:20.222> @ 275:<286 L>
**5 cycles in 330 ms


No ttl print
14:09:26.021> <165 L>
14:09:26.021> <180 L>
14:09:26.099> <177 L>
14:09:26.146> <183 L>
14:09:26.208> <175 L>
**5 cycles 190 ms
*/
