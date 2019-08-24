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
#define PRINT1(x1) PR(x1); NL
#define PRINT2(x1,x2) PR(x1); PRINT1(x2)
#define NL printf("\n");
void main()
{
double d=3.2, x;
int i=2, y;

	printstr(" Basic Types 2 - more floats\n");
	printstr("Visual verification 4 lines\n");
	printstr("x = 2.000	y = 1.000\n" "x = 1.600	y = 3.000\n" "y = 2.000\n" "x = 0.000	y = 0.000\n");
	printstr("following 4 lines should match above\n");
	x = (y=d/i)*2; PRINT2(x,y);
	y = (x=d/i)*2; PRINT2(x,y);
	y=d * (x=2.5/d); PRINT1(y);
	x=d * (y = ((int)2.9+1.1)/d); PRINT2(x,y);
	printstr("done\n");

}

#include "nstdlib.c"
