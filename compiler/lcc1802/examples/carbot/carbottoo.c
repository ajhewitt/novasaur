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

void goforward(int howlong){
 	setdirection(ain1,ain2,bin1,bin2);
 	digitalWrite(pwma,HIGH); digitalWrite(pwmb,HIGH); //turn on both motors
 	delay(howlong*1000);
 	digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors
}
 void turnright(){
 	setdirection(ain1,ain2,bin2,bin1);
	digitalWrite(pwma,HIGH); digitalWrite(pwmb,HIGH); //turn on both motors
 	delay(1000);
 	digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors
}

void loop() {
 	goforward(2);
 	delay(100);
 	turnright();
 	delay(1000);
 }
void main(){
	asm("	seq\n");
	loop();
	asm("	req\n");
}
#include <olduino.c>
#include <nstdlib.c>
