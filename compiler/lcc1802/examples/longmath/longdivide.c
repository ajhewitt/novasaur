#include "nstdlib.h"
#include "olduino.h"

void main()
{
	unsigned int quotient, dividend,divisor ;
	printstr("long division mule\n");
	quotient=7;dividend=10*1000; divisor=10;
	printf("quotient was %d\n",quotient);
	quotient=dividend/divisor;
	printf("quotient is %d\n",quotient);

}
#include "nstdlib.c"
#include "olduino.c"
