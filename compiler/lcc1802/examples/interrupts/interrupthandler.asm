	relaxed on
REST:
	GHI 0     ;.. INITIALIZE Rl, R2, R3
	PHI 1
	PHI 2
	PHI 3
	LDI INTS  ;.. R1 = INTERRUPT PC
	PLO 1
	LDI 0xFF   ;.. R2 = STACK (TEMP DATA)
	PLO 2
	LDI MAIN  ;.. R3 = MAIN PC
	PLO 3
	RET       ;.. X=0, R0=000E
	db 0x23	  ;.. SET X=2, P=3
MAIN: INP 1   ;.. TURN ON TV
LOOP: GHI 0   ;.. DISPLAY R0
	DEC 2
	STR 2     ;.. FROM MEM AT R2
	OUT 4     ;.. X=2!
	BR  LOOP  ;.. DO NOTHING

;
; Interrupt service routine for 1861
;
INTX:   SEX  2
        LDA  2         ; recover carry
        SHL
        LDA  2         ; recover A
        RET             ; < exit
INTS:   NOP             ; > entry
        DEC  2
        SAV             ; save T
        DEC  2
        STXD            ; save A
        LDI  BUFF/256
        PHI  0         ; set up R0 for DMA
        LDI  BUFF
        PLO  0
        br   intx
BUFF:	db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1        