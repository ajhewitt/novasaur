set BUILDDIR=c:\lcc42\bin
rem set PATH=%PATH%;"C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin"
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat"
nmake -f makefile.nt all
rem nmake /G /G /P -f makefile.nt HOSTFILE=etc/win32.c lcc 

rem to compile "ops" gcc  -Isrc etc\ops.c
rem to run it ops c=1 s=2 i=2 l=4 h=4 f=4 d=8 x=8 p=2

pause
