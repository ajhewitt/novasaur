;from http://www.elf-emulation.com/software/fp.asm - thanks to mike Reilley
;maybe originally from RCA
;these routines use ALL the registers from 6-15!
;8-15 were more or less available to start with
;it saves 6 when it uses it
;I save 7 on entry and restore on exit
;to keep my sanity I renamed some register equates where I was changing them e.g. F7 used to be RB
FB	equ	11	;was R9
F9	equ	9	;was R7
F7	equ	7	;was RB
;April 1 added code to fp_add to restore resgisters when returning a 0 - around add_nz:
; *** Convert signed long to float
; *** RL8-1:RL8 is the number to convert(8:9)
; *** result in same register
; *** uses memaddr.1 for sign, .0 for shift count/exponent
	align 256
cvif4:	ldi	0
	phi	memaddr	;sign
	ldi	150	;150 is  the 127 exponent bias plus the 23 required to shift a long 1 to bit 23
	plo	memaddr	;
	ghi	RL8-1	;get sign and bits 7-1 of exponent
	bz	$$nxt	;keep testing for 0
	shl		;sign bit to df
	bnf	$$sgnpos ;number is >0
	shrc		;shift it back so we know byte is non-zerro
	phi	memaddr	;save it
	negi4	RL8,RL8	;flip the number
	br	$$sgnpos ;go handle positive long
$$nxt:	glo	RL8-1	;next byte
	bnz	$$sgnpos ;sign is positive, number is not 0
	ghi	RL8	;next byte
	bnz	$$sgnpos ;sign is positive, number is not 0
	glo	RL8	;last byte
	bz	$$done	;the whole thing is zero so we're done
$$sgnpos: ghi	RL8-1	;top byte - begin shifting right to clear it
	bz	$$shl	;if it's zero we're done right shifting
	inc	memaddr	;increase exponent 1 for each right shift
	shru4	RL8
	br	$$sgnpos
$$shl:	glo	RL8-1	;check bit 23
	ani	0x80	;isolate it
	bnz	$$shdn	;if it's on we're done here
	dec	memaddr	;decrease exponent 1 for each left shift
	shl4	RL8	;shift mantissa left one
	br	$$shl
$$shdn:	glo	memaddr	;get the exponent
	shr		;shift right so it can go into bits 31-24
	phi	RL8-1	;put top bits of exponent into place
	bdf	$$setsgn ;if the bit 0 is on we're done
	glo	RL8-1	;get the byte
	ani	0x7f	;clear bit 23
	plo	RL8-1	;put it back
$$setsgn: ghi	memaddr	;get the original sign byte
	bz	$$done	;sign bit is already zero so we're done
	ghi	RL8-1	;get the sign byte
	ori	0x80	;set the sign bit
	phi	RL8-1	;place it
$$done:	Cretn		;and we're done
	


; *** Convert float to signed long
; *** RL8-1:RL8 is the number to convert(8:9)
; *** result in same register
	align 256
cvfi4:
	ghi	RL8-1	;get sign and bits 7-1 of exponent
	phi	memaddr ;save for later
	glo	RL8-1	;get bit 0 of exponent
	shl		;shift to df
	ghi	memaddr	;get exponent 7-1
	shlc		;combine with 0
;the following sequence is equivalent to sdi 150; I did it this way to coddle my emulator which doesn't do this properly.
	dec	sp
	str	sp
	ldi	150
	sm		;calculate shift count needed
;*******note - the df flag set here is tested later
	plo	memaddr
	inc	sp	;release work area
;end of sdi 150 sequence - now convert the mantissa to unsigned long
	ldi	0
	phi	RL8-1	;clear the top byte of the float
	glo	RL8-1	;get the next byte
	ori	0x80	;add in the implied 1 bit
	plo	RL8-1	;put it back
	glo	memaddr	;make sure there's at least 1 shift
	bz	$$sign
;**********note df is set from subtraction before setting mantissa
	bnf	$$lsh ; if the shift count is negative

$$shr:	shru4	RL8
	dec	memaddr	;check shift count
	glo	memaddr
	bnz	$$shr	;complete the shift
	br	$$sign

;handle negative shift as best I can - gigo
$$lsh: 	shl4	RL8	;shift once
	inc	memaddr
	glo	memaddr
	bnz	$$lsh	
	
$$sign:	ghi	memaddr	;now the sign
	shl		;shift sign bit into df
	bnf	$$done
	negi4	RL8,RL8	;negate the number if needed
	br	$$done	; and return

$$done:	Cretn		;and we're done

; *** Check if character is numeric
; *** D - char to check
; *** Returns DF=1 if numeric
; ***         DF=0 if not
f_isnum:   plo     r14                 ; save a copy
           smi     '0'                 ; check for below zero
           bnf     fails               ; jump if below
           smi     10                  ; see if above
           bdf     fails               ; fails if so
passes:    smi     0                   ; signal success
           lskp
fails:     adi     0                   ; signal failure
           glo     r14                 ; recover character
           sep     RRET                ; and return; *******************************
; *** Shift R8:F9 right 1 bit ***
; *******************************
fp_shr_1:  ghi   r8                    ; shift high word right
           shr
           phi   r8
           glo   r8
           shrc
           plo   r8
           ghi   F9                    ; shift low word right
           shrc
           phi   F9
           glo   F9
           shrc
           plo   F9
           Cretn

; ******************************
; *** Shift R8:F9 left 1 bit ***
; ******************************
fp_shl_1:  glo   F9
           shl
           plo   F9
           ghi   F9
           shlc
           phi   F9
           glo   r8
           shlc
           plo   r8
           ghi   r8
           shlc
           phi   r8
           sep   RRET

; **********************
; *** R8:F9 += RA:FB ***
; **********************
fp_add_12: glo   FB
	   dec r2	;wjr - make a work area
           str   r2
           glo   F9
           add
           plo   F9
           ghi   FB
           str   r2
           ghi   F9
           adc
           phi   F9
           glo   R10
           str   r2
           glo   r8
           adc
           plo   r8
           ghi   R10
           str   r2
           ghi   r8
           adc
           phi   r8
           inc	r2	;wjr - release work area
           Cretn

; *******************************
; *** Shift RF:RD right 1 bit ***
; *******************************
fp_shr_fd: ghi   R15                    ; shift high word right
           shr
           phi   R15
           glo   R15
           shrc
           plo   R15
           ghi   R13                    ; shift low word right
           shrc
           phi   R13
           glo   R13
           shrc
           plo   R13
           Cretn

; *************************************
; *** Scale number to high bit is 1 ***
; *** R8:F9 - Number to scale       ***
; *** RF.1  - Exponent for number   ***
; *** F7.0  - Sign bit (bit 0) ***
; *** Returns: R8:F9 - final sp num ***
; *************************************
fp_sc_up:  glo   r8                    ; need high bit to be a 1
           ani   080h                  ; check it
           lbnz  fp_sc_cln             ; jump if good
           Ccall fp_shl_1              ; shift answer left
           ghi   R15                    ; get exp1
           smi   1                     ; minus 1
           phi   R15                    ; and put it back
           lbr   fp_sc_up              ; loop back intil msbit is 1
fp_sc_cln: glo   r8                    ; get high byte
           shl                         ; shift out high 1 bit
           plo   r8                    ; set aside
           ghi   R15                    ; get exponent byte
           phi   r8                    ; write other 7 bits to r8.1
           shr                         ; shift bit 0 into DF
           glo   r8                    ; get high byte of mantissa
           shrc                        ; shift bit 0 of expnent in
           plo   r8                    ; and put it back
           glo   F7                   ; get signs
           shr                         ; get sign 1
           ghi   r8                    ; recover exponent
           shrc                        ; shift in sign
           phi   r8                    ; put it back
           inc	r2	;wjr release work area
	   popr R13	;wjr restore param regs
	   popr R12	;wjr
           popr	F7	;wjr restore c variable register
           Cretn                       ; return to caller

; ************************************
; *** Get exponenst from arguments ***
; *** R8:F9 - Arg 1                ***
; *** RA:FB - Arg 2                ***
; *** Returns: RF.1 - exp1         ***
; ***          RF.0 - exp2         ***
; ************************************
fp_getexp: glo   r8                    ; get exponent of arg1 (bit 0)
           shl                         ; shift it into DF
           ghi   r8                    ; get top 7 bits
           shlc                        ; shift in first bit
           phi   R15                    ; put exp1 into RF.1
           ;str   r2    wjr - this is never used; place into memory as well
           glo   R10                    ; get exponent of arg2 (bit 0)
           shl                         ; shift it into DF
           ghi   R10                    ; get top 7 bits
           shlc                        ; shift in first bit
           plo   R15                    ; put into RF
           sep   RRET                  ; return to caller

; ************************************
; *** Get signs from arguments     ***
; *** R8:F9 - Arg 1                ***
; *** RA:FB - Arg 2                ***
; *** Returns: F7.0 - signs        ***
; ************************************
fp_getsgn: ghi   r8                    ; get sign of arg1
           shl                         ; shift into DF
           ghi   R10                    ; get sign of arg2
           shlc                        ; shift into DF, sign of arg1 to bit 0
           shlc                        ; now shift in sign of arg2
           plo   F7                    ; save them
           Cretn                       ; return to caller

; ***************************************
; *** Add 2 SP floating point numbers ***
; *** R8:F9 - Arg 1                   ***
; *** RA:FB - Arg 2                   ***
; *** Returns: R8:F9 - Answer         ***
; *** Usage: RF.0 - exponent of arg1  ***
; ***        RF.1 - exponent of arg2  ***
; ***        F7.0 - signs        ***
; ***************************************
fp_add:   ghi   r8                    ; check arg1 for zero
           lbnz  add_a1nz
           glo   r8
           lbnz  add_a1nz
           ghi   F9
           lbnz  add_a1nz
           glo   F9
           lbnz  add_a1nz
           ghi   R10                    ; transfer arg2 to answer
           phi   r8
           glo   R10
           plo   r8
           ghi   FB
           phi   F9
           glo   FB
           plo   F9
           Cretn                        ; return to caller

add_a1nz:  ghi   R10                    ; check arg2 for zero
           lbnz  add_a2nz
           glo   R10
           lbnz  add_a2nz
           ghi   FB
           lbnz  add_a2nz
           glo   FB
           lbnz  add_a2nz
           Cretn                       ; return arg1 as answer
           
add_a2nz:  pushr F7	;wjr save c variable register
	   pushr R12	;wjr save param regs
	   pushr R13	;wjr
	   dec	r2	;wjr - make a work area
	   Ccall fp_getexp             ; get exponents
           ghi   R15
           str   r2
           glo   R15
           sm                          ; perfrom exp2 - exp1
           lbnf  add_ns                ; jump if no swap needed

           ghi   r8                    ; swap arg1 with arg2
           plo   R14
           ghi   R10
           phi   r8
           glo   R14
           phi   R10
           glo   r8
           plo   R14
           glo   R10
           plo   r8
           glo   R14
           plo   R10
           ghi   F9                    ; swap arg1 with arg2
           plo   R14
           ghi   FB
           phi   F9
           glo   R14
           phi   FB
           glo   F9
           plo   R14
           glo   FB
           plo   F9
           glo   R14
           plo   FB
           ghi   R15                    ; swap exponents
           plo   R14
           glo   R15
           phi   R15
           glo   R14
           plo   R15
add_ns:    ccall fp_getsgn              ; get signs of arguments
           ldi   0                     ; setup mantissas
           phi   r8
           phi   R10
           ldi   128                   ; need to set high bit in mantissa
           str   r2
           glo   r8
           or
           plo   r8
           glo   R10
           or
           plo   R10
           ghi   R15                    ; get exp1
           str   r2                    ; place into memory
add_lp1:   glo   R15                    ; get exp2
           sm                          ; see if match to exp1
           lbz   add_lp1dn             ; jump if match
           glo   R15                    ; need to increase it
           adi   1
           plo   R15
           glo   R10                    ; now shift arg2 over 1 bit
           shr
           plo   R10
           ghi   FB
           shrc
           phi   FB
           glo   FB
           shrc
           plo   FB
           lbr   add_lp1               ; keep shifting until exponents match
add_lp1dn: glo   F7                    ; see if signs match
           str   r2
           shr
           xor
           ani   1                     ; keep only bottom bit
           lbnz  add_nm                ; jump if signs do not match
           Ccall fp_add_12             ; perform arg1 += arg2
           lbr   add_fnl               ; jump to clean up
add_nm:    glo   FB                    ; perform arg1 - arg2
           str   r2
           glo   F9
           sm
           plo   R12                    ; place into RD:RC
           ghi   FB
           str   r2
           ghi   F9
           smb
           phi   R12
           glo   R10
           str   r2
           glo   r8
           smb
           plo   R13
           ghi   R10
           str   r2
           ghi   r8
           smb
           phi   R13
           lbnf  add_no                ; jump if arg2 was larger than arg1
           ghi   R13                    ; transfer result to arg1
           phi   r8
           glo   R13
           plo   r8
           ghi   R12
           phi   F9
           glo   R12
           plo   F9
           lbr   add_fnl               ; finalize
add_no:    glo   F9                    ; perform arg1 = arg2 - arg1
           str   r2
           glo   FB
           sm
           plo   F9
           ghi   F9
           str   r2
           ghi   FB
           smb
           phi   F9
           glo   r8
           str   r2
           glo   R10
           smb
           plo   r8
           ghi   r8
           str   r2
           ghi   R10
           smb
           phi   r8
           glo   F7                    ; move sign 2 to sign1
           shl
           plo   F7
add_fnl:   ghi   r8                    ; check for zero result
           lbnz  add_nz                ; jump if not
           glo   r8
           lbnz  add_nz
           ghi   F9
           lbnz  add_nz
           glo   F9
           lbnz  add_nz
           inc	r2	;wjr release work area
	   popr R13	;wjr restore param regs
	   popr R12	;wjr
           popr	F7	;wjr restore c variable register
           Cretn                       ; return the zero
add_nz:    ghi   r8                    ; see if answer is beyond 24 bits
           lbz   add_nx                ; jump if not
           Ccall fp_shr_1              ; shift answer to the right
           ghi   R15                    ; get exp1
           adi   1                     ; increment it
           phi   R15                    ; and put it back
           lbr   add_nz                ; keep going until not > 24 bits

add_nx:    glo   F7                    ; move sign 1 to low bit
           shr
           plo   F7
           lbr   fp_sc_up              ; scale number and build answer

; ***************************************
; *** sub 2 SP floating point numbers ***
; *** R8:F9 - Arg 1                   ***
; *** RA:FB - Arg 2                   ***
; *** Returns: R8:F9 - Answer         ***
; ***************************************
fp_sub:    ghi   R10                    ; change sign of arg2
           xri   080h
           phi   R10                    ; and put it back
           lbr   fp_add                ; now just add

; ***************************************
; *** Div 2 SP floating point numbers ***
; *** R8:F9 - Arg 1                   ***
; *** RA:FB - Arg 2                   ***
; *** Returns: R8:F9 - Answer         ***
; *** Usage: RF.0 - exponent of arg1  ***
; ***        RF.1 - exponent of arg2  ***
; ***        F7.0 - signs        ***
; ***************************************
fp_div:    ghi   r8                    ; check arg1 for zero
           lbnz  div_a1nz
           glo   r8
           lbnz  div_a1nz
           ghi   F9
           lbnz  div_a1nz
           glo   F9
           lbnz  div_a1nz
           Cretn	                ; just return the zero
div_a1nz:  ghi   R10                    ; check arg2 for zero
           lbnz  div_a2nz
           glo   R10
           lbnz  div_a2nz
           ghi   FB
           lbnz  div_a2nz
           glo   FB
           lbnz  div_a2nz
           ghi   r8                    ; need sign of arg1
           ani   080h                  ; want only sign
           ori   07fh                  ; exponent will be all ones
           phi   r8                    ; put into answer
           ldi   080h                  ; build rest of answer
           plo   r8 
           ldi   0
           phi   F9
           plo   F9
           Cretn                  	; and return to caller

div_a2nz:  pushr F7	;wjr save the C variable
	   pushr R12	;wjr save param regs
	   pushr R13	;wjr
	   dec r2	;wjr make a work area -r7 is restores and 2 inc'd in the cleanup routine fp_sc_up

	   Ccall fp_getexp              ; get exponents
           Ccall fp_getsgn		; get signs
           glo   R15                    ; get exp2
           smi   127                   ; remove bias
           str   r2                    ; place into memory
           ghi   R15                    ; get exp1
           smi   127                   ; remove bias
           sm                          ; perform exp1 - exp2
           adi   127                   ; put bias back in
           stxd                        ; save onto stack
           glo   F7                    ; determine sign for answer
           str   r2
           shr
           xor
           stxd                        ; place onto stack
           ldi   0                     ; setup man
           phi   R10
           glo   R10
           ori   080h
           plo   R10
           ldi   0                     ; setup div
           phi   r8
           glo   r8
           ori   080h
           plo   r8
           ldi   0                     ; setup result
           phi   R12
           plo   R12
           phi   F7
           plo   F7
           plo   R15                    ; setup quotient
           phi   R15
           phi   R13
           plo   R13
           ldi   080h
           plo   R15
div_lp:    ghi   r8                    ; check div for nonzero
           lbnz  div_go1
           glo   r8
           lbnz  div_go1
           ghi   F9
           lbnz  div_go1
           glo   F9
           lbnz  div_go1
           lbr   div_z
div_go1:   ghi   R10
           lbnz  div_go
           glo   R10
           lbnz  div_go
           ghi   FB
           lbnz  div_go
           glo   FB
           lbnz  div_go
           lbr   div_z                 ; nothing more to do
div_go:    glo   FB                    ; see if div > man
           str   r2
           glo   F9
           sm
           ghi   FB
           str   r2
           ghi   F9
           smb
           glo   R10
           str   r2
           glo   r8
           smb
           ghi   R10
           str   r2
           ghi   r8
           smb
           lbnf  div_nope              ; jump if div was smaller
           glo   FB                    ; div -= man
           str   r2
           glo   F9
           sm
           plo   F9
           ghi   FB
           str   r2
           ghi   F9
           smb
           phi   F9
           glo   R10
           str   r2
           glo   r8
           smb
           plo   r8
           ghi   R10
           str   r2
           ghi   r8
           smb
           phi   r8
           ghi   R15                    ; merge quotient into result
           str   r2
           ghi   R12
           or
           phi   R12
           glo   R15
           str   r2
           glo   R12
           or
           plo   R12
           ghi   R13
           str   r2
           ghi   F7
           or
           phi   F7
           glo   R13
           str   r2
           glo   F7
           or
           plo   F7
div_nope:  sep   RCALL                 ; shift quotient right
           dw    fp_shr_fd
           ghi   R10                    ; shift divisor right
           shr
           phi   R10
           glo   R10
           shrc
           plo   R10
           ghi   FB
           shrc
           phi   FB
           glo   FB
           shrc
           plo   FB
           lbr   div_lp                ; loop back until done
div_z:     ghi   R12                    ; move result to arg1
           phi   r8
           glo   R12
           plo   r8
           ghi   F7
           phi   F9
           glo   F7
           plo   F9
           irx                         ; recover sign
           ldxa
           plo   F7
           ldx                         ; recover answer exponent
           phi   R15
           lbr   fp_sc_up              ; scale number and build answer

; ***************************************
; *** Mul 2 SP floating point numbers ***
; *** R8:F9 - Arg 1                   ***
; *** RA:FB - Arg 2                   ***
; *** Returns: R8:F9 - Answer         ***
; *** Usage: RF.0 - exponent of arg1  ***
; ***        RF.1 - exponent of arg2  ***
; ***        F7.0 - signs             ***
; ***************************************
fp_mul:    pushr F7	;wjr save the C variable
	   pushr R12	;wjr save param regs
	   pushr R13	;wjr
	   dec r2	;wjr make a work area -r7 is restores and 2 inc'd in the cleanup routine fp_sc_up

           Ccall    fp_getexp	       ; get exponents
           Ccall    fp_getsgn            ; get signs
           glo   R15                    ; get exp2
           smi   127                   ; remove bias
           str   r2                    ; place into memory
           ghi   R15                    ; get exp1
           smi   127                   ; remove bias
           add                         ; add in exponent 2
           adi   127                   ; put bias back in
           stxd                        ; place onto stack
           glo   F7                    ; determine sign for answer
           str   r2
           shr
           xor
           stxd                        ; place onto stack
           ghi   R14                    ; get baud constant
           stxd                        ; save on stack
           ghi   r6                    ; save return position on stack
           stxd
           glo   r6
           stxd
           ldi   0                     ; initial value of ct
           stxd
           phi   R14                    ; set mulH to 0
           plo   R14
           phi   r6
           plo   r6
           phi   r8                    ; mulL = arg1 & 0xffffff
           glo   r8                    ; be sure high bit is set
           ori   080h
           plo   r8
           ldi   0
           phi   R12                    ; set result to 0
           plo   R12
           phi   F7
           plo   F7
           phi   R15
           plo   R15
           phi   R13
           plo   R13
           phi   R10                    ; arg2 &= 0ffffff
           glo   R10                    ; be sure high bit is set
           ori   080h
           plo   R10
mul_lp1:   glo   FB                    ; check for zero multiplier
           lbnz  mul_go1               ; jump if not zero
           ghi   FB
           lbnz  mul_go1
           glo   R10
           lbnz  mul_go1
           ghi   R10
           lbz   mul_dn                ; jump if muliplier is zero
mul_go1:   ghi   R10                    ; shift multiplier right
           shr
           phi   R10
           glo   R10
           shrc
           plo   R10
           ghi   FB
           shrc
           phi   FB
           glo   FB
           shrc
           plo   FB
           lbnf  mul_no                ; jump if low bit was zero
           glo   F9                    ; res += mul
           str   r2
           glo   F7
           add
           plo   F7
           ghi   F9
           str   r2
           ghi   F7
           adc
           phi   F7
           glo   r8
           str   r2
           glo   R12
           adc
           plo   R12
           ghi   r8
           str   r2
           ghi   R12
           adc
           phi   R12
           glo   r6                    ; now high 32 bits
           str   r2
           glo   R13
           add
           plo   R13
           ghi   r6
           str   r2
           ghi   r6
           str   r2
           ghi   R13
           adc
           phi   R13
           glo   R14
           str   r2
           glo   R15
           adc
           plo   R15
           ghi   R14
           str   r2
           ghi   R15
           adc
           phi   R15
           ghi   R12                    ; see if need carry from low to high
           lbz   mul_no                ; jump if no carry is needed
           glo   R13                    ; move the carry on over
           adi   1
           plo   R13
           ghi   R13
           adci  0
           phi   R13
           glo   R15
           adci  0
           plo   R15
           ghi   R15
           adci  0
           phi   R15
mul_no:    irx                         ; recover ct
           ldx
           adi   1                     ; increment by 1
           stxd                        ; and put it back
           glo   F9                    ; shift mulL left
           shl
           plo   F9
           ghi   F9
           shlc
           phi   F9
           glo   r8
           shlc
           plo   r8
           ghi   r8
           shlc
           phi   r8
           glo   r6                    ; shift mulH left
           shl
           plo   r6
           ghi   r6
           shlc
           phi   r6
           glo   R14
           shlc
           plo   R14
           ghi   R14
           shlc
           phi   R14
           ghi   r8                    ; see if a carry is needed
           lbz   mul_lp1               ; jump if not
           ldi   0                     ; zero the high byte
           phi   r8
           glo   r6                    ; add in the carry
           ori   1
           plo   r6
           lbr   mul_lp1               ; loop back for more
mul_dn:    irx                         ; recover ct
           ldxa
           plo   R14                    ; set aside
           ldxa
           plo   r6
           ldxa
           phi   r6
           ldx
           phi   R14
           ghi   R12                    ; transfer resL to arg1
           phi   r8
           glo   R12
           plo   r8
           ghi   F7
           phi   F9
           glo   F7
           plo   F9
           glo   R14
           plo   R12                    ; put ct into RC.0
mul_lp2:   glo   R12                    ; get ct
           smi   2                     ; see if <2
           lbnf  mul_nxt1              ; jump if so
           sep   RCALL                 ; shift answer to the right
           dw    fp_shr_1
           sep   RCALL                 ; shift resH right
           dw    fp_shr_fd
           lbnf  mul_lp2a              ; jump if no carry into low word
           glo   r8                    ; set high bit
           ori   080h
           plo   r8
mul_lp2a:  dec   R12                    ; decrement count
           lbr   mul_lp2               ; loop back to keep checking
mul_nxt1:  irx                         ; recover sign
           ldxa
           plo   F7
           ldx                         ; recover answer exponent
           plo   R12
mul_lp3:   ghi   R15                    ; check resH for nonzero
           lbnz  mul_lp3a
           glo   R15
           lbnz  mul_lp3a
           ghi   R13
           lbnz  mul_lp3a
           glo   R13
           lbnz  mul_lp3a
           lbr   mul_lp4               ; jump if no bits set in resH
mul_lp3a:  inc   R12                    ; increment exponent
           Ccall fp_shr_1                ; shift answer to the right
           Ccall fp_shr_fd               ; shift resH right
           lbnf  mul_lp3               ; jump if no carry into low word
           glo   r8                    ; set high bit
           ori   080h
           plo   r8
           lbr   mul_lp3
mul_lp4:   glo   R12                    ; transfer exponent
           phi   R15                    ; to high R15
           lbr   fp_sc_up              ; scale number and build answer

; ***************************************
; *** Convert ascii to floating point ***
; *** RF - buffer to ascii text       ***
; *** Returns: R8:F9 - number         ***
; ***************************************
fp_atof:   lda   R15                    ; get byte from buffer
           smi   ' '                   ; check for space
           lbz   fp_atof               ; move past any spaces
           dec   R15                    ; point back to nonspace chara
           ldn   R15                    ; check for possible sign
           smi   '-'                   ; first check for minus
           lbnz   atof_nm              ; jump if not minus
           ldi   080h                  ; high bit set for minus
           stxd                        ; place onto stack
           inc   R15                    ; move past sign
           lbr   atof_go1              ; and continue
atof_nm:   ldi   0                     ; indicate positive number
           stxd                        ; place onto stack
           ldn   R15                    ; now check for + sign
           smi   '+'
           lbnz  atof_go1              ; jump if not plus
           inc   R15                    ; move past plus sign
atof_go1:  ldi   0                     ; setup result
           phi   r8
           plo   r8
           phi   F9
           plo   F9
atof_lp1:  ldn   R15                    ; get next byte from buffer
           Ccall f_isnum                ; is it numeric
           lbnf  atof_no1              ; jump if not
           ghi   r8                    ; copy arg1 to arg2
           phi   R10
           glo   r8
           plo   R10
           ghi   F9
           phi   FB
           glo   F9
           plo   FB
           Ccall fp_shl_1                ; multiply arg1 by 2
           Ccall fp_shl_1                 ; multiply arg1 by 4
           Ccall fp_add_12                ; multiply arg1 by 5
           Ccall fp_shl_1                ; multiply arg1 by 10
           lda   R15                    ; get number
           smi   '0'                   ; convert to binary
           str   r2                    ; setup for add
           glo   F9                    ; add in next digit
           add
           plo   F9
           ghi   F9                    ; propagate carry
           adci  0
           phi   F9
           glo   r8
           adci  0
           plo   r8
           ghi   r8
           adci  0
           phi   r8
           lbr   atof_lp1              ; loop until no more digits
atof_no1:  ldn   R15                    ; check for decimal point
           smi   '.'
           lbnz  atof_ndp              ; jump if none
           inc   R15                    ; move past decimal
atof_ndp:  ldi   scratch>>8          ; point to scratch area
           phi   R10
           ldi   scratch&255
           plo   R10
           ldi   16                    ; 16 bytes to clear
           plo   R12
atof_lpx:  ldi   0
           str   R10
           inc   R10
           dec   R12
           glo   R12
           lbnz  atof_lpx
           ldi   (scratch+1)>>8      ; point to scratch area
           phi   R10
           ldi   (scratch+1)&255
           plo   R10
           ldi   1                     ; setup count
           plo   R12
           ldi   0                     ; setup exp flag
           phi   R12
atof_lp2:  glo   R12                    ; see if done making bcd
           smi   17
           lbz   atof_dn3              ; jump if so
           ldn   R15                    ; get character
           sep   RCALL                 ; is it numeric
           dw    f_isnum
           lbnf  atof_dn3              ; jump if not
           lda   R15                    ; get character
           smi   '0'                   ; converto to binary
           str   R10                    ; write into bcd area
           inc   R10
           inc   R12                    ; increment count
           lbnz  atof_lp2              ; loop back until done
           ldi   1                     ; set non zero flag
           phi   R12
           lbr   atof_lp2
atof_dn3:  ghi   R12                    ; check for non-zero digits
           lbnz  atof_nz
           ghi   r8                    ; check for non-zero integer
           lbnz  atof_nz
           glo   r8
           lbnz  atof_nz
           ghi   F9
           lbnz  atof_nz
           glo   F9
           lbnz  atof_nz
           irx                         ; recover sign
           ldx
           phi   r8                    ; put in high of zero
           lbr	atof_end               ; and return
atof_nz:   ldi   0                     ; setup dp
           phi   R12
atof_lp3:  ghi   r8                    ; check for high bit set
           ani   080h
           lbnz  atof_dn4              ; jump if so
           Ccall fp_shl_1                ; shift answer left
           ldi   scratch>>8          ; point to bcd number
           phi   R10
           ldi   255&scratch
           plo   R10
           ldi   0                     ; set high byte to zero
           str   R10
           ldi   (scratch+15)>>8     ; point to last cell
           phi   R10
           ldi   255&(scratch+15)
           plo   R10
           ldi   0                     ; set carry forward
           plo   R14
           ldi   16                    ; setup count
           plo   R12
atof_lp4:  glo   R14                    ; get carry
           str   r2                    ; in memory for add
           ldn   R10                    ; get bcd digit
           add                         ; add in carry
           str   r2                    ; place into memory
           ldn   R10                    ; recover bcd digit
           add                         ; digit now doubled with carry
           str   R10                    ; put it back
           smi   10
           lbnf  atof_no4              ; jump if below 10
           str   R10                    ; store value - 10
           ldi   1                     ; carry set to 1
           lskp                        ; skip next instruction
atof_no4:  ldi   0                     ; reset carry
           plo   R14
           dec   R10                    ; move to previous digit
           dec   R12                    ; decrement digit count
           glo   R12                    ; see if done
           lbnz  atof_lp4              ; jump if not
           ldi   scratch>>8	       ; point to first digit
           phi   R10
           ldi   255&scratch
           plo   R10
           ldn   R10                    ; retrieve it
           lbz   atof_nc4              ; jump if no carry
           glo   F9                    ; add in the carry
           ori   1
           plo   F9
atof_nc4:  ghi   R12                    ; increment dp
           adi   1
           phi   R12
           lbr   atof_lp3              ; loop until full
atof_dn4:  ghi   R12                    ; get dp
           str   r2                    ; into memory
           ldi   31                    ; need to subtract from 31
           sm
           adi   127                   ; add in bias
           phi   R13                    ; set aside
           ghi   F9                    ; shift result down 8 bits
           plo   F9
           glo   r8
           phi   F9
           ghi   r8
           shl                         ; shift out high bit
           plo   r8
           ghi   R13                    ; get bit 0 of exponent
           shr
           phi   r8                    ; bits 1-7 into high byte
           glo   r8                    ; get mantissa
           shrc                        ; shift in bit 0 of exponent
           plo   r8                    ; and write it
           irx                         ; point to sign
           ghi   r8                    ; high byte
           or                          ; set sign
           phi   r8                    ; done with base conversion
           ldn   R15                    ; get next byte
           smi   'e'                   ; check for exponents
           lbz   atof_exp
           ldn   R15
           smi   'E'
           lbnz  atof_end
atof_exp:  inc   R15                    ; move past E
           ldn   R15                    ; check for sign
           smi   '-'
           lbz   atof_n
           ldn   R15
           smi   '+'
           lbz   atof_p
           dec   R15                    ; positive if no sign
atof_p:    ldi   1                     ; indicate positive exponent
           lskp
atof_n:    ldi   0                     ; indicate negative exponent
           phi   R12                    ; place into sign variable
           inc   R15                    ; move past sign
           ldi   0                     ; setup intial count
           plo   R12
atof_lp5:  ldn   R15                    ; get next byte
           Ccall f_isnum                ; see if numeric
           lbnf  atof_dn5              ; jump if not
           glo   R12                    ; make copy of exponent
           str   r2
           shr                         ; multiply by 2
           shr                         ; by 4
           add                         ; by 5
           shr                         ; by 10
           str   r2                    ; put here for add
           lda   R15                    ; recover number
           smi   '0'                   ; convert to binary
           add                         ; add with total
           plo   R12                    ; copy back to R12
           lbr   atof_lp5              ; loop back until done reading exponent
atof_dn5:  glo   R12                    ; see if done
           lbz   atof_end              ; jump if so
           dec   R12                    ; otherwise decrement count
           glo   R12                    ; save count
           stxd
           ghi   R12                    ; save sign
           stxd
           glo   R15
           stxd
           ghi   R15
           stxd
           ldi   041h                  ; setup 10.0
           phi   R10
           ldi   020h
           plo   R10
           ldi   0
           phi   FB
           plo   FB
           ghi   R12
           lbz   atof_div              ; jump if negative
           Ccall fp_mul                 ; multiply by 10
           lbr   atof_go5              ; clean up call
atof_div:  Ccall fp_div                 ; divice by 10
atof_go5:  irx                         ; recover variables
           ldxa
           phi   R15
           ldxa
           plo   R15
           ldxa
           phi   R12
           ldx
           plo   R12
           lbr   atof_dn5              ; loop until exponent is zero
atof_end:
	   inc	r2	;wjr release work area
	   popr R13	;wjr restore param regs
	   popr R12	;wjr
	   popr	F7	;wjr restore c variable
	   Cretn
scratch:   db	00,00