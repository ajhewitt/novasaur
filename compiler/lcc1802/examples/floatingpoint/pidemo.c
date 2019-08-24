#include "nstdlib.h"
float denom=1, PI4=1, sign=1.0, term;
int n;
void main(){
	for (n=1;n<=12;n++){
		denom=denom+2.0;
		sign*=-1;
		PI4=PI4+sign/denom;
		printf("N=%d, PI=%f\n",n,PI4*4);
	}
}
#include "nstdlib.c"
