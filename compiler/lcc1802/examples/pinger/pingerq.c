/*
    Ping Ultrasonic Sensor
	copied from former C library - used ted rossin's compiler
*/
#include <olduino.h>
#include <nstdlib.h>
#define putc(x) out(7,x)
unsigned int	pinger(){ //read an ultrasonic ping distance sensor
//pulsing the Q line high then low starts the ultrasonic sensor
//it responds in around a ms with a pulse on EF1 with a length equal to the echo time
//the distance in cm is approximately (flight time in microseconds) /29 (inverse speed of sound in us/cm)/2 (round trip)
//with the mc running at 1.6mhz, each instruction is about 10 us
// so a 3 inst. loop yields a rough result in cm for the round trip
	asm("	req\n	req\n"	//make sure Q is low
		"	seq\n"	//begin a short pulse
		"	seq\n	seq\n	seq\n	seq\n"	//extend the pulse to 20 us
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

void main()
{
	unsigned int pingdist;  //distance to obstace in cm
	printf("Pinger Mule Here sept 6 \n");
	while(0){
		asm("	seq\n	seq\n	seq\n	seq\n	seq\n"	//extend the pulse to 20 us
			"	req\n");
		delay(400); //100 ms delay
	}
	while(1){ //loop
		pingdist=(pinger()+3)/5; //get distance in inches
		printf("distance is approximately %d inches\n",pingdist);
		delay(1000);
	}
}
#include <olduino.c>
#include <nstdlib.c>
