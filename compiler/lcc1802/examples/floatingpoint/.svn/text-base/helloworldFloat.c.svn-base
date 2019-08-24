/*
   print the string "hello World!"
*/
#include <nstdlib.h>
typedef union{float uf; unsigned long ul; long sl; unsigned int ui; unsigned char uc[4] ;} funion;
funion fsplit;
float floatfunc(float,float);
long longfunc(long,long);
float f0=0.0,f1=1, f2=2, f3=3, f6=6,fbigone=1800000000;
int fsign, fexp;
int shifto;
int i1;
long l0=0,l1=1,l2=2,l3=3,lbigone=1800000000;
void fsp(float f1){
	fsplit.uf=f1;
	printf("fsplit.uc[1]&&0x80=%x\n",fsplit.uc[1]&&0x80);
	printf("fsplit.uf=%lx,fsplit.uc[0]=%x\n",fsplit.uf,fsplit.uc[0]);
	fsign=fsplit.uc[0]&0x80;
	fexp=fsplit.uc[0]<<1;
	if (fsplit.uc[1]&0x80) fexp+=1;
	fsplit.uc[0]=0; fsplit.uc[1]|=0x80;
	printf("fsplit.uf=%lx,fsplit.uc[0]=%x\n",fsplit.uf,fsplit.uc[0]);
	printf("sign=%d,exponent=%d,mantissa=%ld\n",fsign,fexp,fsplit.ul);
	shifto=23-(fexp-127);
	l1=fsplit.ul>>shifto;
	printf("shifto=%d,whole part=%ld\n",shifto,l1);
}
void fpdis(funion f){
	long M; int E, S; //mantissa, Exponent & sign
	S=f.ui&0x8000; //sign
	M=f.ul&0x007fffff;
	E=f.uc[0]<<1;
	if (f.uc[1]&0x80) E+=1;
}
float fpnorm(long L){
	funion u; int E=150,S=0;
	u.ul=L;
	if (L){
		u.ul=L;
		if (u.sl<0){
			u.sl=-u.sl;
			S=1;
		}
		while(u.uc[0]){
			printf(">> ");
			u.ul>>=1;
			E++;
		}
		while(!(u.uc[1]&0x80)){
			printf("<< ");
			u.ul<<=1;
			E--;
		}
		printf("\nFor %ld, mantissa is %ld, exp is %d, sign is %d\n",L,u.ul,E,S);
		u.uc[0]=E>>1;
		if (!(E&1)){
			u.uc[1]&=0x7f;
		}
		if (S){
			u.uc[0]|=0x80;
		}
	} else{
		u.uf=0;
	}
	printf("Hex return is %lx\n",u.ul);
	return u.uf;
}





void main()
{
	printstr("hello World!\n");
//	fsp(1);
//	printf("fsplit.ul=%lx",fsplit.ul);
//	printf("fpnorm(1234567890)=%ld\n",(long)fpnorm(1234567890));
	printf("bigone=%lx\n",fbigone);
	printf("cvif4(bigone)=%lx\n",(float)lbigone);
//	fpnorm(0);
//	fpnorm(3);
//	fpnorm(6);
//	printf("fpnorm(-1234567890)=%ld\n",(long)fpnorm(-1234567890));
}
#include <nstdlib.c>
