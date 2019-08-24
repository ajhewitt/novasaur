; **********************************
; R15 - saved pointer to end of buffer, return value pointer to ascii result
; R10 - BINARY BIT COUNT
; R8  - POINTER TO BINARY NUMBER BEING CONVERTED
; R9  - UPPER BYTE IS PART OF BINARY NUMBER
; R9  - LOWER BYTE IS BYTE SHIFT COUNT
; R12 - INDEX REGISTER
; R13 - LOW BYTE STORES LOCAL LOOP COUNTER
; R13 - HIGH BYTE SAVES CURRENT BCD DIGIT
; R14 - LOW BYTE STORES ACTIVE BCD DIGIT COUNT
; R14 - HIGH BYTE SAVES CARRY VALUE (DF)
; **********************************
_ultoa:	;unsigned 32 bit conversion to ascii
	ld2 R15,'O',sp,(2+4); pick up the buffer pointer
	ldax R15,R15,11	;point to end of buffer for terminating 0
	ldi 0
	str R15
	dec R15
; *** store binary number on stack and leave address in R8
	pushf R13
	pushl R12
	cpy2 R8,SP
; -----------------
; *** SET BINARY BIT COUNT IN LOW BYTE OF R10
                LDI     32           ;LOWER R10 = TOTAL BIT COUNT
                PLO     R10
; *** Here the buffer is prepped, R15 points to the end of it
;     sp points to the binary number to convert and R10.0 has the bit count
; *** DDCORE: is the entry point for all uses of the routine
DDCORE:		 
; -----------------
; *** HIGH R9 = BYTE OF BINARY NUMBER
DOMORE:         LDA     R8		;pick up next byte of binary number and release tthe work area
; -----------------
; *** IF ZERO BYTE, ADJUST R10 SHIFT COUNT AND TRY AGAIN
                BNZ     NOMORE
                GLO     R10           ;GET SHIFT COUNT
                SMI     8            ;SUBTRACT ONE BYTE OF 8 BITS
                PLO     R10           ;PUT BACK SHIFT COUNT
                bnz     DOMORE       ;GET ANOTHER BINARY BYTE (unless the whole thing was 0)
                str	R15		;make the bottom bcd digit 0
                ldi	1
                plo	R14		;set number of digits to 1
                br	asciize		;go convert to ascii and return to caller
; -----------------
; *** RELOAD BINARY BYTE -- RESET COUNT TO 8
NOMORE:         PHI     R9
                LDI     8
                PLO     R9
; -----------------
; *** CURRENT BYTE HAS A ONE BIT
; -----------------
; *** SHIFT OUT HIGH ORDER ZERO BITS OF BINARY NUMBER
SHFOUT:         GHI     R9
                SHL
                PHI     R9
; -----------------
; *** CHECK FOR BYTE RELOAD
                DEC     R9           ;DECREMENT BYTE BIT COUNT
CONTIN:         DEC     R10           ;DECREMENT TOTAL BIT COUNT
                BNF     SHFOUT
; -----------------
; *** SET UP INDEX REGISTER LOAD
                cpy2 R12,R15
                SEX	R12		;R12 will be the index reg from here on out
; -----------------
; *** SET UPPER BYTE OF R10 TO 1
                LDI     1
                PHI     R10              ;HIGH BYTE OF R10 IS CONSTANT 1
                PLO     R14             ;ACTIVE BCD DIGIT COUNT -- STARTS AT 1
; -----------------
; SET LOW-ORDER BCD DIGIT TO 1
                STXD
;
;
;
; -----------------
; *** MAIN DOUBLE DABBLE LOOP
NLOOP:
; -----------------
; SHIFT BIT OF BINARY NUMBER INTO DF (CARRY)
; -----------------
                GHI     R9
                SHL
                PHI     R9
; -----------------
; *** CHECK FOR BYTE RELOAD
                DEC     R9
                GLO     R9
                BNZ     SKLOAD
; -----------------
; *** LOAD NEXT BINARY BYTE -- RESET COUNT TO 8
                LDA     R8
                PHI     R9
                LDI     8
                PLO     R9
; -----------------
; SET INDEX REGISTER 
SKLOAD:         cpy2 R12,R15            ;restore index register
; -----------------
; GET ACTIVE BCD DIGIT COUNT TO LOOP COUNTER R13
                GLO     R14             ;GET ACTIVE BCD DIGIT COUNT
                PLO     R13             ;STORE LOCAL LOOP COUNT
UNILP:
; -----------------
; *** SAVE DF (CARRY) IN UPPER BYTE OF R14
                SHLC                    ;GET CARRY TO LOW-ORDER BIT OF D
                PHI     R14             ;SAVE D IN UPPER BYTE OF R14
; ----------------
; *** TEST ONE BYTE FOR PRE-CORRECTION                
                LDX                     ;LOAD D FROM INDEX ADDRESS
                PHI     R13             ;SAVE BCD DIGIT IN UPPER BYTE OF R13
                SMI     5               ;IS D > 4
                BNF     NOFIX           ;SKIP CORRECTION IF D < 0
; *** PRE-CORRECT BCD DIGIT
                ADI     128             ;ADD 3 CORRECTION + 5 RESTORE + 120
                PHI     R13             ;SAVE BCD DIGIT IN UPPER BYTE OF R13
NOFIX:
; -----------------
; SHIFT ONE BCD DIGIT
; -----------------
                GHI     R14             ;GET CARRY BACK TO D
                SHR                     ;PUT CARRY VALUE INTO DF
                GHI     R13             ;GET WORKING BCD DIGIT
                SHLC                    ;ROTATE D THROUGH CARRY
                STXD                    ;STORE D AND DECREMENT INDEX REGISTER
; -----------------
; *** UNILP COUNTER OVERHEAD
                DEC     R13             ;DECREMENT CORRECT-SHIFT LOOP COUNTER
                GLO     R13             ;D = LOCAL LOOP COUNT
                BNZ     UNILP           ;LOOP UNTIL DONE
; -----------------
; *** IF DF = 1, CREATE NEW BCD DIGIT = 1 -- INCREMENT ACTIVE BCD DIGIT COUNT
                BNF     SKPDIG          ;IF CARRY IS ZERO, NO NEW BCD DIGIT
                INC     R14             ;INCREMENT ACTIVE BCD DIGIT COUNT
                GHI     R10              ;GET A BYTE WITH VALUE OF 1
                STXD                    ;STORE D IN NEW BCD DIGIT POSITION
; -----------------
; *** MAIN LOOP COUNTER OVERHEAD
SKPDIG:         DEC     R10              ;DECREMENT MASTER LOOP COUNTER
                GLO     R10              ;D = BINARY BIT COUNT
                BNZ     NLOOP           ;LOOP UNTIL DONE
; -----------------
; *** asciize bcd digits
asciize:	ldn R15	;pick up digit
		ori 0x30 ;make it ascii
		str R15
		dec R15  ;back up a digit
           	dec R14	;reduce digit count
           	glo R14	;test
		bnz asciize ;back for more if needed
		inc R15	;reverse last backup
		
		sex SP	;reset X to the stack pointer
		release 4 ;release the 4 byte work area
		cretn
