/*
    programs from the C Puzzle Book
*/
#define uchar unsigned char
#define uint  unsigned int
#include "nstdlib.h"
#define check(EX) if(!(EX)) printf("check fail %s in %s line %d\n",(int)#EX,__FILE__,__LINE__)
#define check3(EX1,EX2,EX3) check(EX1); check(EX2); check(EX3)

#define px printf("%d\n",x)
#define p(int) printf("%d\n",int)
#define pn(int) printf(#int " = %d\n",int)
#define p3(x,y,z) printf("x=%d\ty=%d\tz=%d\n",x,y,z)
#define sep printstr("---------------\n")
void main()
{
	int x,y,z;
	printstr("just look for checkfail msgs\n");
	printstr(" ops 1\n");
	x=- 3 + 4 * 5 - 6;  check(x==11);
	x=3 + 4 % 5 - 6;  check(x==1);
	x=-3 * 4 % - 6 / 5;  check(x==0);
	x=( 7 + 6 ) % 5 / 2;  check(x==1);
	printstr(" ops 2\n");
	x=2;
	x *=3+2; check(x==10);
	x *=y=z=4; check(x==40);
	x=y==z; check(x==1);
	x==(y=z); check(x==1);
	printstr(" ops 3\n");
	x=2; y=1; z=0;
	x=x && y || z;  check(x==1);
	check((x || ! y && z)==1);
	x=y=1;
	z=x++-1; check(x==2);check(z==0);
	z += -x ++ + ++y; check(x==3);check(z==0);
	z=x / ++ x; check(z==1);

	printstr(" ops 4\n");
	x=03; y=02; z=01;
	check((x |y & z)==3);
	check((x |y & -z)==3);

	check((x ^ y & -z)==1);
	check((x & y && z)==1);

	x=1; y=-1;
	check((! x | x)==1);
	check((-x|x)==-1);
	check((x^x)==0);
	x<<=3; check(x==8);
	y<<=3; check(y==-8);
	y>>=3; check(y==-1);
	printstr(" ops 5\n");
	x=1; y=1; z=1;
	x+=y+=z;
	check((x<y ? y:x)==3);
	check((x<y ? x++:y++)==2);
	check(x==3); check(y==3);
	check((z += x<y ? x++:y++)==4);
	check(y==4); check(z==4);
	x=3; y=z=4;
	check(((z>=y >=x) ? 1 : 0)==0);
	check((z>=y &&y >=z)==1);
	printstr(" ops 6\n");
	x=y=z=1;
	++x || ++y && ++z; check3(x==2,y==1,z==1);
	x=y=z=1;
	++x && ++y || ++z; check3(x==2,y==2,z==1);
	x=y=z=1;
	++x && ++y && ++z; check3(x==2,y==2,z==2);
	x=y=z= -1;
	++x && ++y || ++z; check3(x==0,y==-1,z==0);
	x=y=z= -1;
	++x || ++y && ++z; check3(x==0,y==0,z==-1);;
	x=y=z=-1;
	++x && ++y && ++z; check3(x==0,y==-1,z==-1);
}

#define nofloats 1
#include "nstdlib.c"
