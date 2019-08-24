/* x86s running MS Windows NT 4.0 */
//dec 27 trying to have a repeatable directory setup.
//i.e. c:\lcc1802\bin\lcc.exe, \include\lccprolog.inc \examples\blink\blink.c
//jan 28 beginning work on the Birthday Compiler
//Feb 14 wrapping up birthday compiler.  default target=xr18ng
//mar 10 working on arduino ide integration
//april 12 changed default to xr18fl
//May 13 added char *peep[] for copt optimizer
//May 24 making xr182b the default target
//Oct 2  making XR18DH default
#include <string.h>

static char rcsid[] = "$Id: win32.c,v 1.19 2001/07/09 18:00:13 drh Exp $";

#ifndef LCCDIR
#define LCCDIR "C:\\lcc42\\" //wjr feb 7
#endif

char *suffixes[] = { ".c;.C;.cpp", ".i;.I", ".asm;.ASM;.s;.S", ".p;.obj;.OBJ", ".hex;.exe", 0 }; //wjr mar 10 treat .cpp as .c for arduino ide
char inputs[256] = "";
char *cpp[] = { LCCDIR "bin\\" "cpp", "-D__STDC__=1", "-Dwin32", "-D_WIN32", "-D_M_IX86", //wjr dec 27
	"$1", "$2", "$3", 0 };
char *include[] = { "-I" LCCDIR "include", 0 };

char *com[] = { LCCDIR "bin\\" "rcc", "-target=xr18DH", "$1", "$2", "$3", 0 }; //wjr dec 12, 27

//char *as[] = { "asw", "-cpu 1802", "-i ..\\..\\include", "-L", "", "", "-o $3","$1", "$2", 0 }; //wjr dec 12
char *as[] = { LCCDIR "bin\\"  "asw", "-cpu 1802", "-i " LCCDIR "include", "-L", "-quiet", "", "-o $3","$1", "$2", 0 }; //wjr dec 12

char *ld[] = { LCCDIR "bin\\"  "p2hex", "", //wjr dec 27
	"", "", "",
	"$2", "$3", "","               ",0 }; //wjr dec 12
char *peep[] = { LCCDIR "bin\\copt", LCCDIR "include\\lcc1802.opt", "-I", "$2", "-O", "$3", 0 };

extern char *concat(char *, char *);
extern char *replace(const char *, int, int);

int option(char *arg) {
	if (strncmp(arg, "-lccdir=", 8) == 0) {
		arg = replace(arg + 8, '/', '\\');
		if (arg[strlen(arg)-1] == '\\')
			arg[strlen(arg)-1] = '\0';
		cpp[0] = concat(arg, "\\bin\\cpp.exe");
		include[0] = concat("-I", concat(arg, "\\include"));
		as[0] = concat(arg, "\\bin\\asw.exe");
		com[0] = concat(arg, "\\bin\\rcc.exe");
		ld[0] = concat(arg, "\\bin\\p2hex.exe");
		//ld[8] = concat(arg, "\\liblcc.lib"); //wjr dec 27
	} else if (strcmp(arg, "-b") == 0)
		;
	else if (strncmp(arg, "-ld=", 4) == 0)
		ld[0] = &arg[4];
	else
		return 0;
	return 1;
}
