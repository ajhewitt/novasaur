/*
    Ping Ultrasonic Sensor
	copied from former C library - used ted rossin's compiler
*/
#include <olduino.h>
#include <nstdlib.h>
#define putc(x) out(7,x)
#define pingpin 3
unsigned int	pinger(){ //read an ultrasonic ping distance sensor
//pulsing the Q line high then low starts the ultrasonic sensor
//it responds in around a ms with a pulse on EF1 with a length equal to the echo time
//the distance in cm is approximately (flight time in microseconds) /29 (inverse speed of sound in us/cm)/2 (round trip)
//with the mc running at 1.6mhz, each instruction is about 10 us
// so a 3 inst. loop yields a rough result in cm for the round trip
	digitalWrite(pingpin,LOW); //make sure it's low
	digitalWrite(pingpin,HIGH); //raise
	digitalWrite(pingpin,LOW); //and lower it
	asm("	seq\n" visual aid
		"	ldaD R15,0\n"
		"yn1:	b1 yn1\n"	//wait for the return pulse to start
		"nn1:	inc R15\n"	//count pulse length
		"		skp\n	idl\n"	//soak up one instruction time
		"		bn1 nn1\n"	//keep counting while return pulse is high
		"		req\n"	//visual aid
		"		Cretn\n"		//return to caller with count in r15
	);
//the cret above returns the count to the caller.
	return 0; //not executed - just prevents an error message
}

void main()
{
	unsigned int pingdist;  //distance to obstace in cm
	printf("Pinger Here Aug 13 \n");
	while(1){ //loop
		pingdist=pinger()>>1; //get distance in cm
		printf("Distance is approx. %u cm\n",pingdist);
	}
}
#include <olduino.c>
#include <nstdlib.c>
