#include "nstdlib.h"
#include <cpu1802spd4port7.h>
char * dubdab16(int, char *);
void inc(){
	asm("\tinclude dd16.inc\n");
}
char * itoadd(int s, char *buffer){ //convert an integer to printable ascii in a buffer supplied by the caller
	char* bptr=buffer;
	if (s<0){
		*bptr++='-';
		s=-s;
	}
	strcpy(bptr,dubdab16(s,bptr)); //uses assembler double-dabble routine
	return buffer;
}void main(){
unsigned int ui=255;
int n=42;
char buf[6];
	printf("begin itoa\n");
	for (n=1999;n>1499;n--){
		itoa(n,buf);
	}
	printf("\ndone itoa\n");
	printf("begin itoadd\n");
	for (n=1999;n>1499;n--){
		itoadd(n,buf);
	}
	printf("\ndone itoadd\n");
	printf("begin dd16\n");
	for (n=1999;n>1499;n--){
		dubdab16(n,buf);
	}
	printf("\ndone dd16\n");
}
#include "nstdlib.c"
