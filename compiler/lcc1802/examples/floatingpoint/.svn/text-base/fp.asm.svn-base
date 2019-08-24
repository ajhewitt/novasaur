;from http://www.elf-emulation.com/software/fp.asm
; *******************************
; *** Shift R8:R7 right 1 bit ***
; *******************************
fp_shr_1:  ghi   r8                    ; shift high word right
           shr
           phi   r8
           glo   r8
           shrc
           plo   r8
           ghi   r7                    ; shift low word right
           shrc
           phi   r7
           glo   r7
           shrc
           plo   r7
           sep   sret

; ******************************
; *** Shift R8:R7 left 1 bit ***
; ******************************
fp_shl_1:  glo   r7
           shl
           plo   r7
           ghi   r7
           shlc
           phi   r7
           glo   r8
           shlc
           plo   r8
           ghi   r8
           shlc
           phi   r8
           sep   sret

; **********************
; *** R8:R7 += RA:R9 ***
; **********************
fp_add_12: glo   r9
           str   r2
           glo   r7
           add
           plo   r7
           ghi   r9
           str   r2
           ghi   r7
           adc
           phi   r7
           glo   ra
           str   r2
           glo   r8
           adc
           plo   r8
           ghi   ra
           str   r2
           ghi   r8
           adc
           phi   r8
           sep   sret

; *******************************
; *** Shift RF:RD right 1 bit ***
; *******************************
fp_shr_fd: ghi   rf                    ; shift high word right
           shr
           phi   rf
           glo   rf
           shrc
           plo   rf
           ghi   rd                    ; shift low word right
           shrc
           phi   rd
           glo   rd
           shrc
           plo   rd
           sep   sret

; *************************************
; *** Scale number to high bit is 1 ***
; *** R8:R7 - Number to scale       ***
; *** RF.1  - Exponent for number   ***
; *** RB.0  - Sign bit (bit 0)      ***
; *** Returns: R8:R7 - final sp num ***
; *************************************
fp_sc_up:  glo   r8                    ; need high bit to be a 1
           ani   080h                  ; check it
           lbnz  fp_sc_cln             ; jump if good
           sep   scall                 ; shift answer left
           dw    fp_shl_1
           ghi   rf                    ; get exp1
           smi   1                     ; minus 1
           phi   rf                    ; and put it back
           lbr   fp_sc_up              ; loop back intil msbit is 1
fp_sc_cln: glo   r8                    ; get high byte
           shl                         ; shift out high 1 bit
           plo   r8                    ; set aside
           ghi   rf                    ; get exponent byte
           phi   r8                    ; write other 7 bits to r8.1
           shr                         ; shift bit 0 into DF
           glo   r8                    ; get high byte of mantissa
           shrc                        ; shift bit 0 of expnent in
           plo   r8                    ; and put it back
           glo   rb                    ; get signs
           shr                         ; get sign 1
           ghi   r8                    ; recover exponent
           shrc                        ; shift in sign
           phi   r8                    ; put it back
           sep   sret                  ; return to caller

; ************************************
; *** Get exponenst from arguments ***
; *** R8:R7 - Arg 1                ***
; *** RA:R9 - Arg 2                ***
; *** Returns: RF.1 - exp1         ***
; ***          RF.0 - exp2         ***
; ************************************
fp_getexp: glo   r8                    ; get exponent of arg1 (bit 0)
           shl                         ; shift it into DF
           ghi   r8                    ; get top 7 bits
           shlc                        ; shift in first bit
           phi   rf                    ; put exp1 into RF.1
           str   r2                    ; place into memory as well
           glo   ra                    ; get exponent of arg2 (bit 0)
           shl                         ; shift it into DF
           ghi   ra                    ; get top 7 bits
           shlc                        ; shift in first bit
           plo   rf                    ; put into RF
           sep   sret                  ; return to caller

; ************************************
; *** Get signs from arguments     ***
; *** R8:R7 - Arg 1                ***
; *** RA:R9 - Arg 2                ***
; *** Returns: RB.0 - signs        ***
; ************************************
fp_getsgn: ghi   r8                    ; get sign of arg1
           shl                         ; shift into DF
           ghi   ra                    ; get sign of arg2
           shlc                        ; shift into DF, sign of arg1 to bit 0
           shlc                        ; now shift in sign of arg2
           plo   rb                    ; save them
           sep   sret                  ; return to caller

; ***************************************
; *** Add 2 SP floating point numbers ***
; *** R8:R7 - Arg 1                   ***
; *** RA:R9 - Arg 2                   ***
; *** Returns: R8:R7 - Answer         ***
; *** Usage: RF.0 - exponent of arg1  ***
; ***        RF.1 - exponent of arg2  ***
; ***        RB.0 - signs             ***
; ***************************************
fp_add:    ghi   r8                    ; check arg1 for zero
           lbnz  add_a1nz
           glo   r8
           lbnz  add_a1nz
           ghi   r7
           lbnz  add_a1nz
           glo   r7
           lbnz  add_a1nz
           ghi   ra                    ; transfer arg2 to answer
           phi   r8
           glo   ra
           plo   r8
           ghi   r9
           phi   r7
           glo   r9
           plo   r7
           sep   sret                  ; return to caller
add_a1nz:  ghi   ra                    ; check arg1 for zero
           lbnz  add_a2nz
           glo   ra
           lbnz  add_a2nz
           ghi   r9
           lbnz  add_a2nz
           glo   r9
           lbnz  add_a2nz
           sep   sret                  ; return arg1 as answer
add_a2nz:  sep   scall                 ; get exponents
           dw    fp_getexp
           ghi   rf
           str   r2
           glo   rf
           sm                          ; perfrom exp2 - exp1
           lbnf  add_ns                ; jump if no swap needed

           ghi   r8                    ; swap arg1 with arg2
           plo   re
           ghi   ra
           phi   r8
           glo   re
           phi   ra
           glo   r8
           plo   re
           glo   ra
           plo   r8
           glo   re
           plo   ra
           ghi   r7                    ; swap arg1 with arg2
           plo   re
           ghi   r9
           phi   r7
           glo   re
           phi   r9
           glo   r7
           plo   re
           glo   r9
           plo   r7
           glo   re
           plo   r9
           ghi   rf                    ; swap exponents
           plo   re
           glo   rf
           phi   rf
           glo   re
           plo   rf
add_ns:    sep   scall                 ; get signs of arguments
           dw    fp_getsgn
           ldi   0                     ; setup mantissas
           phi   r8
           phi   ra
           ldi   128                   ; need to set high bit in mantissa
           str   r2
           glo   r8
           or
           plo   r8
           glo   ra
           or
           plo   ra
           ghi   rf                    ; get exp1
           str   r2                    ; place into memory
add_lp1:   glo   rf                    ; get exp2
           sm                          ; see if match to exp1
           lbz   add_lp1dn             ; jump if match
           glo   rf                    ; need to increase it
           adi   1
           plo   rf
           glo   ra                    ; now shift arg2 over 1 bit
           shr
           plo   ra
           ghi   r9
           shrc
           phi   r9
           glo   r9
           shrc
           plo   r9
           lbr   add_lp1               ; keep shifting until exponents match
add_lp1dn: glo   rb                    ; see if signs match
           str   r2
           shr
           xor
           ani   1                     ; keep only bottom bit
           lbnz  add_nm                ; jump if signs do not match
           sep   scall                 ; perform arg1 += arg2
           dw    fp_add_12
           lbr   add_fnl               ; jump to clean up
add_nm:    glo   r9                    ; perform arg1 - arg2
           str   r2
           glo   r7
           sm
           plo   rc                    ; place into RD:RC
           ghi   r9
           str   r2
           ghi   r7
           smb
           phi   rc
           glo   ra
           str   r2
           glo   r8
           smb
           plo   rd
           ghi   ra
           str   r2
           ghi   r8
           smb
           phi   rd
           lbnf  add_no                ; jump if arg2 was larger than arg1
           ghi   rd                    ; transfer result to arg1
           phi   r8
           glo   rd
           plo   r8
           ghi   rc
           phi   r7
           glo   rc
           plo   r7
           lbr   add_fnl               ; finalize
add_no:    glo   r7                    ; perform arg1 = arg2 - arg1
           str   r2
           glo   r9
           sm
           plo   r7
           ghi   r7
           str   r2
           ghi   r9
           smb
           phi   r7
           glo   r8
           str   r2
           glo   ra
           smb
           plo   r8
           ghi   r8
           str   r2
           ghi   ra
           smb
           phi   r8
           glo   rb                    ; move sign 2 to sign1
           shl
           plo   rb
add_fnl:   ghi   r8                    ; check for zero result
           lbnz  add_nz                ; jump if not
           glo   r8
           lbnz  add_nz
           ghi   r7
           lbnz  add_nz
           glo   r7
           lbnz  add_nz
           sep   sret                  ; return the zero
add_nz:    ghi   r8                    ; see if answer is beyond 24 bits
           lbz   add_nx                ; jump if not
           sep   scall                 ; shift answer to the right
           dw    fp_shr_1
           ghi   rf                    ; get exp1
           adi   1                     ; increment it
           phi   rf                    ; and put it back
           lbr   add_nz                ; keep going until not > 24 bits

add_nx:    glo   rb                    ; move sign 1 to low bit
           shr
           plo   rb
           lbr   fp_sc_up              ; scale number and build answer

; ***************************************
; *** sub 2 SP floating point numbers ***
; *** R8:R7 - Arg 1                   ***
; *** RA:R9 - Arg 2                   ***
; *** Returns: R8:R7 - Answer         ***
; ***************************************
fp_sub:    ghi   ra                    ; change sign of arg2
           xri   080h
           phi   ra                    ; and put it back
           lbr   fp_add                ; now just add

; ***************************************
; *** Div 2 SP floating point numbers ***
; *** R8:R7 - Arg 1                   ***
; *** RA:R9 - Arg 2                   ***
; *** Returns: R8:R7 - Answer         ***
; *** Usage: RF.0 - exponent of arg1  ***
; ***        RF.1 - exponent of arg2  ***
; ***        RB.0 - signs             ***
; ***************************************
fp_div:    ghi   r8                    ; check arg1 for zero
           lbnz  div_a1nz
           glo   r8
           lbnz  div_a1nz
           ghi   r7
           lbnz  div_a1nz
           glo   r7
           lbnz  div_a1nz
           sep   sret                  ; just return the zero
div_a1nz:  ghi   ra                    ; check arg2 for zero
           lbnz  div_a2nz
           glo   ra
           lbnz  div_a2nz
           ghi   r9
           lbnz  div_a2nz
           glo   r9
           lbnz  div_a2nz
           ghi   r8                    ; need sign of arg1
           ani   080h                  ; want only sign
           ori   07fh                  ; exponent will be all ones
           phi   r8                    ; put into answer
           ldi   080h                  ; build rest of answer
           plo   r8 
           ldi   0
           phi   r7
           plo   r7
           sep   sret                  ; and return to caller

div_a2nz:  sep   scall                 ; get exponents
           dw    fp_getexp
           sep   scall                 ; get signs
           dw    fp_getsgn
           glo   rf                    ; get exp2
           smi   127                   ; remove bias
           str   r2                    ; place into memory
           ghi   rf                    ; get exp1
           smi   127                   ; remove bias
           sm                          ; perform exp1 - exp2
           adi   127                   ; put bias back in
           stxd                        ; save onto stack
           glo   rb                    ; determine sign for answer
           str   r2
           shr
           xor
           stxd                        ; place onto stack
           ldi   0                     ; setup man
           phi   ra
           glo   ra
           ori   080h
           plo   ra
           ldi   0                     ; setup div
           phi   r8
           glo   r8
           ori   080h
           plo   r8
           ldi   0                     ; setup result
           phi   rc
           plo   rc
           phi   rb
           plo   rb
           plo   rf                    ; setup quotient
           phi   rf
           phi   rd
           plo   rd
           ldi   080h
           plo   rf
div_lp:    ghi   r8                    ; check div for nonzero
           lbnz  div_go1
           glo   r8
           lbnz  div_go1
           ghi   r7
           lbnz  div_go1
           glo   r7
           lbnz  div_go1
           lbr   div_z
div_go1:   ghi   ra
           lbnz  div_go
           glo   ra
           lbnz  div_go
           ghi   r9
           lbnz  div_go
           glo   r9
           lbnz  div_go
           lbr   div_z                 ; nothing more to do
div_go:    glo   r9                    ; see if div > man
           str   r2
           glo   r7
           sm
           ghi   r9
           str   r2
           ghi   r7
           smb
           glo   ra
           str   r2
           glo   r8
           smb
           ghi   ra
           str   r2
           ghi   r8
           smb
           lbnf  div_nope              ; jump if div was smaller
           glo   r9                    ; div -= man
           str   r2
           glo   r7
           sm
           plo   r7
           ghi   r9
           str   r2
           ghi   r7
           smb
           phi   r7
           glo   ra
           str   r2
           glo   r8
           smb
           plo   r8
           ghi   ra
           str   r2
           ghi   r8
           smb
           phi   r8
           ghi   rf                    ; merge quotient into result
           str   r2
           ghi   rc
           or
           phi   rc
           glo   rf
           str   r2
           glo   rc
           or
           plo   rc
           ghi   rd
           str   r2
           ghi   rb
           or
           phi   rb
           glo   rd
           str   r2
           glo   rb
           or
           plo   rb
div_nope:  sep   scall                 ; shift quotient right
           dw    fp_shr_fd
           ghi   ra                    ; shift divisor right
           shr
           phi   ra
           glo   ra
           shrc
           plo   ra
           ghi   r9
           shrc
           phi   r9
           glo   r9
           shrc
           plo   r9
           lbr   div_lp                ; loop back until done
div_z:     ghi   rc                    ; move result to arg1
           phi   r8
           glo   rc
           plo   r8
           ghi   rb
           phi   r7
           glo   rb
           plo   r7
           irx                         ; recover sign
           ldxa
           plo   rb
           ldx                         ; recover answer exponent
           phi   rf
           lbr   fp_sc_up              ; scale number and build answer

; ***************************************
; *** Mul 2 SP floating point numbers ***
; *** R8:R7 - Arg 1                   ***
; *** RA:R9 - Arg 2                   ***
; *** Returns: R8:R7 - Answer         ***
; *** Usage: RF.0 - exponent of arg1  ***
; ***        RF.1 - exponent of arg2  ***
; ***        RB.0 - signs             ***
; ***************************************
fp_mul:    sep   scall                 ; get exponents
           dw    fp_getexp
           sep   scall                 ; get signs
           dw    fp_getsgn
           glo   rf                    ; get exp2
           smi   127                   ; remove bias
           str   r2                    ; place into memory
           ghi   rf                    ; get exp1
           smi   127                   ; remove bias
           add                         ; add in exponent 2
           adi   127                   ; put bias back in
           stxd                        ; place onto stack
           glo   rb                    ; determine sign for answer
           str   r2
           shr
           xor
           stxd                        ; place onto stack
           ghi   re                    ; get baud constant
           stxd                        ; save on stack
           ghi   r6                    ; save return position on stack
           stxd
           glo   r6
           stxd
           ldi   0                     ; initial value of ct
           stxd
           phi   re                    ; set mulH to 0
           plo   re
           phi   r6
           plo   r6
           phi   r8                    ; mulL = arg1 & 0xffffff
           glo   r8                    ; be sure high bit is set
           ori   080h
           plo   r8
           ldi   0
           phi   rc                    ; set result to 0
           plo   rc
           phi   rb
           plo   rb
           phi   rf
           plo   rf
           phi   rd
           plo   rd
           phi   ra                    ; arg2 &= 0ffffff
           glo   ra                    ; be sure high bit is set
           ori   080h
           plo   ra
mul_lp1:   glo   r9                    ; check for zero multiplier
           lbnz  mul_go1               ; jump if not zero
           ghi   r9
           lbnz  mul_go1
           glo   ra
           lbnz  mul_go1
           ghi   ra
           lbz   mul_dn                ; jump if muliplier is zero
mul_go1:   ghi   ra                    ; shift multiplier right
           shr
           phi   ra
           glo   ra
           shrc
           plo   ra
           ghi   r9
           shrc
           phi   r9
           glo   r9
           shrc
           plo   r9
           lbnf  mul_no                ; jump if low bit was zero
           glo   r7                    ; res += mul
           str   r2
           glo   rb
           add
           plo   rb
           ghi   r7
           str   r2
           ghi   rb
           adc
           phi   rb
           glo   r8
           str   r2
           glo   rc
           adc
           plo   rc
           ghi   r8
           str   r2
           ghi   rc
           adc
           phi   rc
           glo   r6                    ; now high 32 bits
           str   r2
           glo   rd
           add
           plo   rd
           ghi   r6
           str   r2
           ghi   r6
           str   r2
           ghi   rd
           adc
           phi   rd
           glo   re
           str   r2
           glo   rf
           adc
           plo   rf
           ghi   re
           str   r2
           ghi   rf
           adc
           phi   rf
           ghi   rc                    ; see if need carry from low to high
           lbz   mul_no                ; jump if no carry is needed
           glo   rd                    ; move the carry on over
           adi   1
           plo   rd
           ghi   rd
           adci  0
           phi   rd
           glo   rf
           adci  0
           plo   rf
           ghi   rf
           adci  0
           phi   rf
mul_no:    irx                         ; recover ct
           ldx
           adi   1                     ; increment by 1
           stxd                        ; and put it back
           glo   r7                    ; shift mulL left
           shl
           plo   r7
           ghi   r7
           shlc
           phi   r7
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
           glo   re
           shlc
           plo   re
           ghi   re
           shlc
           phi   re
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
           plo   re                    ; set aside
           ldxa
           plo   r6
           ldxa
           phi   r6
           ldx
           phi   re
           ghi   rc                    ; transfer resL to arg1
           phi   r8
           glo   rc
           plo   r8
           ghi   rb
           phi   r7
           glo   rb
           plo   r7
           glo   re
           plo   rc                    ; put ct into RC.0
mul_lp2:   glo   rc                    ; get ct
           smi   2                     ; see if <2
           lbnf  mul_nxt1              ; jump if so
           sep   scall                 ; shift answer to the right
           dw    fp_shr_1
           sep   scall                 ; shift resH right
           dw    fp_shr_fd
           lbnf  mul_lp2a              ; jump if no carry into low word
           glo   r8                    ; set high bit
           ori   080h
           plo   r8
mul_lp2a:  dec   rc                    ; decrement count
           lbr   mul_lp2               ; loop back to keep checking
mul_nxt1:  irx                         ; recover sign
           ldxa
           plo   rb
           ldx                         ; recover answer exponent
           plo   rc
mul_lp3:   ghi   rf                    ; check resH for nonzero
           lbnz  mul_lp3a
           glo   rf
           lbnz  mul_lp3a
           ghi   rd
           lbnz  mul_lp3a
           glo   rd
           lbnz  mul_lp3a
           lbr   mul_lp4               ; jump if no bits set in resH
mul_lp3a:  inc   rc                    ; increment exponent
           sep   scall                 ; shift answer to the right
           dw    fp_shr_1
           sep   scall                 ; shift resH right
           dw    fp_shr_fd
           lbnf  mul_lp3               ; jump if no carry into low word
           glo   r8                    ; set high bit
           ori   080h
           plo   r8
           lbr   mul_lp3
mul_lp4:   glo   rc                    ; transfer exponent
           phi   rf                    ; to high rf
           lbr   fp_sc_up              ; scale number and build answer

; ***************************************
; *** Convert ascii to floating point ***
; *** RF - buffer to ascii text       ***
; *** Returns: R8:R7 - number         ***
; ***************************************
fp_atof:   lda   rf                    ; get byte from buffer
           smi   ' '                   ; check for space
           lbz   fp_atof               ; move past any spaces
           dec   rf                    ; point back to nonspace chara
           ldn   rf                    ; check for possible sign
           smi   '-'                   ; first check for minus
           lbnz   atof_nm              ; jump if not minus
           ldi   080h                  ; high bit set for minus
           stxd                        ; place onto stack
           inc   rf                    ; move past sign
           lbr   atof_go1              ; and continue
atof_nm:   ldi   0                     ; indicate positive number
           stxd                        ; place onto stack
           ldn   rf                    ; now check for + sign
           smi   '+'
           lbnz  atof_go1              ; jump if not plus
           inc   rf                    ; move past plus sign
atof_go1:  ldi   0                     ; setup result
           phi   r8
           plo   r8
           phi   r7
           plo   r7
atof_lp1:  ldn   rf                    ; get next byte from buffer
           sep   scall                 ; is it numeric
           dw    f_isnum
           lbnf  atof_no1              ; jump if not
           ghi   r8                    ; copy arg1 to arg2
           phi   ra
           glo   r8
           plo   ra
           ghi   r7
           phi   r9
           glo   r7
           plo   r9
           sep   scall                 ; multiply arg1 by 2
           dw    fp_shl_1
           sep   scall                 ; multiply arg1 by 4
           dw    fp_shl_1
           sep   scall                 ; multiply arg1 by 5
           dw    fp_add_12 
           sep   scall                 ; multiply arg1 by 10
           dw    fp_shl_1
           lda   rf                    ; get number
           smi   '0'                   ; convert to binary
           str   r2                    ; setup for add
           glo   r7                    ; add in next digit
           add
           plo   r7
           ghi   r7                    ; propagate carry
           adci  0
           phi   r7
           glo   r8
           adci  0
           plo   r8
           ghi   r8
           adci  0
           phi   r8
           lbr   atof_lp1              ; loop until no more digits
atof_no1:  ldn   rf                    ; check for decimal point
           smi   '.'
           lbnz  atof_ndp              ; jump if none
           inc   rf                    ; move past decimal
atof_ndp:  ldi   high scratch          ; point to scratch area
           phi   ra
           ldi   low scratch
           plo   ra
           ldi   16                    ; 16 bytes to clear
           plo   rc
atof_lpx:  ldi   0
           str   ra
           inc   ra
           dec   rc
           glo   rc
           lbnz  atof_lpx
           ldi   high (scratch+1)      ; point to scratch area
           phi   ra
           ldi   low (scratch+1)
           plo   ra
           ldi   1                     ; setup count
           plo   rc
           ldi   0                     ; setup exp flag
           phi   rc
atof_lp2:  glo   rc                    ; see if done making bcd
           smi   17
           lbz   atof_dn3              ; jump if so
           ldn   rf                    ; get character
           sep   scall                 ; is it numeric
           dw    f_isnum
           lbnf  atof_dn3              ; jump if not
           lda   rf                    ; get character
           smi   '0'                   ; converto to binary
           str   ra                    ; write into bcd area
           inc   ra
           inc   rc                    ; increment count
           lbnz  atof_lp2              ; loop back until done
           ldi   1                     ; set non zero flag
           phi   rc
           lbr   atof_lp2
atof_dn3:  ghi   rc                    ; check for non-zero digits
           lbnz  atof_nz
           ghi   r8                    ; check for non-zero integer
           lbnz  atof_nz
           glo   r8
           lbnz  atof_nz
           ghi   r7
           lbnz  atof_nz
           glo   r7
           lbnz  atof_nz
           irx                         ; recover sign
           ldx
           phi   r8                    ; put in high of zero
           sep   sret                  ; and return
atof_nz:   ldi   0                     ; setup dp
           phi   rc
atof_lp3:  ghi   r8                    ; check for high bit set
           ani   080h
           lbnz  atof_dn4              ; jump if so
           sep   scall                 ; shift answer left
           dw    fp_shl_1
           ldi   high scratch          ; point to bcd number
           phi   ra
           ldi   low scratch
           plo   ra
           ldi   0                     ; set high byte to zero
           str   ra
           ldi   high (scratch+15)     ; point to last cell
           phi   ra
           ldi   low (scratch+15)
           plo   ra
           ldi   0                     ; set carry forward
           plo   re
           ldi   16                    ; setup count
           plo   rc
atof_lp4:  glo   re                    ; get carry
           str   r2                    ; in memory for add
           ldn   ra                    ; get bcd digit
           add                         ; add in carry
           str   r2                    ; place into memory
           ldn   ra                    ; recover bcd digit
           add                         ; digit now doubled with carry
           str   ra                    ; put it back
           smi   10
           lbnf  atof_no4              ; jump if below 10
           str   ra                    ; store value - 10
           ldi   1                     ; carry set to 1
           lskp                        ; skip next instruction
atof_no4:  ldi   0                     ; reset carry
           plo   re
           dec   ra                    ; move to previous digit
           dec   rc                    ; decrement digit count
           glo   rc                    ; see if done
           lbnz  atof_lp4              ; jump if not
           ldi   high scratch          ; point to first digit
           phi   ra
           ldi   low scratch
           plo   ra
           ldn   ra                    ; retrieve it
           lbz   atof_nc4              ; jump if no carry
           glo   r7                    ; add in the carry
           ori   1
           plo   r7
atof_nc4:  ghi   rc                    ; increment dp
           adi   1
           phi   rc
           lbr   atof_lp3              ; loop until full
atof_dn4:  ghi   rc                    ; get dp
           str   r2                    ; into memory
           ldi   31                    ; need to subtract from 31
           sm
           adi   127                   ; add in bias
           phi   rd                    ; set aside
           ghi   r7                    ; shift result down 8 bits
           plo   r7
           glo   r8
           phi   r7
           ghi   r8
           shl                         ; shift out high bit
           plo   r8
           ghi   rd                    ; get bit 0 of exponent
           shr
           phi   r8                    ; bits 1-7 into high byte
           glo   r8                    ; get mantissa
           shrc                        ; shift in bit 0 of exponent
           plo   r8                    ; and write it
           irx                         ; point to sign
           ghi   r8                    ; high byte
           or                          ; set sign
           phi   r8                    ; done with base conversion
           ldn   rf                    ; get next byte
           smi   'e'                   ; check for exponents
           lbz   atof_exp
           ldn   rf
           smi   'E'
           lbnz  atof_end
atof_exp:  inc   rf                    ; move past E
           ldn   rf                    ; check for sign
           smi   '-'
           lbz   atof_n
           ldn   rf
           smi   '+'
           lbz   atof_p
           dec   rf                    ; positive if no sign
atof_p:    ldi   1                     ; indicate positive exponent
           lskp
atof_n:    ldi   0                     ; indicate negative exponent
           phi   rc                    ; place into sign variable
           inc   rf                    ; move past sign
           ldi   0                     ; setup intial count
           plo   rc
atof_lp5:  ldn   rf                    ; get next byte
           sep   scall                 ; see if numeric
           dw    f_isnum
           lbnf  atof_dn5              ; jump if not
           glo   rc                    ; make copy of exponent
           str   r2
           shr                         ; multiply by 2
           shr                         ; by 4
           add                         ; by 5
           shr                         ; by 10
           str   r2                    ; put here for add
           lda   rf                    ; recover number
           smi   '0'                   ; convert to binary
           add                         ; add with total
           plo   rc                    ; copy back to rc
           lbr   atof_lp5              ; loop back until done reading exponent
atof_dn5:  glo   rc                    ; see if done
           lbz   atof_end              ; jump if so
           dec   rc                    ; otherwise decrement count
           glo   rc                    ; save count
           stxd
           ghi   rc                    ; save sign
           stxd
           glo   rf
           stxd
           ghi   rf
           stxd
           ldi   041h                  ; setup 10.0
           phi   ra
           ldi   020h
           plo   ra
           ldi   0
           phi   r9
           plo   r9
           ghi   rc
           lbz   atof_div              ; jump if negative
           sep   scall                 ; multiply by 10
           dw    fp_mul
           lbr   atof_go5              ; clean up call
atof_div:  sep   scall                 ; divice by 10
           dw    fp_div
atof_go5:  irx                         ; recover variables
           ldxa
           phi   rf
           ldxa
           plo   rf
           ldxa
           phi   rc
           ldx
           plo   rc
           lbr   atof_dn5              ; loop until exponent is zero
atof_end:  sep   sret
