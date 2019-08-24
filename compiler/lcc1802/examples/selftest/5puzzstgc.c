/*
    programs from the C Puzzle Book
*/
#define uchar unsigned char
#define uint unsigned int
#define putchar putc

#include "nstdlib.h"
#include "defs.h"
#define check(EX) if(!(EX)) printf("check fail %s in %s line %d\n",(int)#EX,__FILE__,__LINE__)
#define check2(EX1,EX2) check(EX1); check(EX2)
#define check3(EX1,EX2,EX3) check(EX1); check(EX2); check(EX3)

#define  LOW  0
#define  HIGH  5
#define  CHANGE  2
int i=0;

main()
{
	auto int i=1;
	printstr("*****Storage classes 1 - blocks - look for checkfails\n");
	PRINT1(d,i); check(i==1);
	{
		int i=2;
		PRINT1(d,i); check(i==2);
		{
			i+=1;
			PRINT1(d,i); check(i==3);
		}
		PRINT1(d,i); check(i==3);
	}
	PRINT1(d,i); check(i==1);
	printstr("*****Storage classes 2 - functions\n");
	i=HIGH;
	reset(  i/2  );  PRINT1(d,i); check(i==5);
	reset(  i=i/2  );  PRINT1(d,i); check(i==2);
	i  =  reset(  i/2  );  PRINT1(d,i); check(i==5);
	workover(i);  PRINT1(d,i);check(i==5);
	printstr("And we're done\n");
}
workover(i) int  i; {
	i  =  (i%i)  *  ((i*i)/(2*i)  +  4);
	PRINT1 (d , i ) ;check(i==0);
	return(i);
}
int  reset(i) int  i; {
	i =  i<=CHANGE  ?  HIGH : LOW;
	return(i);
}
#define nofloats 1
#include "nstdlib.c"
