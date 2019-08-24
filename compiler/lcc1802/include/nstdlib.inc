;nstdlib.inc includes assembly versions of nstdlib routines strcpy, strcmp
;Oct 1 first test seems ok
;char * strcpy(char * to, const char *from)
	align 64
_strcpy:
;char *save = to; (to is R12, from is R13)
	glo R12	
	plo R15
	ghi R12
	phi R15
;for (; (*to = *from) != 0; ++from, ++to);
__strcpy: lda R13
	str R12
	inc R12
	bnz __strcpy
;return(save);
	cretn
;}


;int strcmp(const char *s1, const char *s2){  s1 will be R12, s2 R13
_strcmp:	;entry point from C program
;  int ret = 0;
	ld2z	R15	;ret is R15
;  while (!(ret = *(unsigned char *) s1 - *(unsigned char *) s2) && *s2) ++s1, ++s2;
	dec	sp	;make a work area
__strcmplp:
	lda	R13	;get string 2 character
	str	sp	;prep for compare
	lda	R12	;get string 1 character
	sm		;subtract string 2 char from string 1
	bnz	__strcmpne ;strings not equal quit
	
	ldn	sp	;check string 2 character
	bnz	__strcmplp ;back for more if not done
	inc	sp	;release the work area
	cretn		;back to caler with 0 in R15
	
__strcmpne:	;here I know they're not equal
	inc	sp		;release the work area
	bdf	__strcmpgt	;string1>string2
	dec	R15		;string 1<string 2, return -1
	cretn
__strcmpgt:
	inc	R15		;string1>string2, return 1
	cretn
