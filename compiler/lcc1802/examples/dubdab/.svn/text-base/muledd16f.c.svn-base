#include "nstdlib.h"
#include <cpu1802spd4port7.h>
char * dubdab16(int, char *);
char * dubdab16f(int, char *);
char * dubdab16fo(int, char *);
void inc(){
	asm("\tinclude dd16.inc\n");
	asm("\tinclude dd16f.inc\n");
	asm("\tinclude dd16fo.inc\n");
}

char * itoadd(int s, char *buffer){ //convert an integer to printable ascii in a buffer supplied by the caller
	char* bptr=buffer;
	if (s<0){
		*bptr++='-';
		s=-s;
	}
	strcpy(bptr,dubdab16fo(s,bptr)); //uses assembler double-dabble routine
	return buffer;
}

void main(){
unsigned int ui=255;
int n=42;
char buf[7];
printf("dubdab16f mule\n");
printf("%d %s\n",32767,itoadd(32767,buf));

	for (n=32767;n>=-32768;n--){
		printf("%s ",itoadd(n,buf));
		if(strcmp(itoa(n,buf),itoadd(n,buf))){
			printf("WWT!\n");
			while(1);
		}
	}

	printf("begin itoa\n");
	for (n=999;n>0;n--){
		itoa(n,buf);
	}
	printf("\ndone itoa\n");

	printf("begin itoadd\n");
	for (n=999;n>0;n--){
		itoadd(n,buf);
	}
	printf("\ndone itoadd\n");

	printf("begin dd16\n");
	for (n=999;n>0;n--){
		dubdab16(n,buf);
	}
	printf("\ndone dd16\n");

	printf("begin dd16f\n");
	for (n=999;n>0;n--){
		dubdab16f(n,buf);
	}
	printf("\ndone dd16f\n");

	printf("begin dd16fo\n");
	for (n=999;n>0;n--){
		dubdab16fo(n,buf);
	}
	printf("\ndone dd16fo\n");

}
#include "nstdlib.c"
