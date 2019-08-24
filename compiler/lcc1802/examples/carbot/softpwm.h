//softpwm.h defines for olduino software pulse width management.
unsigned int step=0;
unsigned char toggle[8]={0,0,0,0,0,0,0,0}; //toggle table for software pwm
unsigned char dct[2]={0,0}; //duty cycle table for pwm bits
void analogWrite(unsigned int bit, unsigned int val);
void pwmstep();	//run one step of the software pwm cycle
void pwmcycleN(unsigned int howmany); //run howmany*8 steps of the software pwm
