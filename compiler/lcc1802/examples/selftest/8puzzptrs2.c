/*
    programs from the C Puzzle Book
*/
//April 10 2013 included def of nofloats to keep float code from messing up addresses for pointer tests
#define uchar unsigned char
#define uint unsigned int
#define putchar putc

#include "nstdlib.h"
#include "defs.h"
#define check(EX) if(!(EX)) printf("check fail %s in %s line %d\n\007",(int)#EX,__FILE__,__LINE__)
#define check2(EX1,EX2) check(EX1); check(EX2)
#define check3(EX1,EX2,EX3) check(EX1); check(EX2); check(EX3)

#define nofloats 1

int  a[]={0,1,2,3,4};
int  *p[]={a,a+1,a+2,a+3,a+4};
int  **pp=p;
char *c[]={
	"ENTER",
	"NEW" ,
	"POINT",
	"FIRST"
};
char **cp[]={c+3,c+2,c+1};
char ***cpp=cp;
main( ) {
	printstr("look for checkfail's and check final line\n");
	PRINT2(d,(int)a,*a);check2((int)a==3,*a==0);
	PRINT3(d,(int)p,(int)*p,**p);check3((int)p==13,(int)*p==3,**pp==0);
	PRINT3(d,(int)pp,(int)*pp,**pp);check3((int)pp==13,(int)*pp==3,**pp==0);
	NL;
	pp++;
	PRINT3(d,pp-p,*pp-a,**pp);
	check3(pp-p==1,*pp-a==1,**pp==1);
	*pp++;
	PRINT3(d,pp-p,*pp-a,**pp);
	check3(pp-p==2,*pp-a==2,**pp==2);
	*++pp;
	PRINT3(d,pp-p,*pp-a,**pp);
	check3(pp-p==3,*pp-a==3,**pp==3);
	++*pp;
	PRINT3(d,pp-p,*pp-a,**pp);
	check3(pp-p==3,*pp-a==4,**pp==4);
	NL;
	pp=p;
	**pp++;  PRINT3(d,pp-p,*pp-a,**pp);check3(pp-p==1,*pp-a==1,**pp==1);
	*++*pp;  PRINT3(d,pp-p,*pp-a,**pp);check3(pp-p==1,*pp-a==2,**pp==2);
	++**pp;  PRINT3(d,pp-p,*pp-a,**pp);check3(pp-p==1,*pp-a==2,**pp==3);
printstr("\nfollowing line should read POINTER STEW\n");
printf("%s",(int)**++cpp  );
printf("%s  ",  (int)*--*++cpp+3  );
printf("%s",  (int)*cpp[-2]+3  );
printf("%s\n",  (int)cpp[-1][-1]+1  );
	return 0;
}
#define nofloats 1

#include "nstdlib.c"
