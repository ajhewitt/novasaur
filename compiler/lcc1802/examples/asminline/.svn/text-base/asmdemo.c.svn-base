/*
   demo of inline assembly
   the format is just asm("string");
   where "string" is one or more lines of 1802 code in the form expected by the asw assembler
   (see the aswdoc folder for details)
   lines should start with a tab or space and must end with \n for a newline.
   you can put multiple lines into one or more strings but don't put a comma between them.
   the compiler will always generate  return at the end of a function
   but if there are no c statements or declarations there is no stack frame and no other code
   so the turnqoff() function below will generate exactly two bytes: 7A D5
*/
#include "nstdlib.h" //for printstr
#include "olduino.h" //for delay
void turnqoff(){
	asm("	req\n");
}

void main()
{
	printstr("hello World!\n");
	while(1){
		asm("	seq\n");
		delay(100);
		turnqoff();
		delay(100);
	}
}
#include "nstdlib.c"
#include "olduino.c"
