/*
    programs from the C Puzzle Book
*/
#include "nstdlib.h"
#include "defs.h"

struct S1{
	char*s;
	struct S1 *s1p;
};
main( ) {
	static struct  S1  a[]={
		{ "abcd",a+1},
		{"efgh",a+2},
		{"ijkl",a}
	};

	struct  S1  *p[3];
	int  i;
	printstr("3 line visual comparison\np[0]->s = efgh	(*p)->s = efgh	(**p).s = efgh\n"
	"p[0]->s = abcd	(*p)->s = abcd	(*p)->s1p->s = ijkl\np[0]->s = ijkl	(*++p[0]).s = abcd	++(*++(*p)->s1p).s = jkl\n"
	"following 3 lines should match above\n\n");
	for( i=0;  i<3;  i++  )  p[i]  = a[i].s1p;
	PRINT3(s, p[0]->s, (*p)->s,  (**p).s);

	swap(*p,a) ;
	PRINT3(s,  p[0]->s,  (*p)->s,  (*p)->s1p->s);

	swap(p[0],  p[0]->s1p);
	PRINT3(s,  p[0]->s,  (*++p[0]).s,  ++(*++(*p)->s1p).s);
}
swap(p1,p2 )
	struct  S1  *p1,  *p2;
{
	char  *temp;
	temp =  p1->s;
	p1->s  =  p2->s;
	p2->s  =  temp;
}
#define nofloats 1
#include "nstdlib.c"
