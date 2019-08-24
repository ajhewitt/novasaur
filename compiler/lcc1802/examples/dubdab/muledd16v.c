#include "nstdlib.h"
#include <cpu1802spd4port7.h>
char * dubdab16(int, char *);
char * dubdab16v(int, char *);
void inc(){
	asm("\tinclude dd16.inc\n");
	asm("\tinclude dd16v120.inc\n");
}

char * itoavd(int s, char *buffer){ //convert an integer to printable ascii in a buffer supplied by the caller
	char* bptr=buffer;
	if (s<0){
		bptr=dubdab16v(-s,buffer)-1;
		*bptr='-';
	} else{
		bptr=dubdab16v(s,buffer);
	}
	return bptr;
}

void main(){
unsigned int ui=255;
int n=42;
char buf[7],bufv[7];
dubdab16v(12345,buf);
dubdab16v(192,bufv);
dubdab16v(0,bufv);
//dubdab16fo(12345,buf);
printf("dubdab16v mule\n");
//printf("%d %s\n",32767,itoavd(32767,buf));

	for (n=32767;n>=-32600;n-=100){
		printf("\r\n%s ",itoavd(n,buf));
		if(strcmp(itoa(n,buf),itoavd(n,bufv))){
			printf("WWT!\n");
			while(1);
		}
	}

	printf("begin itoa\n");
	for (n=999;n>0;n--){
		itoa(n,buf);
	}
	printf("\ndone itoa\n");

	printf("begin itoavd\n");
	for (n=999;n>0;n--){
		itoavd(n,buf);
	}
	printf("\ndone itoadd\n");

}
#include "nstdlib.c"
