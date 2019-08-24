
@echo these tests are taken from the lcc distribution
call lcc "-target=xr18fl" ..\lcctest\array.c
call avd57 a
pause
call lcc "-target=xr18fl"  ..\lcctest\8q.c
call avd57 a
pause
call lcc "-target=xr18fl"  ..\lcctest\8ql.c
call avd57 a
pause
call lcc "-target=xr18fl"  ..\lcctest\8qf.c
call avd57 a
@echo And we're done!