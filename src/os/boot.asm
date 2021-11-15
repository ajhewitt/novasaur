; TITLE: 'BOOT LOADER'
;
; NOV 14, 2021
;
        .PROJECT        boot.com
;
STACK   EQU     0E880H
BREAK   EQU     STACK
;
CPROM   EQU     001EDH
BOOTCPU EQU     002FDH
MVCTX   EQU     004DDH
MOVXB   EQU     070DDH

        .ORG    0
        ANI     7       ;LIMIT TO 8 CPUS
        JNZ     START   ;BOOT CPU1-7
HALT:   HLT             ;HALT CPU0
        NOP
        NOP
RST1:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST2:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST3:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST4:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST5:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST6:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST7:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
START:  ADI     TABLE
        MOV     L,A     ;L=TABLE+CPU
        MVI     H,0
        MOV     L,M     ;HL=BOOT VECTOR
        PCHL            ;JUMP TO VECTOR

KERNEL: MVI     A,0     ;CLEAR CTX TABLE
        MOV     H,A
CTX1:   DW      MVCTX   ;CTX=0
        INR     H
        JNZ     CTX1
        LXI     DE,0F002H;DEST/ROM PAGE
        MVI     C,15    ;16 PAGES
        DW      CPROM   ;COPY ROM
        MVI     A,2
BOOT1:  DW      BOOTCPU
        INR     A
        CPI     8
        JNZ     BOOT1
        JMP     0F800H  ;BOOT MONITOR
        
CPM:    LXI     DE,0DC12H;DEST/ROM PAGE
        MVI     C,29    ;30 PAGES
        DW      CPROM   ;COPY ROM
        JMP     0F200H  ;WARM BOOT CPM

DISK:   LXI     DE,0FF01H;DEST/ROM PAGE
        MVI     C,0     ;1 PAGE
        DW      CPROM   ;COPY ROM
        JMP     0FF00H  ;BOOT DISK

TABLE:  DB      HALT
        DB      KERNEL
        DB      HALT
        DB      HALT
        DB      DISK
        DB      DISK
        DB      DISK
        DB      DISK
;
; TEST - QUAD CORE CONTEXT MAP
;
        MVI     H,0
CTX2:   MOV     A,H
        RLC
        ANI     6
        ORI     0F1H
        DW      MVCTX
        INR     H
        JNZ     CTX2
        RET
