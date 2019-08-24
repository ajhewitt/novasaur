/*
    programs from the C Puzzle Book
*/
#define uchar unsigned char
#define uint unsigned int
#include "nstdlib.h"
#include "defs.h"
#define check(EX) if(!(EX)) printf("check fail %s in %s line %d\n",(int)#EX,__FILE__,__LINE__)
#define check2(EX1,EX2) check(EX1); check(EX2)
#define check3(EX1,EX2,EX3) check(EX1); check(EX2); check(EX3)
char input[]="PI=3.14159, approximately";
char inpu2[]="SSSWILTECH1\1\11W\1WALLMP1";
void main()
{
	char c2;
	int done, high,i, in, low;
	int x,y=1,z;
	int c;
	printstr("if then else(6 line block repeated)\n");
	printstr("x = 5\nx = 5\nx = 1\nx = 7	z = 0\nx = 3	z = 0\nx = 3	z = 1\n");
	if (y!=0) x=5;
	PRINT1(d,x);

	if (y==0) x=3;
	else x=5;
	PRINT1(d,x);

	x=1;
	if (y<00) if (y>0) x=3;
	else x=5;
	PRINT1(d,x);

	if (z=y<0) x=3;
	else if (y==0) x=5;
	else x=7;
	PRINT2(d,x,z);

	if (z=(y==0)) x=5; x=3;
	PRINT2(d,x,z);

	if (x=z=y) x=3;
	PRINT2(d,x,z);

	printstr("for & while(just look for checkfail msgs)\n");

	x=y=0;
	while (y<10) ++y; x+=y;;
	PRINT2(d,x,y); check2(x==10,y==10);

	x=y=0;
	while (y<10) x+= ++y;
	PRINT2(d,x,y); check2(x==55,y==10);

	y=1;;
	while (y<10) {
		x=y++; z=++y;
	}
	PRINT3(d,x,y,z); check3(x==9,y==11,z==11);

	for (y=1; y<10; y++) x=y;
	PRINT2(d,x,y);
	check2(x==9,y==10);

	for (y=1; (x=y)<10; y++) ;
	PRINT2(d,x,y); check2(x==10,y==10);

	for (x=0, y=1000; y>1; x++, y/=10)
	PRINT2(d,x,y);
	check2(x==3,y==1);
printstr(" nested statements(look for checkfails)\n");
#define ENUF 3
#define EOS '\0'
#define NEXT(i) input[i++]
#define FALSE 0
#define TRUE 1

	i=low=in=high=0;
	while( c=NEXT(i) !=EOS )
		if( c<'0' ) low++;
		else if( c>'9' ) high++;
		else in++;
	PRINT3 (d,low, in, high) ; check3(low==25,in==0, high==0);
	i=low=in=high=0; done=FALSE;
	while( (c=NEXT(i))!=EOS && !done )
		if( c<'0' ) low++;
		else if( c>'9' ) high++;
		else in++;
		if( low>=ENUF|| high>=ENUF|| in>=ENUF )
			done = TRUE;
	PRINT3(d,low,in,high); check3(low==3,in==6, high==16);

	i=low=in=high=0; done=FALSE;
	while( (c=NEXT(i))!=EOS && !done )
		if( c<'0' ) done=(++low==ENUF);
		else if( c>'9' ) done = (++high==ENUF);
		else done =(++in==ENUF);
	PRINT3(d,low,in,high); check3(low==0,in==0, high==3);

	printstr("switch/break/continue(prints SWITCH SWAMP\n");
	for( i=2; (c2=inpu2[i])!='\0'; i++) {
		switch(c2) {
			case 'a': putchar('i'); continue;
			case '1': break;
			case 1: while( (c2=inpu2[++i])!='\1'  && c2!='\0');
			case 9: putchar('S');
			case 'E': case 'L': continue;
			default: putchar(c2); continue;
		}
		putchar(' ');
	}
	putchar('\n');
printstr("And we're done\n");
}
#define nofloats 1
#include "nstdlib.c"
