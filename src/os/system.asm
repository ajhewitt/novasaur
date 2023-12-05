; TITLE: 'SYS LIB'
;
; DEC 5, 2023
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
; CLEAR SCREEN
;
        IN      CONF
        MOV     B,A     ;B=CONDOLE FONT/FG/BG COLOR
        IN      CONL
        ADD     A
        MOV     D,A     ;C=CONSOLE LEFT
        IN      CONR
        ADD     A
        MOV     E,A     ;D=COLSOLE RIGHT
        DCR     E
        MVI     H,0
        JMP     CLS2
CLS1:   INR     H       ;INC LINE
        RZ              ;DONE?
CLS2:   MVI     L,0F0H  ;START @EOL
CLS3:   DCR     L       ;COL-1
        XRA     A
        DW      MOVMA   ;NULL CODE POINT
        CMP     L       ;START OF LINE?
        JZ      CLS1    ;NEXT LINE
        MOV     A,D
        CMP     L       ;LEFT-COL
        JNC     CLS3    ;CARRY IF COL>LEFT
        MOV     A,E
        CMP     L       ;CARRY IF COL>RIGHT
        JC      CLS3
        DCR     L
        DW      MOVMB
        JMP     CLS3
