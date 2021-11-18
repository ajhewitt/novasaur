; TITLE: 'BOOT LOADER'
;
; NOV 17, 2021
;
        .PROJECT        boot.com
;
CPROM   EQU     001EDH
BOOTCPU EQU     002FDH
MVCTX   EQU     004DDH
CMDSND	EQU	005DDH

        .ORG    0

RST0:   ADI     TABLE
        MOV     L,A     ;L=TABLE+CPU
        MVI     H,0
        MOV     L,M     ;HL=BOOT VECTOR
        PCHL            ;JUMP TO VECTOR
HALT:   HLT             ;HALT CPU0
RST1:   MVI     C,0
        DW      CMDSND  ;SEND NULL; YIELD
        JP      RST1    ;WAIT FOREVER
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
;
; KERNEL
; - SETUP CPU SEQ: 1,2,3,1,4,5,6,7
; - COPY KERNEL/MONITOR
; - BOOT OTHER CPUS
;
KERNEL: MVI     H,0
CTX1:   MOV     A,H
        ANI     7
        CPI     3
        JC      CTX2    ;CPU<3
        JNZ     CTX3    ;CPU>3
        XRA     A       ;A=0
CTX2:   INR     A       ;A+=1
CTX3:   ORI     0F0H
        DW      MVCTX
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
;
; CP/M 2.2
;
CPM:    LXI     DE,0DC12H;DEST/ROM PAGE
        MVI     C,29    ;30 PAGES
        DW      CPROM   ;COPY ROM
        JMP     0F200H  ;WARM BOOT CPM
;
; DISK QUADRANT
;
DISK:   LXI     DE,0FF01H;DEST/ROM PAGE
        MVI     C,0     ;1 PAGE
        DW      CPROM   ;COPY ROM
        JMP     0FF00H  ;BOOT DISK
;
; JUMP VECTOR TABLE
;
TABLE:  DB      HALT
        DB      KERNEL
        DB      RST1    ;CPM
        DB      RST1    ;CPM
        DB      DISK
        DB      DISK
        DB      DISK
        DB      DISK
