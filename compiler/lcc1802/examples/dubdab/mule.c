#include "nstdlib.h"
#include <cpu1802spd4port7.h>
void main(){
//unsigned long ul=32767;
unsigned int ui=255;
int n;
	printf("begin ul\n");
	for (n=1;n<=10;n++){
		printf("%d",ui);//printf("%ld",ul);
	}
	printf("\ndone ul\n");
}
#include "nstdlib.c"
