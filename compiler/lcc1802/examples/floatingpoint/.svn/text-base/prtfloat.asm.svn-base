segment lit
global round_nums type=array 8 of const float sclass=static scope=GLOBAL flags=0 ref=0.000000
defconst float.4 0.5
defconst float.4 0.05
defconst float.4 0.005
defconst float.4 0.0005
defconst float.4 5e-005
defconst float.4 5e-006
defconst float.4 5e-007
defconst float.4 5e-008
global mult_nums type=array 8 of const float sclass=static scope=GLOBAL flags=0 ref=0.000000
defconst float.4 1
defconst float.4 10
defconst float.4 100
defconst float.4 1000
defconst float.4 10000
defconst float.4 100000
defconst float.4 1e+006
defconst float.4 1e+007
global round_nums type=array 8 of const float sclass=static scope=GLOBAL flags=0 ref=0.000000
defconst float.4 0.5
defconst float.4 0.05
defconst float.4 0.005
defconst float.4 0.0005
defconst float.4 5e-005
defconst float.4 5e-006
defconst float.4 5e-007
defconst float.4 5e-008
segment text
function my_strlen type=unsigned int function(pointer to char) sclass=static scope=GLOBAL flags=0 ref=0.000000 ncalls=0
caller str type=pointer to char sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee str type=pointer to char sclass=register scope=PARAM flags=0 offset=0 ref=21.000000
maxoff=0
segment bss
global local_bfr type=array 128 of char sclass=static scope=LOCAL flags=0 ref=0.000000
space 128
export ftoa
segment text
function ftoa type=unsigned int function(pointer to char,float,unsigned int) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=3
caller outbfr type=pointer to char sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller flt type=float sclass=auto scope=PARAM flags=0 offset=4 ref=0.000000
caller dec_digits type=unsigned int sclass=auto scope=PARAM flags=0 offset=8 ref=0.000000
callee outbfr type=pointer to char sclass=register scope=PARAM flags=0 offset=0 ref=4.000000
callee flt type=float sclass=register scope=PARAM flags=0 offset=4 ref=5.000000
callee dec_digits type=unsigned int sclass=register scope=PARAM flags=0 offset=8 ref=17.500000
maxoff=0
segment data
export pi
global pi type=float sclass=auto scope=GLOBAL flags=0 ref=0.000000
defconst float.4 3.14159
export gbuffer
global gbuffer type=array 128 of char sclass=auto scope=GLOBAL flags=0 ref=0.000000
defstring "\000\000"
defstring "\000\000"
defstring "\000\000"
defstring "\000\000"
defstring "\000\000"
defstring "\000\000"
defstring "\000\000"
defstring "\000\000"
space 112
export len
global len type=int sclass=auto scope=GLOBAL flags=0 ref=0.000000
defconst int.2 66
export main
segment text
function main type=void function(void) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=3
maxoff=0
export strcpy
function strcpy type=pointer to char function(pointer to char,pointer to const char) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=0
caller to type=pointer to char sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller from type=pointer to const char sclass=auto scope=PARAM flags=0 offset=2 ref=0.000000
callee to type=pointer to char sclass=register scope=PARAM flags=0 offset=0 ref=21.000000
callee from type=pointer to const char sclass=register scope=PARAM flags=0 offset=2 ref=20.000000
maxoff=0
function strlen type=unsigned int function(pointer to char) sclass=static scope=GLOBAL flags=0 ref=0.000000 ncalls=0
caller str type=pointer to char sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee str type=pointer to char sclass=register scope=PARAM flags=0 offset=0 ref=20.000000
maxoff=0
export printstr
function printstr type=void function(pointer to char) sclass=auto scope=GLOBAL flags=0 ref=1.000000 ncalls=1
caller ptr type=pointer to char sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee ptr type=pointer to char sclass=register scope=PARAM flags=0 offset=0 ref=20.000000
maxoff=0
export ftoa
function ftoa type=pointer to char function(float,pointer to char,unsigned int) sclass=auto scope=GLOBAL flags=0 ref=1.000000 ncalls=8
caller flt type=float sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller outbfr type=pointer to char sclass=auto scope=PARAM flags=0 offset=4 ref=0.000000
caller dec_digits type=unsigned int sclass=auto scope=PARAM flags=0 offset=6 ref=0.000000
callee flt type=float sclass=register scope=PARAM flags=0 offset=0 ref=4.000000
callee outbfr type=pointer to char sclass=auto scope=PARAM flags=0 offset=4 ref=2.000000
callee dec_digits type=unsigned int sclass=register scope=PARAM flags=0 offset=6 ref=4.000000
maxoff=0
export itoa
function itoa type=pointer to char function(int,pointer to char) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=0
caller s type=int sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller buffer type=pointer to char sclass=auto scope=PARAM flags=0 offset=2 ref=0.000000
callee s type=int sclass=auto scope=PARAM flags=0 offset=0 ref=2.000000
callee buffer type=pointer to char sclass=auto scope=PARAM flags=0 offset=2 ref=2.000000
maxoff=0
export ltoa
function ltoa type=pointer to char function(long int,pointer to char) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=2
caller s type=long int sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller buffer type=pointer to char sclass=auto scope=PARAM flags=0 offset=4 ref=0.000000
callee s type=long int sclass=register scope=PARAM flags=0 offset=0 ref=3.000000
callee buffer type=pointer to char sclass=auto scope=PARAM flags=0 offset=4 ref=2.000000
maxoff=0
export printint
function printint type=void function(int) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=2
caller s type=int sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee s type=int sclass=auto scope=PARAM flags=0 offset=0 ref=1.000000
maxoff=0
export printlint
function printlint type=void function(long int) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=2
caller s type=long int sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee s type=long int sclass=auto scope=PARAM flags=0 offset=0 ref=1.000000
maxoff=0
export printflt
function printflt type=void function(float) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=2
caller s type=float sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee s type=float sclass=auto scope=PARAM flags=0 offset=0 ref=1.000000
maxoff=0
export putxn
function putxn type=void function(unsigned char) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=2
caller x type=int sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee x type=unsigned char sclass=auto scope=PARAM flags=0 offset=0 ref=2.000000
maxoff=0
export putx
function putx type=void function(unsigned char) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=2
caller x type=int sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee x type=unsigned char sclass=auto scope=PARAM flags=0 offset=0 ref=2.000000
maxoff=0
address 133-198 type=pointer to void sclass=static scope=GLOBAL flags=computed|generated ref=1.000000
export printf
function printf type=void function(pointer to char,...) sclass=auto scope=GLOBAL flags=0 ref=3.000000 ncalls=14
caller ptr type=pointer to char sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee ptr type=pointer to char sclass=auto scope=PARAM flags=addressed offset=0 ref=27.250000
maxoff=0
export exit
function exit type=void function(int) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=1
caller code type=int sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
callee code type=int sclass=auto scope=PARAM flags=0 offset=0 ref=1.000000
maxoff=0
export memcmp
function memcmp type=int function(pointer to const void,pointer to const void,unsigned int) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=0
caller Ptr1 type=pointer to const void sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller Ptr2 type=pointer to const void sclass=auto scope=PARAM flags=0 offset=2 ref=0.000000
caller Count type=unsigned int sclass=auto scope=PARAM flags=0 offset=4 ref=0.000000
callee Ptr1 type=pointer to const void sclass=auto scope=PARAM flags=0 offset=0 ref=1.000000
callee Ptr2 type=pointer to const void sclass=auto scope=PARAM flags=0 offset=2 ref=1.000000
callee Count type=unsigned int sclass=register scope=PARAM flags=0 offset=4 ref=10.000000
maxoff=0
export memcpy
function memcpy type=pointer to void function(pointer to void,pointer to const void,unsigned int) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=0
caller dest type=pointer to void sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller src type=pointer to const void sclass=auto scope=PARAM flags=0 offset=2 ref=0.000000
caller count type=unsigned int sclass=auto scope=PARAM flags=0 offset=4 ref=0.000000
callee dest type=pointer to void sclass=auto scope=PARAM flags=0 offset=0 ref=2.000000
callee src type=pointer to const void sclass=auto scope=PARAM flags=0 offset=2 ref=1.000000
callee count type=unsigned int sclass=register scope=PARAM flags=0 offset=4 ref=10.000000
maxoff=0
export memset
function memset type=pointer to void function(pointer to void,int,unsigned int) sclass=auto scope=GLOBAL flags=0 ref=0.000000 ncalls=0
caller s type=pointer to void sclass=auto scope=PARAM flags=0 offset=0 ref=0.000000
caller c type=int sclass=auto scope=PARAM flags=0 offset=2 ref=0.000000
caller n type=unsigned int sclass=auto scope=PARAM flags=0 offset=4 ref=0.000000
callee s type=pointer to void sclass=auto scope=PARAM flags=0 offset=0 ref=2.000000
callee c type=int sclass=register scope=PARAM flags=0 offset=2 ref=10.000000
callee n type=unsigned int sclass=register scope=PARAM flags=0 offset=4 ref=10.000000
maxoff=0

import out
import dubdabx
import putc
segment lit
global 137 type=array 9 of char sclass=static scope=GLOBAL flags=generated ref=1.000000
defstring "exit %d\012\000"
global 59 type=array 38 of char sclass=static scope=GLOBAL flags=generated ref=1.000000
defstring "ftoa returns %d, gbuffer contains %s\012\000"
global 58 type=array 14 of char sclass=static scope=GLOBAL flags=generated ref=1.000000
defstring "hello World!\012\000"
global 32 type=array 35 of char sclass=static scope=GLOBAL flags=generated ref=1.000000
defstring "whole=%ld,fltdec=%lx, decimal=%ld\012\000"
global 28 type=long double sclass=static scope=GLOBAL flags=generated ref=3.000000
defconst float.8 2
global 27 type=float sclass=static scope=GLOBAL flags=generated ref=2.000000
defconst float.4 2.14748e+009
global 23 type=array 10 of char sclass=static scope=GLOBAL flags=generated ref=1.000000
defstring "mult=%ld\012\000"
global 14 type=double sclass=static scope=GLOBAL flags=generated ref=1.000000
defconst float.8 -1
global 13 type=double sclass=static scope=GLOBAL flags=generated ref=2.000000
defconst float.8 0.0
progend
