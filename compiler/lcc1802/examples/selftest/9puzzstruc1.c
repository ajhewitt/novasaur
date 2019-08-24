/*
    programs from the C Puzzle Book
*/
#define uchar unsigned char
#define uint unsigned int
#define putchar putc

#include "nstdlib.h"
#include "defs.h"
#define check(EX) if(!(EX)) printf("check fail %s in %s line %d\n\007",(int)#EX,__FILE__,__LINE__)
#define check2(EX1,EX2) check(EX1); check(EX2)
#define check3(EX1,EX2,EX3) check(EX1); check(EX2); check(EX3)

int  a[]={0,1,2,3,4};
main( ) {

	struct  S1  {
	char  c[4],  *s;
	}  s1  = {  "abc",  "def"  };

	/*static*/  struct  S2  {
	char  *cp;
		struct  S1  ss1;
	}  s2  = {  "ghi",  {  "jkl",  "mno"  }  };
	printstr("4 line visual comparison\ns1.c[0] = a	*s1.s = d\ns1.c = abc	s1.s = def\n"
	"s2.cp = ghi	s2.ss1.s = mno\n++s2.cp = hi	++s2.ss1.s = no\n"
	"following 4 lines should match above\n");

	PRINT2(c,  s1.c[0],  *s1.s);
	PRINT2(s,  s1.c,  s1.s);

	PRINT2(s,  s2.cp,  s2.ss1.s);
	PRINT2(s,  ++s2.cp,  ++s2.ss1.s);

	return 0;
}
#define nofloats 1
#include "nstdlib.c"
