/*
    programs from the C Puzzle Book
*/
//April 10 2013 included def of nofloats to keep float code from messing up addresses for pointer tests
#define uchar unsigned char
#define uint unsigned int
#define putchar putc

#include "nstdlib.h"
#include "defs.h"
#define check(EX) if(!(EX)) printf("check fail %s in %s line %d\n\007",(int)#EX,__FILE__,__LINE__)
#define check2(EX1,EX2) check(EX1); check(EX2)
#define check3(EX1,EX2,EX3) check(EX1); check(EX2); check(EX3)

#define nofloats 1

int  a[]={0,1,2,3,4};
int  *p[]={a,a+1,a+2,a+3,a+4};
int  **pp=p;
main( ) {
	int ip;
	NL;
	//printf("p=%x,pp=%x,pp-p=%x\n",p,pp,pp-p);
	pp++;
	ip=pp-p;
	printf("pp=%x,p=%x,ip=%d,pp-p=%d\n",pp,p,ip,pp-p);
	//printf("p=%x,pp=%x,pp-p=%x\n",p,pp,pp-p);
	//PRINT3(d,pp-p,*pp-a,**pp);
	//check3(pp-p==1,*pp-a==1,**pp==1);
	return 0;
}
#define nofloats 1

#include "nstdlib.c"
