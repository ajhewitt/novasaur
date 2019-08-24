#include "nstdlib.h"
#define putc(x) out(7,x)
int up[15], down[15], rows[8], x[8];
int queens(int), print();

main()
{
	int i;
	printf("generates 92 solutions. \n15863724 is first\n\n");
	for (i = 0; i < 15; i++)
		up[i] = down[i] = 1;
	for (i = 0; i < 8; i++)
		rows[i] = 1;
	queens(0);
	printf("...and...\n84136275 is last\nTook about 25 sec on 1.6mhz elf with Christmas compiler\n");
	printf("Took about 22 sec on 1.6mhz elf with Birthday compiler\n");
	printf("Took about 17 sec on 1.6mhz elf with St Judy's compiler(from run1802 to 92nd solution)\n");
	printf("Took about 6 sec on 4mhz MC with the Rhinestone compiler(from run1802 to 92nd solution)\n");
	return 0;
}

queens(c)
{
	int r;
	//printf("queens(%d)\n",c);
	for (r = 0; r < 8; r++){
		//printf("\trows[%d]=%d\n",r,rows[r]);
		if (rows[r] && up[r-c+7] && down[r+c]) {
			rows[r] = up[r-c+7] = down[r+c] = 0;
			x[c] = r;
			if (c == 7)
				print();
			else
				queens(c + 1);
			rows[r] = up[r-c+7] = down[r+c] = 1;
		}
	}
}

print()
{
	int k;
	for (k = 0; k < 8; k++)
		printf("%c", x[k]+'1');
	printf("\n");
}

#include "nstdlib.c"
