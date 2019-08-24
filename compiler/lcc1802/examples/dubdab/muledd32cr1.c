#include "olduino.h"
#include "nstdlib.h"
#include <cpu1802spd4port7.h>
char * dd32cr1(long int);
char * ultoa(unsigned long int,char *);
char * uitoa(unsigned int,char *);
void	xtoainc(){
	asm("\tinclude ddgt32.inc\n"); //ends with a return
}
void main(){
	char bcdbuf[12]={10,10,10,10,10,10,10,10,10,10,10,10};
	char *bcd;unsigned long binval=21; unsigned int bvali=12345;
	int i;
	ultoa(12345,bcdbuf);
	uitoa(12345,bcdbuf);
	delay(3000);
	printf("\rBCD Mule Saturday\r\n");
	for (i=10;i>=-1;i--){
		binval=i;
		printf("%d %lx=%ld=%s=%s\n\r",i,binval,binval,ultoa(binval,bcdbuf),uitoa(i,bcdbuf));
		binval--;
	}
}
#include "nstdlib.c"
#include "olduino.c"
