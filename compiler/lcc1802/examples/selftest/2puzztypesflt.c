/*
    programs from the C Puzzle Book
*/
#define uchar unsigned char
#define uint  unsigned int
#define check(EX) if(!(EX)) /*printstr("checkfail\n"); */ printf("check fail %s in %s line %d\n",(int)#EX,__FILE__,__LINE__);
#include "nstdlib.h"

#define px printf("%d\n",x)
#define p(int) printf("%d\n",int)
#define pn(int) printf(#int " = %d\n",int)
#define pf(format,x) printf(#x " =%" #format "\n",(int)(x))
#define sep printstr("---------------\n")
#define PR(x) printf(#x " = %f\t",(double)(x))
#define PRINT4(x1,x2,x3,x4) PR(x1); PR(x2); PR(x3); PR(x4)
#define NL printf("\n");
void main()
{
	double d;
	float f;
	long l;
	int i;

	printstr(" Basic Types 2 - floats\n");
	printstr("Visual verification 6 lines - note compiler overflow warning\n");
	printstr("i = 33.000	l = 33.000	f = 33.000	d = 33.000\n"
	"i = 33.000	l = 33.000	f = 33.000	d = 33.000	\n"
	"i = 33.000	l = 33.000	f = 33.333	d = 33.333	\n"
	"i = 33.000	l = 33.000	f = 33.000	d = 33.000	\n"
	"i = -32203.000	l = 33333.000	f = 33333.000	d = 33333.000	\n"
	"i = -32203.000	l = -32203.000	f = -32203.000	d = -32203.000	\n");
	printstr("following 6 lines should dup above\n");
	i=l=f=d=100/3;
	PRINT4(i,l,f,d); NL;

	d=l=f=i=100.0/3;
	//printf("i=%f\n",(double)(i));
	PRINT4(i,l,f,d); NL;

	i=l=f=d=100/3.; PRINT4(i,l,f,d);NL;
	d=f=l=i=(double)100/3; PRINT4(i,l,f,d);NL;
	i = l = f = d = (double)(100000/3l);
	PRINT4(i,l,f,d); NL;
	d = f = l = i = 100000/3; PRINT4(i,l,f,d);NL;
	printstr("done\n");

}

#include "nstdlib.c"
