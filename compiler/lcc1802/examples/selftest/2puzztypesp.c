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

int integer=5;
char character='5';
char *string="5";
double d;
float f;
long l;
int i;
void main()
{

	printstr(" Basic Types 1\n");
	printstr("Visual verification\n");
	printstr("an address ");pf(d,string);
	printstr("53 ");pf(d,character);
	printstr("5 ");pf(d,integer);
	printstr("5 ");pf(s,string);
	printstr("5 ");pf(c,character);
	printstr("5 ");pf(c,(integer=53));
	printstr("1 ");pf(d,('5'>5));
	{
		int sx=-8;
		unsigned ux=-8;
		printstr("FFF8 ");pf(x,sx); printstr("FFF8 ");pf(X,ux);
		printstr("FFFF ");pf(x,sx>>3); printstr("1FFF ");pf(x,ux>>3);
		printstr("-1 ");pf(d,sx>>3); printstr("8191 ");pf(d,ux>>3);
	}
}
#define nofloats
#include "nstdlib.c"
