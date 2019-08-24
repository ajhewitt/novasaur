

; **********************************
; R10  - BINARY BIT COUNT
; r12 & r13 - BINARY NUMBER
; R8 - INDEX REGISTER
; R9 - LOW db STORES LOCAL LOOP COUNTER
; R9 - HIGH db SAVES CURRENT BCD DIGIT
; R14 - LOW db STORES ACTIVE BCD DIGIT COUNT
; R14 - HIGH db SAVES CARRY VALUE (DF)
; **********************************
								align 256
BGNDIG:         db    0,0,0,0,0,0,0,0,0
ENDDIG:         db    1

CONVRT:         db    $00,$CE,$ED,$BB         ; DECIMAL 847,291
_dd32cr1:
; -----------------
; *** SET UP INDEX REGISTER LOAD
						ldad    R8,ENDDIG
						sex			R8
						ldad		R11,ENDDIG
; -----------------
; *** BINARY NUMBER TO CONVERT comes in r12 AND r13
; -----------------
; *** SET UPPER BYTE OF R10 TO 1
						LDI     1
						PHI     R10              ;STORE CONSTANT 1 INTO HIGH db OF R10
						PLO     R14             ;ACTIVE BCD DIGIT COUNT -- STARTS AT 1
; -----------------
; *** SET BINARY BIT COUNT IN LOW db OF R10
						LDI     32
						PLO     R10
; -----------------
; SHIFT OUT HIGH ORDER ZERO BITS OF BINARY NUMBER

SHFOUT:     GLO     r13
						SHLC
						PLO     r13
;           -----------------
						GHI     r13
						SHLC
						PHI     r13
;           -----------------
						GLO     r12
						SHLC
						PLO     r12
;           -----------------
						GHI     r12
						SHLC
						PHI     r12
;           -----------------
						DEC     R10              ;DECREMENT BINARY BIT COUNT
						BNF     SHFOUT
;********
;						glo	r10	;save bit count
;						str r8	;in return area
;						ldad R15,0x2345
;						sex			R2
;						cretn
;
;
;
; -----------------
; *** MAIN DOUBLE DABBLE LOOP
NLOOP:
; -----------------
; SHIFT OUT HIGH-ORDER BIT OF BINARY NUMBER
; -----------------
						GLO     r13
						SHLC
						PLO     r13
;           -----------------
						GHI     r13
						SHLC
						PHI     r13
;           -----------------
						GLO     r12
						SHLC
						PLO     r12
;           -----------------
						GHI     r12
						SHLC
						PHI     r12
; -----------------
; SET INDEX REGISTER (LOW db ONLY)
						GLO     R11              ;GET INDEX LOW db
						PLO     R8             ;STORE IN INDEX REG.
; -----------------
; CALCULATE LOOP COUNT
						GLO     R14             ;GET ACTIVE BCD DIGIT COUNT
						PLO     R9             ;STORE LOCAL LOOP COUNT
UNILP:
; -----------------
; *** SAVE DF (CARRY) IN UPPER db OF R14
						SHLC                    ;GET CARRY TO LOW-ORDER BIT OF D
						PHI     R14             ;SAVE D IN UPPER db OF R14
; ----------------
; *** TEST ONE db FOR PRE-CORRECTION
						LDX                     ;LOAD D FROM INDEX ADDRESS
						PHI     R9             ;SAVE BCD DIGIT IN UPPER db OF R9
						SMI     5               ;IS D > 4
						BNF     NOFIX           ;SKIP CORRECTION IF D < 0
; *** PRE-CORRECT BCD DIGIT
						ADI     128             ;ADD 3 CORRECTION + 5 RESTORE + 120
						PHI     R9             ;SAVE BCD DIGIT IN UPPER db OF R9
NOFIX:
; -----------------
; SHIFT ONE BCD DIGIT
; -----------------
						GHI     R14             ;GET CARRY BACK TO D
						SHR                     ;PUT CARRY VALUE INTO DF
						GHI     R9             ;GET WORKING BCD DIGIT
						SHLC                    ;ROTATE D THROUGH CARRY
						STXD                    ;STORE D AND DECREMENT INDEX REGISTER
; -----------------
; *** UNILP COUNTER OVERHEAD
						DEC     R9             ;DECREMENT CORRECT-SIFT LOOP COUNTER
						GLO     R9             ;D = LOCAL LOOP COUNT
						BNZ     UNILP           ;LOOP UNTIL DONE
; -----------------
; *** IF DF = 1, CREATE NEW BCD DIGIT = 1 -- INCREMENT ACTIVE BCD DIGIT COUNT
						BNF     SKPDIG          ;IF CARRY IS ZERO, NO NEW BCD DIGIT
						INC     R14             ;INCREMENT ACTIVE BCD DIGIT COUNT
						GHI     R10              ;GET A db WITH VALUE OF 1
						STXD                    ;STORE D IN NEW BCD DIGIT POSITION
; -----------------
; *** MAIN LOOP COUNTER OVERHEAD
SKPDIG:     DEC     R10              ;DECREMENT MASTER LOOP COUNTER
						GLO     R10              ;D = BINARY BIT COUNT
						BNZ     NLOOP           ;LOOP UNTIL DONE

bail:				ldad		R15,BGNDIG			;point to converted number
						sex			R2
						cretn										;return to caller
