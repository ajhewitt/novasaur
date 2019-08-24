#include "nstdlib.h"
#include <cpu1802spd4port7.h>
void inc(){
	asm("\tinclude dd16.inc\n");
}
void main(){
//unsigned long ul=32767;
unsigned int ui=255;
int n=42;
unsigned char * buf[6];
	printf("begin dd16\n");
	for (n=0;n<65535;n++){
		printf("%s\n",dubdab16(n,buf));
	}
	printf("\ndone dd16\n");
}
#include "nstdlib.c"
