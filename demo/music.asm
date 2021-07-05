;
; Scan expansion board numeric keypad, play ADSR tone
;
        .PROJECT        music.com

        ORG     0100H
GATE    EQU     01FFH
VOICE   EQU     GATE-1

        XRA     A
        STA     VOICE   ;CLEAR VOICE
        MVI     A,2
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
        XRI     1
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
        JZ      TONE2
        
TONE1:  MOV     A,D
        OUT     013H    ;SET TONE 1
        MOV     A,E
        OUT     014H    ;SET TONE 1
        MVI     A,0F6H
        OUT     018H    ;SET SUSTAIN 1
        JMP     SCAN
        
TONE2:  MOV     A,D
        OUT     01AH    ;SET TONE 1
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
