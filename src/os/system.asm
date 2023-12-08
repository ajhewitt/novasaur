; TITLE: 'SYS LIB'
;
; DEC 8, 2023
;
        .PROJECT        system.com
;
CONL    EQU     28H     ;CONSOLE LEFT
CONR    EQU     29H     ;CONSOLE RIGHT
CONF    EQU     2FH     ;CONSOLE FONT
;
MOVMB   EQU     070DDH  ;MOV vidM,B
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
; CLEAR LINE - H=LINE NUMBER
; SET NULL IN L/R BORDER
; SET LINE FONT/FG/BG COLOR
;
LCLRLN: IN      CONF
        MOV     B,A     ;B=CONSOLE FONT/FG/BG COLOR
        IN      CONL
        ADD     A
        MOV     D,A     ;C=CONSOLE LEFT
        IN      CONR
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
