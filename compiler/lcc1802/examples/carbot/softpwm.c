//softpwm.c routines for olduino software pulse width management.
//Oct 12 - pwmstep included in pwmcycleN
void analogWrite(unsigned int bit, unsigned int val){
	//printf("analogWrite(%d,%d)\n",bit,val);
	if (bit<2){
		dct[bit]=val>>5; //step down range to 0..7
		//printf("dct[%d]=%cx\n",bit,dct[bit]);
	}
}
void pwmcycleN(unsigned int howmany){ //run howmany*8 steps of the software pwm
	unsigned int step; //toggle table index
	unsigned char * togglep=toggle; //maybe togglep will be in a register
	while(howmany-->0){
		togglep[dct[0]]|=1; //set the end of the duty cycle for bit 0
		togglep[dct[1]]|=2; //set the end of the duty cycle for bit 1
		togglep[0]^=~PIN4; //set up with current state of port4 low bits
		togglep[0]&=0x03; //only the pwm bits are set
		for(step=0;step<8;step++){
			PIN4^=togglep[step];	//toggles the bit off if the duty cycle is over
			out(4,PIN4);
			//printf("dct[0]=%cx, step %d, toggle[%d]=%cx, PIN4=%cx\n",dct[0],step, step, toggle[step],PIN4);
			togglep[step]=0;
		}
	}
}
