#include <olduino.h>
#include <nstdlib.h>
int pwma=0,ain1=1,ain2=2; //drive left motor in1+ and in2- control direction
int pwmb=4,bin1=5,bin2=6; //drive right motor in1+ and in2- control direction

void  setdirection(int d1,int d2,int d3,int d4){ //set the motors to counter-rotating
  	digitalWrite(d1,HIGH);
  	digitalWrite(d2,LOW);
  	digitalWrite(d3,HIGH);
  	digitalWrite(d4,LOW);
}
void goforhalf(int howlong){//run the motors forward at half dutycycle
	int howmany=(howlong*1000)/2; //rough number of passes for the requested time
 	setdirection(ain1,ain2,bin1,bin2);
 	while(howmany-->0){
	 	digitalWrite(pwma,HIGH); digitalWrite(pwmb,HIGH); //turn on both motors
	 	digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors
	}
	//while loop ends with motors off so we're done
}
void goforward(int howlong){
 	setdirection(ain1,ain2,bin1,bin2);
 	digitalWrite(pwma,HIGH); digitalWrite(pwmb,HIGH); //turn on both motors
 	delay(howlong*1000);
 	digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors
}
 void turnright(){
 	setdirection(ain1,ain2,bin2,bin1);
	digitalWrite(pwma,HIGH); digitalWrite(pwmb,HIGH); //turn on both motors
 	delay(100);
 	digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors
}
unsigned int	pinger(){ //read an ultrasonic ping distance sensor
//pulsing the Q line high then low starts the ultrasonic sensor
//it responds in around a ms with a pulse on EF1 with a length equal to the echo time
//the distance in cm is approximately (flight time in microseconds) /29 (inverse speed of sound in us/cm)/2 (round trip)
//with the mc running at 1.6mhz, each instruction is about 10 us
// so a 3 inst. loop yields a rough result in cm for the round trip
	asm("	req\n"	//make sure Q is low
		"	seq\n"	//begin a short pulse
		"	seq\n"	//extend the pulse to 20 us
		"	req\n" //end the short pulse
		"	ldaD R15,0\n"
		"	lbr yn1\n"	//branch to aligned code area
		"	align 8\n" //align for short branches
		"yn1: b1 yn1\n"	//wait for the return pulse to start
		"nn1: inc R15\n"	//count pulse length
		"	skp\n	idl\n"	//soak up one instruction time
		"	bn1 nn1\n"	//keep counting while return pulse is high
		"	Cretn\n"		//return to caller with count in r15
	);
//the cretn above returns the count to the caller.
	return 0; //not executed - just prevents an error message
}

void loop() {
	if (pinger()>60){//clear field
 		goforhalf(1);
	}else{
	 	turnright();
	}
}
void blipq(){//quick pulse on Q
	asm("	seq\n");
	delay(100);
	asm("	req\n");
	delay(100);
}
void main(){
	int j=100;
	blipq();blipq();
	while(j-->0){
		loop();
	}
}
#include <olduino.c>
#include <nstdlib.c>
