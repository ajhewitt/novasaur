;
; May 29, 2021
;
        .PROJECT        boot.com
;
ORIGIN  EQU     0
CPROM   EQU     01EDH
BOOTCPU EQU     02FDH
MOVXB   EQU     70DDH

        .ORG    ORIGIN
        ANI     7
        ADI     TABLE   -ORIGIN
        MOV     L,A
        MVI     A,41H
        MVI     H,ORIGIN>>8
        MOV     L,M     ;HL = VECTOR
        PCHL            ;JUMP VECTOR

KERNEL: LXI     DE,0FA01H ;DEST/ROM PAGE
        MVI     C,5     ;6 PAGES
        DW      CPROM   ;COPY ROM
        MVI     A,2
BOOT1:  DW      BOOTCPU
        INR     A
        CPI     8
        JNZ     BOOT1
        JMP     0FA00H  ;BOOT MONITOR
        
CPM0:   INR     A
CPM1:   INR     A
CPM2:   INR     A
CPM3:   INR     A
CPM4:   INR     A
CPM5:   INR     A
        MOV     L,A
COL1:   DW      MOVXB
        INR     H
        JNZ     COL1
        INR     B
        JMP     COL1


TABLE:  DB      KERNEL  -ORIGIN
        DB      KERNEL  -ORIGIN
        DB      CPM0    -ORIGIN
        DB      CPM1    -ORIGIN
        DB      CPM2    -ORIGIN
        DB      CPM3    -ORIGIN
        DB      CPM4    -ORIGIN
        DB      CPM5    -ORIGIN
;
; TEST - QUAD CORE CONTEXT MAP
;
        .ORG    080H
MVCTX   EQU     003DDH

        MVI     H,0
CTX1:   MOV     A,H
        ANI     6
        ORI     0F1H
        DW      MVCTX
        INR     H
        JNZ     CTX1
        RET
