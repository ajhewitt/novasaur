/*
    This just demonstrates that compiled code can survive and function in the presence of interrupts when compiled with -volatile
    An 1861 interrupt routine uses 61 interrupts to clock a second
    and the C program displays them on port 4
*/
char videobuffer[512]={
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
unsigned char time[2];
void main(){
	unsigned int secs,oldsecs;
	asm("	ldAD R1,__INTS  ;.. R1 = INTERRUPT PC\n");
	asm("	dec	sp	;inp will clobber rx% \n"
		"	INP 1  ;video on\n"
		"	inc sp\n");
	while(1){
		videobuffer[time[1]*8]^=255;
		secs=time[1];
		if (secs!=oldsecs){
			oldsecs=secs;
			out4(secs);
		}
	}
}
void INT(){	//video interrupt routine
	asm("	align 64\n"
		"INTX: SEX  2\n"
	    "	LDA  2         ; recover carry\n"
	    "	SHL\n"
	    "	LDA  2         ; recover A\n"
	    "	RET             ; < exit\n"
	"__INTS: NOP             ; > entry\n"
		"	DEC  2\n"
		"	SAV             ; save T\n"
		"	DEC  2\n"
		"	STXD           	; save A\n"
		"	SHRC            ; move carry to D \n"
		"	STR  2			; save carry\n"
		"	ldAD R0,_videobuffer;	point to the video buffer\n"
		"	pushr R15\n"
		"	ldaD R15,_time\n"
		"	ldn	R15\n"
		"	adi 1\n"
		"	str R15\n"
		"	smi 61	;each 61 cycles is a second\n"
		"	bnz +\n"
		"	str R15\n"
		"	inc R15\n"
		"	ldn R15\n"
		"	adi 1;increment the seconds counter\n"
		"	str R15\n"

		"+	popr R15\n"
		"	br   intx\n"
	);
}
