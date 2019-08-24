#include "nstdlib.h"
#include <cpu1802spd4port7.h>
unsigned char * gbuf[6];
unsigned char * dubdabc(unsigned int bin, unsigned char * buf){
	unsigned int nbits=16, maxdigits=5, index,topbit;
	char * walker;//point to working spot
	for (index=0;index<maxdigits;index++){buf[index]=0;} //clear buffer

	while(!(bin&0x8000)){ //spin off zero bits
		bin<<;
		nbits--;
	}
	maxdigits=(nbits>>2)+2;
	while(nbits--){
		if (bin&0x8000) topbit=1;
		bin=bin<<1;
		for (walker=buf+maxdigits; walker>=buf; walker--){
			if(buf[walker]>4) buf[walker]+=3;
			buf[walker]=buf[walker]<<1+topbit;
			if (buf[walker]>15){
				topbit=1;
				buf[walker]&=15;
			}else{topbit=0;;}
		}




void main(){
//unsigned long ul=32767;
unsigned int ui=255;
int n;
	printf("begin ul\n");
	for (n=1;n<=10;n++){
		printf("%d",ui);//printf("%ld",ul);
	}
	printf("\ndone ul\n");
}
#include "nstdlib.c"
