#include <olduino.h>
#include "nstdlib.h"
#include <cpu1802spd4port7.h>
char * numberninja(void *, char *,int);
void inc(){
	asm("\tinclude numberninja.inc\n");
}

char * itoann(int s, char *buffer){ //convert an integer to printable ascii in a buffer supplied by the caller
	char * bptr;
	if (s<0){
		s=-s;
		bptr=numberninja(&s,buffer+6,2)-1;
		*bptr='-';
	} else{
		bptr=numberninja(&s,buffer+6,2);
	}
	return bptr;
}
char * ltoann(long int s, char *buffer){ //convert an integer to printable ascii in a buffer supplied by the caller
	char * bptr;
	long int negs;
	if (s<0){
		negs=-s;
		bptr=numberninja(&negs,buffer+11,4)-1;
		*bptr='-';
	} else{
		bptr=numberninja(&s,buffer+11,4);
	}
	return bptr;
}
void printintnn(int s){ //print an integer
	char buffer[8];
	printstr(itoann(s,buffer));
}
void printfnn(char *ptr,...){ //limited implementation of printf
//								supports only c,d,s,x,l formats without width or other qualifiers
	unsigned char c,xord;
	int argslot=0;	//used to align longs
	int * this=(int *)&ptr;
	this++; argslot++; //advance argument pointer and slot #
    while(*ptr) {
		c=*ptr++;
		if (c!='%'){
			putc(c);
		} else{
			c=*ptr++;
			switch (c){
				case 'i': case 'd':
					printintnn(*this++);
					argslot+=1; //next argument slot
					break;
				case 's':
					printstr((char*) *this++);
					argslot+=1; //next argument slot
					break;
				case 'c'://scungy support for hex printing as %cx
					if (*ptr=='x'){ //if there's an x
						ptr++; //skip over the x
						putx(((unsigned int) *this++)&255); //print 1 byte as hex
					} else{
						putc((unsigned int) *this++);		//print as char
					}
					argslot+=1; //next argument slot
					break;
				case 'x': case 'X':
					putx(((unsigned int) *this)>>8);
					putx(((unsigned int) *this++)&255);
					argslot+=1; //next argument slot
					break;
				case 'l': //longs can be dec or hex
					if (*ptr){ //as long as there's something there
						xord=*ptr++;
						if (argslot&1) {
							this++;
							argslot++;
						}
						if(xord=='d'){
							printlint(*(long *)this);//treats "this" as a pointer to long
							this+=2;				// and advances it 4 bytes
						} else{
							putx(((unsigned int) *this)>>8);
							putx(((unsigned int) *this++)&255);
							putx(((unsigned int) *this)>>8);
							putx(((unsigned int) *this++)&255);
						}
						argslot+=2;
						break;
					}
#ifndef nofloats
				case 'f': //float
					if (*ptr){ //as long as there's something there
						if (argslot&1) { //adjust alignment
							this++;
							argslot++;
						}
						printflt(*(float *)this);//treats "this" as a pointer to float
						this+=2;				// and advances it 4 bytes
						argslot+=2;
						break;
					}
#endif
				default:
					putc('%');putc(c);
			} //switch
		} //%
	} //while
} //prtf

void main(){
unsigned int ip[2][4]={{24,73,65,7},{192,168,1,1}};
int n=10,i;
char buf[7]={0,1,2,3,4,5,6};
printf("*\n");
	for (n=0;n<2;n++){
		for (i=0;i<2;i++){
			printf("%d.%d.%d.%d\n",ip[i][0],ip[i][1],ip[i][2],ip[i][3]);
		}
	}
printf("**\n");
delay(100);
printf("***\n");
	for (n=0;n<2;n++){
		for (i=0;i<2;i++){
			printfnn("%d.%d.%d.%d\n",ip[i][0],ip[i][1],ip[i][2],ip[i][3]);
		}
	}
printf("***\n");
}
#include "nstdlib.c"
#include <olduino.c>
