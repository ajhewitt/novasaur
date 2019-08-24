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


int i=1;

main()
{
	auto int i,j;
	printstr("*****Storage classes 3 - more functions\n");
	printstr("12 line visual comparison\ni = 1	j = 1\nnext(i) = 1\nlast(i) = 10\nnew(i+j) = 12\ni = 1	j = 2\n"
	"next(i) = 2\nlast(i) = 9\nnew(i+j) = 13\ni = 1	j = 3\nnext(i) = 3\nlast(i) = 8\nnew(i+j) = 14\n");
	i=reset ( ) ;
	printstr("following 12 lines should be same as above\n");
	for (j=1;  j<=3;  j++  ) {
		PRINT2(d,i,j);
		PRINT1(d,next(i));
		PRINT1(d,last(i));
		PRINT1(d,new(i+j));
	}
	printstr("And we're done\n");
}

int  reset() {
	return(i);
}
int  next(j) int  j; {
	return(  j=i++  );
}
int  last (j) int  j; {
	static  int  i=10;
	return(  j=i-- )  ;
}
int  new(i) int  i; {
	auto  int  j=10;
	return(  i=j+=i  )  ;
}
#define nofloats 1
#include "nstdlib.c"
