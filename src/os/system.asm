; TITLE: 'SYS LIB'
;
; JAN 16, 2024
;
        .PROJECT        system.com
;
VIDL    EQU     28H     ;CONSOLE LEFT
VIDR    EQU     29H     ;CONSOLE RIGHT
CONF    EQU     2FH     ;CONSOLE FONT
;
GLYPH   EQU     030DDH  ;GLYPH DATA
MOVMB   EQU     070DDH  ;MOV vidM,B
MOVMC   EQU     071DDH  ;MOV vidM,B
MOVMA   EQU     077DDH  ;MOV vidM,A
YIELD   EQU     06EDH   ;MASTER: YIELD UNTIL CTX SW
SIGNAL  EQU     07DDH   ;MASTER: SIGNAL SLAVE
IPCSND  EQU     08DDH   ;MASTER: SET SLAVE REGS
IPCRCV  EQU     09DDH   ;MASTER: GET SLAVE REGS
RECSEND EQU     0AEDH   ;RECORD -> SHM
RECXFER EQU     0BEDH   ;MASTER: MOVE RECORD
SERSEND EQU     0DDDH   ;SERIAL SEND FROM BUFFER
SERRECV EQU     0EDDH   ;SERIAL RECV TO BUFFER
DMA     EQU     0FDDH   ;DMA
;
        .ORG    0FC00H
;
;	JUMP VECTOR FOR LIB FUNCTIONS
;
	JMP	LCLRLN	;CLEAR LINE
        JMP	LBDIVH	;B DIVIDE BY H
        JMP     GRTEXT  ;DISPLAY TEXT

TEMP:   DB      0, 0, 0, 0, 0, 0, 0, 0
;
; CLEAR LINE - H=LINE NUMBER
; SET NULL IN L/R BORDER
; SET LINE FONT/FG/BG COLOR
;
LCLRLN: IN      CONF
        MOV     B,A     ;B=CONSOLE FONT/FG/BG COLOR
        IN      VIDL
        ADD     A
        MOV     D,A     ;C=CONSOLE LEFT
        IN      VIDR
        ADD     A
        MOV     E,A     ;D=COLSOLE RIGHT
        DCR     E
        MVI     L,0F0H  ;START @EOL
CLRLN1: DCR     L       ;COL-1
        XRA     A
        DW      MOVMA   ;NULL CODE POINT
        CMP     L       ;START OF LINE?
        RZ              ;LINE DONE
        MOV     A,D
        CMP     L       ;LEFT-COL
        JNC     CLRLN1  ;CARRY IF COL>LEFT
        MOV     A,E
        CMP     L       ;CARRY IF COL>RIGHT
        JC      CLRLN1
        DCR     L
        DW      MOVMB
        JMP     CLRLN1
;
; DIVIDE A=BC/HL
; http://techref.massmind.org/techref/method/math/muldiv.htm
;
LBDIVH: mov     a,h
        ora     l
        rz              ;division by zero; abort operation
        mov	a,b	;put 2's complement of BC +1 into DE for
	cma		;purposes of subtraction. (BC will be
	mov	d,a	;incremented to enable subtraction when minuend
	mov	a,c	;and subtrahend are having equal values).
	cma
	mov	e,a	;dividend in negative form now in DE
	inx	b	;BC +1; dividend incremented
        xra	a	;reset counter A and
	jmp	double	;start the division in earnest
;
;*********************** First phase: Doubling the divisor
;
restore:dad	b	;add back
double: inr	a	;increment counter
        push	h	;save divisor
        dad	h	;double it, but go to second phase if
        jc	change	;HL now is larger than dividend in B
	dad	d	;comparison with dividend by subtraction
	jnc	restore	;keep doubling unless HL now is larger than BC
;
;*********************** Second phase: Subtracting from the dividend
;                                      and accumulating quotient bits.
change: mov	b,a	;transfer count to new counter
        xra     a       ;clear the quotient buffer
subtrct:pop	h	;Fetch halved divisor as positive subtrahend
	dad	d	;subtract by using negative dividend as minuend
	jc	shiftc	;the carry bit becomes the quotient bit
	xchg		;equivalent of adding back if subtraction fails
shiftc:	cmc		;invert quotient bit from reverse polarity
	ral             ;shift quotient bits
	dcr	b	;count-down finished?
	jnz	subtrct	;no, continue process
	ret
;
; GRTEXT
;  A = size (8 or 16)
; BC = background/foreground color
; DE = screen x, y
; HL = text buff start, null term
;
GRTEXT: ANI     18H
        RZ              ;A!=8 or 16
        STA     TEMP+2  ;SAVE SIZE
        MOV     A, C    ;FOREGROUND
        STA     TEMP
        MOV     A, B    ;BACKGROUND
        STA     TEMP+1
        MOV     A, D    ;TOP ROW
        STA     TEMP+3
G0:     MOV     C, M    ;C=CHAR FROM BUFF
        XRA     A
        CMP     C       ;NULL?
        RZ              ;DONE
        LDA     TEMP+2  ;A=SIZE
        ANI     10H
        MOV     B, A    ;ROW=0 or 16
G1:     PUSH    B       ;SAVE B
        DW      GLYPH   ;A=GLYPH DATA
        MVI     B, 8    ;B=COL COUNT
G2:     RAL             ;SHIFT BIT
        MOV     C, A    ;SAVE A
        PUSH    B       ;SAVE BC
        LXI     B, TEMP
        JC      G3      ;FORGROUND
        INX     B       ;BACKGROUND
G3:     LDAX    B       ;A=COLOR
        XCHG            ;HL=DISPLAY X,Y
        DW      MOVMA   ;WRITE PIXEL
        XCHG
        POP     B       ;RECOVER BC
        MOV     A, C    ;RECOVER A
        INR     E       ;INC COL
        DCR     B       ;COUNT DOWN COL
        JNZ     G2      ;NEXT COL
        POP     B
        INR     B       ;INC COL
        LDA     TEMP+2  ;A=SIZE
        DCR     A       ;A=7 OR F
        ANA     B       ;LAST ROW?
        JZ      G4      ;NEXT CHAR
        MOV     A, E
        SBI     8
        MOV     E, A    ;RESET COL
        INR     D       ;NEXT ROW
        JMP     G1
G4:     INX     H
        LDA     TEMP+3  ;RESET ROW
        MOV     D, A
        JMP     G0

        END
