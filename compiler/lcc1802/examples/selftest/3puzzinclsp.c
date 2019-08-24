/*
    programs from the C Puzzle Book
*/
#define uchar unsigned char
#define uint unsigned int


#include "nstdlib.h"
#include "defs.h"
#define check(EX) if(!(EX)) /*printstr("checkfail\n"); */ printf("check fail %s in %s line %d\n",(int)#EX,__FILE__,__LINE__);
int global2=2;
void main()
{
	int local3=3;
	printstr(" included files 1\n");
	printstr(" visually verify 4 lines repeated\n");
	printstr("5 = 5\n");PRINT1(d,5);
	printstr("5 = 5	4 = 4\n");PRINT2(d,5,4);
	printstr("5 = 5	4 = 4	local3 = 3\n");PRINT3(d,5,4,local3);
	printstr("5 = 5	4 = 4	local3 = 3	global2 = 2\n");PRINT4(d,5,4,local3,global2);
}
#define nofloats 1
#include "nstdlib.c"

