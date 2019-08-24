//fastdw.h macros for fast digital write on and off when the pin is known at compile time

#define _fastdwsetup "	ldaD memAddr,_PIN4\n	ldn memAddr\n"
#define _fastdwexec "	str memAddr\n	sex memAddr\n	out 4\n	sex 2\n"
#define fastdwon(bit) asm(_fastdwsetup opgen(ori,(1<<(bit))) _fastdwexec)
#define fastdwoff(bit) asm(_fastdwsetup opgen(ani,(~(1<<(bit)))&255) _fastdwexec)
#define opgen(op,pattern) "\t" #op " " #pattern "\n"
