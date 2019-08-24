
//Wall following Robot Car
//Author: Nicholas Finch
//Date Completed: April 16, 2014
//License: creative commons license share alike
//This program makes a RC car move around on it's own, given that two distance sensors are attached.
//One sensor should be facing the wall, the other facing forward. Have fun with this code.
//I recommend that you spend sometime getting to know how the NewPing library works.
//I managed to bend the code, for my sensors, to my will but it was not without it's issues. (a lot of debugging)
//I say this to further reason with you in learning how the NewPing library works.

//variable declaration

#include <NewPing.h>

#define SONAR_NUM     2 // Number or sensors.
#define MAX_DISTANCE 800 // Maximum distance to ping. Edit the distance as needed.
#define PING_INTERVAL 33 // Milliseconds between sensor pings (29ms is about the min to avoid cross-sensor echo).
#define trigPin1 5 // yellow wire
#define echoPin1 6 // white wire
#define trigPin2 10 //Yellow wire
#define echoPin2 11 //White wire
//if the car's wheels are going backwards. Edit these pins as needed
const int motor_front[] = {2, 4}; //Front Pins
const int motor_back[] = {7, 8}; //Rear Pins
int rangeFront = 0;
int rangeWall = 0;
//rangeF[1] results from pins 9 and 6
//rangeF[2] results from pins 12 and 13
//int wayToClose = 800;

NewPing sonar[SONAR_NUM] = {     // Sensor object array.
  NewPing(trigPin1, echoPin1, MAX_DISTANCE), //Front
  NewPing(trigPin2, echoPin2, MAX_DISTANCE) //Side
};//endArray


void setup() {
  // initialize serial communication:
  Serial.begin(9600);
  // Setup motors
  int i;
  //setting up the motor contols
  for(i = 0; i < 2; i++){
    pinMode(motor_back[i], OUTPUT);
    pinMode(motor_front[i], OUTPUT);
    //setting up the SRF05
  }//end for
  pinMode(trigPin1, OUTPUT);
  pinMode(echoPin1, INPUT);
  digitalWrite(trigPin1, LOW);
  
  pinMode(trigPin2, OUTPUT);
  pinMode(echoPin2, INPUT);
  digitalWrite(trigPin2, LOW);
  
}//endVoid

//////////////////////////////////////////////////////////Edit these as needed
int toCloseWall = 1000;
int toFarWall = 1500;
int toCloseFront = 1000;
//////////////////////////////////////////////////////////Edit these as needed

void loop(){
//-------------Main Program  

Main:
  rangeFront = readRangeFront();
  rangeWall = readRangeWall();
  
  if (rangeFront <= 400){
    rangeFront = 3000;
  }//endif
  if(rangeWall <= 400){
    rangeWall = 3000;
  }//endif
  
//                                  The Debugger Code. Uncomment this if you're having issues with the distance sensors.
//                                  Make sure to comment out the main code below this debugger.
//                                  Serial.print(rangeFront);
//                                  Serial.print(" Front");
//                                  Serial.println();
//                                  delay(500);
//                                  Serial.print(rangeWall);
//                                  Serial.print(" Wall");
//                                  Serial.println();
//                                  delay(500);

//More debugging code is down there if you want to mess with it.  
 if (rangeFront < toCloseFront){
    drive_backward();
//  Serial.print(" Drive Back");
    turn_right();
//  Serial.print(" Right Turn");
//  Serial.println();
    delay(800);
    drive_forward();
    turn_left();
    delay(1000);
    goto Main;    
  }//endif  
  if(rangeWall > toCloseWall && rangeWall < toFarWall){
    drive_forward();
    no_turn();
//  Serial.print(" Drive Forward");
//  Serial.println();
    goto Main;
  }//endeif  
  if (rangeWall < toCloseWall){
    turn_left();
//  Serial.print(" Turn Left");
    drive_forward();
//  Serial.print(" Drive Forward");
//  Serial.println();
    goto Main;
  }//endif 
  if (rangeWall > toFarWall){
    turn_right();
//  Serial.print(" Turn Right");
    drive_forward();
//  Serial.print(" Drive Forward");
//  Serial.println();
    goto Main;
  }//endif  
}//endVoid


//-------------Subroutines for the motor control
void no_turn(){
digitalWrite(motor_front[0],LOW);
digitalWrite(motor_front[1],LOW);
}
void motor_stop(){
digitalWrite(motor_back[0], LOW); 
digitalWrite(motor_back[1], LOW); 
digitalWrite(motor_front[0], LOW);
digitalWrite(motor_front[1],LOW);
}

void drive_forward(){
digitalWrite(motor_back[0], HIGH); 
digitalWrite(motor_back[1], LOW); 
}

void drive_backward(){
digitalWrite(motor_back[0], LOW); 
digitalWrite(motor_back[1], HIGH); 
}

void turn_left(){
digitalWrite(motor_front[0], HIGH); 
digitalWrite(motor_front[1], LOW);
}

void turn_right(){
digitalWrite(motor_front[0], LOW); 
digitalWrite(motor_front[1], HIGH); 
}

//-------------SubRoutines for the SRF05 and SR04

int readRangeFront(){
//SRF05 Output
  delay(10);
  unsigned rangeFront = sonar[0].ping(); // Send ping to first array's sensor
  sonar[0].timer_stop();
  return rangeFront;
}

int readRangeWall(){
//SRF05 Output
  delay(10);
  unsigned rangeWall = sonar[1].ping(); // Send ping to second array's sensor
  sonar[1].timer_stop();
  return rangeWall;
}
