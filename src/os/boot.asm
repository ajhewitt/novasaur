;
; May 29, 2021
;
        .PROJECT        boot.com
ORIGIN  EQU     0
CPROM   EQU     01EDH
BOOTCPU EQU     02FDH
MOVXB   EQU     70DDH
YIELD   EQU     08DDH

        .ORG    ORIGIN
        ANI     7
        ADI     TABLE   -ORIGIN
        MOV     L,A
        MVI     A,41H
        MVI     H,ORIGIN>>8
        MOV     L,M     ;HL = VECTOR
        PCHL            ;JUMP VECTOR

KERNEL: LXI     DE,0FA08H ;DEST/ROM PAGE
        MVI     C,5     ;6 PAGES
        DW      CPROM   ;COPY ROM
        MVI     A,2
BOOT1:  DW      BOOTCPU
        INR     A
        CPI     8
        JNZ     BOOT1
        JMP     00050H  ;BOOT MUSIC
        
CTX2:   INR     A
CTX3:   INR     A
CTX4:   INR     A
CTX5:   INR     A
CTX6:   INR     A
CTX7:   INR     A
        MOV     L,A
COL1:   DW      MOVXB
        INR     H
        JNZ     COL1
        DW      YIELD
        INR     B
        JMP     COL1


TABLE:  DB      KERNEL  -ORIGIN
        DB      KERNEL  -ORIGIN
        DB      CTX2    -ORIGIN
        DB      CTX3    -ORIGIN
        DB      CTX4    -ORIGIN
        DB      CTX5    -ORIGIN
        DB      CTX6    -ORIGIN
        DB      CTX7    -ORIGIN
;
; TEST - QUAD CORE CONTEXT MAP of @ 0040
;
MVCTX   EQU     04DDH
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        MVI     H,0
CTX1:   MOV     A,H
        ANI     6
        ORI     0F1H
        DW      MVCTX
        INR     H
        JNZ     CTX1
        RET
;
; TEST - KEYPAD/MUSIC DEMO @ 0050
;
GATE    EQU     0100H
VOICE   EQU     GATE+1
        NOP
        NOP
        MVI     A,2
        STA     VOICE   ;CLEAR VOICE
        OUT     00AH    ;AUDIO MODE 2
        MVI     A,00AH
        OUT     015H    ;WAVE 1
        OUT     01CH    ;WAVE 2
        MVI     A,070H
        OUT     016H    ;ATTACK 1
        OUT     01DH    ;ATTACH 2
        MVI     A,0F0H
        OUT     017H    ;DECAY 1
        OUT     01EH    ;DECAY 2
        MVI     A,0F8H
        OUT     019H    ;RELEASE 1
        OUT     020H    ;RELEASE 2
RELS:   MVI     A,0
        OUT     018H    ;GATE OFF 1
        OUT     01FH    ;GATE OFF 2
        XRA     A
        STA     GATE
SCAN:   MVI     B,0F7H
        MVI     C,0FFH
SCAN1:  INR     C       ;COUNT COL
        MOV     A,B
        RAL
        CPI     0E0H
        JZ      RELS    ;NO KEY PRESS
        OUT     7       ;SCAN COL
        MOV     B,A     ;SAVE
        IN      7       ;SCAN ROW
        ANI     0F0H
        CPI     0F0H
        JZ      SCAN1   ;NEXT COL
SCAN2:  MOV     B,A
        ANI     080H
        JZ      PLAY
        MOV     A,C
        ADI     4
        MOV     C,A
        MOV     A,B
        RAL
        JMP     SCAN2

PLAY:   LDA     GATE
        ORA     A
        JNZ     TONE
        MVI     A,1
        STA     GATE
        LDA     VOICE
        XRI     2
        STA     VOICE
        
TONE:   MVI     D,0
        MOV     A,C
        RAL
        MOV     E,A     ;DE=OFFSET
        LXI     H,NOTES ;TABLE START
        DAD     D       ;ADD OFFSET TO TABLE
        MOV     D,M     ;LOW BYTE
        INX     H
        MOV     E,M     ;HIGH BYTE
        LDA     VOICE
        ORA     A
        MOV     A,D
        JZ      TONE2
        
TONE1:  OUT     013H    ;SET TONE 1
        MOV     A,E
        OUT     014H    ;SET TONE 1
        MVI     A,0F6H
        OUT     018H    ;SET SUSTAIN 1
        JMP     SCAN
        
TONE2:  OUT     01AH    ;SET TONE 1
        MOV     A,E
        OUT     01BH    ;SET TONE 1
        MVI     A,0F6H
        OUT     01FH    ;SET SUSTAIN 2
        JMP     SCAN
        
NOTES:  DW      053BH
        DW      058BH
        DW      05DFH
        DW      0638H
        DW      0697H
        DW      06FBH
        DW      0766H
        DW      07D6H
        DW      084EH
        DW      08CCH
        DW      0952H
        DW      09E0H
        DW      0A76H
        DW      0B15H
        DW      0BBEH
        DW      0C71H
