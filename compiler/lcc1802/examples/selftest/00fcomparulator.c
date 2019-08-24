#include "nstdlib.h"
void fcomparulator(float x,float y){
	long lx=x; long ly=y;
	printf("for %ld:%ld scomparulator sez ",lx,ly);
	if (x<y) printf(" <");
	if (x<=y) printf(" <=");
	if (x==y) printf(" =");
	if (x!=y) printf(" !=");
	if (x>y) printf(" >");
	if (x>=y) printf(" >=");
	printf("\n");
}
void comparulator(unsigned long x,unsigned long y){
	unsigned int ix=x; unsigned int iy=y;
	printf("for %d:%d comparulator sez ",ix,iy);
	if (x<y) printf(" <");
	if (x<=y) printf(" <=");
	if (x==y) printf(" =");
	if (x!=y) printf(" !=");
	if (x>y) printf(" >");
	if (x>=y) printf(" >=");
	printf("\n");
}
void scomparulator(long x,long y){
	int ix=x; int iy=y;
	printf("for %d:%d scomparulator sez ",ix,iy);
	if (x<y) printf(" <");
	if (x<=y) printf(" <=");
	if (x==y) printf(" =");
	if (x!=y) printf(" !=");
	if (x>y) printf(" >");
	if (x>=y) printf(" >=");
	printf("\n");
}
void main( ) {
fcomparulator(10,-10);
fcomparulator(10,10);
fcomparulator(-10,10);
fcomparulator(0,10);
fcomparulator(10,0);
fcomparulator(0,-1);
fcomparulator(-1,-10);
fcomparulator(10,-10);
fcomparulator(16777215,-10);
/*scomparulator(10,-10);
scomparulator(-10,-1);
scomparulator(-11,-11);
scomparulator(-1,0);
scomparulator(0,0);
scomparulator(0,1);
scomparulator(1,1);
scomparulator(1,0);
comparulator(0,0);
comparulator(0,1);
comparulator(1,1);
comparulator(1,0);*/
}
#include "nstdlib.c"
