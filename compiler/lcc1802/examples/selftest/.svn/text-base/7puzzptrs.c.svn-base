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

int  a[]={0,1,2,3,4};
main( ) {
	int  i,  *p;
printstr("7 line visual comparison\n"
	"a[i] = 0	a[i] = 1	a[i] = 2	a[i] = 3	a[i] = 4\n*p = 0	*p = 1	*p = 2	*p = 3	*p = 4	(int)p = 3	(int)p = 11\n"
	"p[i] = 1	p[i] = 2	p[i] = 3	p[i] = 4	p[i] = ?????\n*(p+i) = 0	*(p+i) = 2	*(p+i) = 4\n"
	"*p = 4	*p = 3	*p = 2	*p = 1	*p = 0\np[-i] = 4	p[-i] = 3	p[-i] = 2	p[-i] = 1	p[-i] = 0\n"
	"a[p-a] = 4	a[p-a] = 3	a[p-a] = 2	a[p-a] = 1	a[p-a] = 0\n");
	printstr("following 7 lines should match above\n");
	for(  i=0;  i<=4;  i++  )  PR(d,a[i]);
	NL;
	for(  p=  &a[0];  p<=&a[4];  p++  )
	PR(d,*p) ;
	p=&a[0]; PR(d,(int)p);
	p=&a[4]; PR(d,(int)p);
	NL;
	for  (p= &a[0],i=1;  i<=5;  i++ )
	PR ( d , p[i] ) ;
	NL;
	for(  p=a,i=0;  p+i<=a+4;  p++,i++ )
	PR(d,*(p+i));
	NL;
	for( p=a+4;  p>=a;  p-- )  PR(d,*p);
	NL;
	for(  p=a+4,i=0;  i<=4;  i++  )  PR(d,p[-i]);
	NL;

	for(  p=a+4;  p>=a;  p-- )
		PR(d,a[p-a]);

	NL;
}
#define nofloats 1
#include "nstdlib.c"
