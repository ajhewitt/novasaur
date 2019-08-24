#include <Streaming.h>
#define cout Serial
#define endl '\n'
unsigned long ttd; //used as a timed kill switch
int frontfree=50; // set higher to turn earlier when something is in front, and get less skid-turning, but more likeliness to miss sharp right turns
int desiredtrack=20;
int fcm=0; //forward clearance in cm
int oldfcm=0,olderfcm=0; //for detecting stalls
int rcm=0; //right side clearance in cm
int oldrcm=0, olderrcm=0; //for tracking drift & detecting stall
int yled=7, rled=8, gled=9;
int pwma=10,ain1=17,ain2=18; //drive left motor in1+ and in2- control direction
int pwmb=11,bin1=16,bin2=15; //drive right motor in1+ and in2- control direction
const int fwdpingpin = 4; //foreward looking sensor
const int rtpingpin = 12; //right looking sensor
const int basespeed=92;
char initstr[]={'?','s',' ',' '}; int initindx=0, initcnt=2;
void setup() {                
  // initialize the digital pin as an output:
  pinMode(yled,OUTPUT);pinMode(rled,OUTPUT);pinMode(gled,OUTPUT);
  pinMode(pwma,OUTPUT);pinMode(ain1,OUTPUT);pinMode(ain2,OUTPUT);
  pinMode(pwmb,OUTPUT);pinMode(bin1,OUTPUT);pinMode(bin2,OUTPUT);
  Serial.begin(19200);
  cout <<"CarBot V4 - keepaway"<<endl;
}
int howhard(int fdelta){ //set motor speed for keepaway
  if (fdelta<3){
    return 0; //ignore 1" delta
  }
  else if (fdelta<10){ //with 4"
    return 32; // modest speed
  }
  else {
    return 128;
  }
}

void keepaway(int howfar, int howlong){ //keep a fixed distance from a target
  ttd=millis()+howlong; //time to die
  while(millis()<ttd && Serial.available()==0){
    fcm=pingfront();
    int fdelta=abs(howfar-fcm); //how far from the target
    int mspeed=howhard(fdelta); //how hard to drive the motors
    cout <<millis()<<" k "<<fcm<<" "<<mspeed;
    if (fcm<howfar){ //too close
      cout <<" b\n";
      startdrive(-1*mspeed,-1*mspeed); //back up
    } 
    else if(fcm> howfar*2) { //way too far
      cout <<" X\n";
      stopdrive; //stop
    }
    else { //in the play zone
      cout <<" f\n";
      startdrive(mspeed,mspeed); //move closer
    }  
    delay(66); //wait for the sensor to cycle
    fcm=pingfront(); //take another reading
  }
  stopdrive();  //time is up or new command entered
}

void followwall(int howlong){ //follow a wall for howlong
  ttd=millis()+howlong; //time to die
  startdrive(128,128);
  fcm=0; oldfcm=0; olderfcm=0;rcm=0; oldrcm=0; olderrcm=0;
  while(millis()<ttd && Serial.available()==0){
    checkahead();
    checkwall();
    ckstall(); //go see if we're stalled

  }
  stopdrive();
}
void tooclose(){
    if (rcm>oldrcm) {//but going the right way
      startdrive(basespeed,basespeed); //proceed
      cout << " wf-1 ";
    }
    else{
      startdrive(32,128); //bear left
      cout <<" wvlft ";
    }
}
void toofar(){
    if (rcm<oldrcm) {//but going the right way
      startdrive(basespeed,basespeed); //proceed
      cout << " wf-2 ";
    }
    else{
      startdrive(128,32); //bear right
      cout <<" wvrt ";
    }
}
  void checkwall(){
  cout <<"cw";
  rcm=pingright();
  if (rcm<desiredtrack){  //too close
    tooclose();
  }
  else{
    toofar();
  }
}
void checkahead(){
  cout <<"ca";
  fcm=pingfront();
  if (fcm<frontfree){ //turn left as there is something ahead in front
      cout <<" fl at "<<fcm; //forced left
      startdrive(-128,255); //start a left turn
      fcm=pingfront(); //check the distances
      while(fcm<frontfree && millis()<ttd &&Serial.available()==0){
        cout <<" flc "; 
        fcm=pingfront();
        ckstall(); //go see if we're stalled
      }
      cout <<" end forced left" <<endl;
            Serial.print(" s:");
      rcm=pingright();
      cout<<rcm<<endl;
//      ttd=millis(); //this will break out of wall following
      startdrive(basespeed,basespeed); //reestablish forward direction
  }

}
void ckstall(){ //if we get 3 identical distance readings assume we've stalled
  cout <<" cs "<<fcm<<"/"<<oldfcm<<"/"<<olderfcm<<" "<<rcm<<"/"<<oldrcm<<"/"<<olderrcm<<" ";
  if (fcm==oldfcm && olderfcm==oldfcm && fcm!=665){ //maybe stalled
    if (rcm==oldrcm && olderrcm==oldrcm && rcm <100) { //stalled
      cout <<"stalled"<<endl;
      startdrive(-basespeed,-basespeed); //back straight up
      delay(500); //for a while
      stopdrive(); //
      startdrive(32,128); //veer left
    }
  }
}
void stopdrive(){ //stop the motors
  digitalWrite(gled,LOW);
  digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 
}
void startdrive(int lmotor,int rmotor){ //start the motors
  digitalWrite(gled,HIGH);
  if (lmotor>=0)  //check direction for left motor
    setd(ain1,ain2); //for +v, run forward: ain1=high, ain2=low
  else
    setd(ain2,ain1);  //for -v, run backward: ain1=low, ain2=high
  if (rmotor>=0) //check direction for right motor
    setd(bin1,bin2);
  else
    setd(bin2,bin1);
    
  analogWrite(pwma,abs(lmotor)); analogWrite(pwmb,abs(rmotor)); //turn on both motors
}

void drive(int lmotor,int rmotor){
 int howlong=66;
 digitalWrite(gled,HIGH);
 setdirection(ain1,ain2,bin1,bin2);
analogWrite(pwma,abs(lmotor)); analogWrite(pwmb,abs(rmotor)); //turn on both motors
 delay(howlong);
 digitalWrite(gled,LOW);
 digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 
}
void loop() {
  static int lastpasses;
  char x;
  while((Serial.available()>0)||(initindx<initcnt)){
    if (initindx<initcnt){
      x=initstr[initindx];
      initindx++;
    }
    else {
      x=Serial.read();
    }
      switch(x){      
      case 'k': //play keepaway
      cout<<endl<<'k'<<endl;
      keepaway(45,30000);  //try to maintain a 45 cm distance for 30 sec
      break;

      case 'w': //follow a wall
      cout<<endl<<'w'<<endl;
      followwall(30000);  //follow a wall on the right for n/1000 seconds
      break;

      case 'd': //drive(128,64) - maybe drift right
      Serial.print("d");
      drive(128,64);  //drive left motor more than right
      break;
   
   case 'x': //read the hall effect sensor continually for 5 sec while spinning!
      Serial.print("x ");
      xspin(1000);
      break;
      
    case 'b': //go backwards
      Serial.print("b");
      goback();
      break;
    case 'f':
      Serial.print("f");
      goforward();
      //Serial.flush(); //just take one at a time
      break;
    case 'r':
      Serial.print("r");
      turnright();
      break;
    case 'R': //backward rt turn
      Serial.print("R");
      bwdturnright();
      break;
     case 'l':
      Serial.print("l");
      turnleft();
      break;
    case ' ':
      Serial.print("pause ");
      pause();
      break;
    case '?': //read the forward sensor
      Serial.print(" ?:");
      fcm=pingfront();
      cout<<fcm<<endl;
      break;
    case 's': //read the sideways sensor
      Serial.print(" s:");
      rcm=pingright();
      cout<<rcm<<endl;
      break;
    case '2': //double the distance
      Serial.println(" 2");
      fcm=pingfront();
      if ((fcm<40)&(fcm>0)){
         onez();
         fcm=pingfront();
      }
      else{
        Serial.println(fcm);
      }
      break;
    case '/': //halve the distance
      Serial.println(" /");
      fcm=pingfront();
      if ((fcm<60)&(fcm>12)){
         zeno();
         fcm=pingfront();
      }
      else{
        Serial.println(fcm);
      }
      break;    
    }
  }
}
void onez(){
  while(microsecondsTocm(pingtime(fwdpingpin))<(fcm*2)){
    goback();
  }
  goforward(); //put the brakes on
}
void zeno(){
  while(microsecondsTocm(pingtime(fwdpingpin))>(fcm/2)){
    goforward();goforward();
    pause();
  }
}

int pingfront(){ //ping ahead of the car
  static unsigned long lastpulse=0; //keep us from overrunning the sensors
  #define sensordelay 66 //minimum time between calls
  unsigned long thistime=millis();
  if ((thistime>(lastpulse+sensordelay))||(lastpulse==0)){ //except for the first time we need a healthy delay between pings
    if (lastpulse!=0){//track motion on right sensor after the first time
      olderfcm=oldfcm;
      oldfcm=fcm; 
    }
    fcm=microsecondsTocm(pingtime(fwdpingpin));
    lastpulse=thistime;
    cout <<endl<<"@T="<<thistime<<" f="<<fcm<<endl;
  }
  return fcm;
}
int pingright(){ //ping to right of the car
  static unsigned long lastpulse=0; //keep us from overrunning the sensors
  #define sensordelay 66 //minimum time between calls
  unsigned long thistime=millis();
  if ((thistime>(lastpulse+sensordelay))||(lastpulse==0)){ //except for the first time we need a healthy delay between pings
    if (lastpulse!=0){ //track motion on right sensor after the first time
       olderrcm=oldrcm;
       oldrcm=rcm;
    }
    rcm=microsecondsTocm(pingtime(rtpingpin));
    lastpulse=thistime;
    cout <<endl<<"@T="<<thistime<<" r="<<rcm<<endl;
  }
  return rcm;
}
 
long pingtime(int pingPin){
  // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
  long x; //dummy to hold ping time
  pinMode(pingPin, OUTPUT);
  digitalWrite(pingPin, LOW);
  delayMicroseconds(2);
  digitalWrite(pingPin, HIGH);
  delayMicroseconds(15);
  digitalWrite(pingPin, LOW);
  delayMicroseconds(20);
  // The same pin is used to read the signal from the PING))): a HIGH
  // pulse whose duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  pinMode(pingPin, INPUT);
  x=pulseIn(pingPin, HIGH);
  return x;
}

long microsecondsTocm(long microseconds)
{
  // According to Parallax's datasheet for the PING))), there are
  // 29 microseconds per cm (i.e. sound travels at 1130 feet per
  // second).  This gives the distance travelled by the ping, outbound
  // and return, so we divide by 2 to get the distance of the obstacle.
  // See: http://www.parallax.com/dl/docs/prod/acc/28015-PING-v1.3.pdf
  return microseconds / 29 / 2;
}

 void pause(){
   int howlong=200;
   delay(howlong);
 }
 
 void goback(){
   int howlong=50;
 digitalWrite(gled,HIGH);
 setdirection(ain2,ain1,bin2,bin1);
// digitalWrite(pwma,HIGH); digitalWrite(pwmb,HIGH); //turn on both motors
analogWrite(pwma,128); analogWrite(pwmb,128); //turn on both motors
 delay(howlong);
 digitalWrite(gled,LOW);
 digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 
}
void goforward(){
   int howlong=50;
 digitalWrite(gled,HIGH);
 setdirection(ain1,ain2,bin1,bin2);
// digitalWrite(pwma,HIGH); digitalWrite(pwmb,HIGH); //turn on both motors
analogWrite(pwma,128); analogWrite(pwmb,128); //turn on both motors

 delay(howlong);
 digitalWrite(gled,LOW);
 digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 
} 
void xspin(int howlong){ //how long to spin for
 int interval=66; //hown long between scans
  cout <<endl<<" spinning:"<<millis()<<endl;
  setdirection(ain2,ain1,bin1,bin2);
  analogWrite(pwmb,255); analogWrite(pwma,128); //turn on both motors
  unsigned long firsttime=millis(), thistime=firsttime;
  cout << millis()<<":"<<microsecondsTocm(pingtime(fwdpingpin))<<" ";
  while (millis()<(firsttime+howlong)){
    if (millis()>(thistime+interval)){
      thistime=millis();
      cout << thistime<<":"<<microsecondsTocm(pingtime(fwdpingpin))<<" ";
    }
  }
  cout <<endl<<millis()<<" and we're done";
  digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 

} 
 
 void turnleft(){
   int howlong=100;
 digitalWrite(gled,HIGH);
 setdirection(ain2,ain1,bin1,bin2);
 analogWrite(pwmb,255); analogWrite(pwma,128); //turn on both motors
 delay(howlong);
 digitalWrite(gled,LOW);
 digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 
} 
 void turnright(){
   int howlong=100;
 digitalWrite(gled,HIGH);
 setdirection(ain1,ain2,bin2,bin1);
 analogWrite(pwma,255); analogWrite(pwmb,128); //turn on both motors
 delay(howlong);
 digitalWrite(gled,LOW);
 digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 
} 
 void bwdturnright(){
   int howlong=100;
 digitalWrite(gled,HIGH);
 setdirection(ain2,ain1,bin2,bin1); //both motors backwards
 analogWrite(pwma,32); analogWrite(pwmb,255); //turn on both motors - left more than right
 delay(howlong);
 digitalWrite(gled,LOW);
 digitalWrite(pwma,LOW); digitalWrite(pwmb,LOW); //turn off both motors 
} 
void  setdirection(int d1,int d2,int d3,int d4){ //set the motor direction
  setd (d1,d2); //set one motor
  setd (d3,d4); //set the other
  
}
void  setd(int d1,int d2){ //set the motor direction for one motor
  digitalWrite(d1,HIGH);
  digitalWrite(d2,LOW);
}
  
