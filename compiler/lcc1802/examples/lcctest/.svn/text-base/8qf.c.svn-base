#include "nstdlib.h"
float up[15]; float down[15];
float rows[8];
float x[8];
int queens(int), print();

main()
{
	float i;
	printf("8 queens with floats. generates 92 solutions. \n15863724 is first\n\n");
	for (i = 0; i < 15; i++)
		up[(int)i] = down[(int)i] = 1;
	for (i = 0; i < 8; i++)
		rows[(int)i] = 1;
	queens(0);
	printf("...and...\n84136275 is last\nTook about 3:48(!) sec on 1.6mhz elf with St Judy's compiler\n");
	return 0;
}

int queens(c)
{
	float r;
	//printf("queens(%d)\n",c);
	for (r = 0; r < 8; r++){
		//printf("\trows[(int)%d]=%d\n",r,rows[(int)r]);
		if (rows[(int)r] && up[(int)r-c+7] && down[(int)r+c]) {
			rows[(int)r] = up[(int)r-c+7] = down[(int)r+c] = 0;
			x[(int)c] = r;
			if (c == 7)
				print();
			else
				queens(c + 1);
			rows[(int)r] = up[(int)r-c+7] = down[(int)r+c] = 1;
		}
	}
}

int print()
{
	float k;
	for (k = 0; k < 8; k++)
		printf("%c", (char)x[(int)k]+'1');
	printf("\n");
}

#include "nstdlib.c"
