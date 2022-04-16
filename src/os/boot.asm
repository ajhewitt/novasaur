; TITLE: 'BOOT LOADER'
;
; APR 16, 2022
;
        .PROJECT        boot.com
;
CPROM   EQU     001EDH
BOOTCPU EQU     002FDH
MVCTX   EQU     004DDH
CMDSND	EQU	005DDH

        .ORG    0

RST0:   ADI     TABLE
        MOV     L, A    ;L=TABLE+CPU
        MVI     H, 0
        MOV     L, M    ;HL=BOOT VECTOR
        PCHL            ;JUMP TO VECTOR
HALT:   HLT             ;HALT CPU0
RST1:   MVI     C, 0
        DW      CMDSND  ;SEND NULL; YIELD
        JMP     RST1    ;WAIT FOREVER
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
; - BOOT OTHER CPUS
; - SETUP CPU SEQ: 1,2,3,1,4,5,6,7
; - COPY KERNEL/MONITOR
;
KERNEL: MVI     A, 2
BOOT1:  DW      BOOTCPU
        INR     A
        CPI     8
        JNZ     BOOT1
        XRA     A
        MOV     H, A
CTX1:   DW      MVCTX
        INR     H
        JNZ     CTX1
        LXI     D, 0F002H;DEST/ROM PAGE
        MVI     C, 13   ;14 PAGES
        DW      CPROM   ;COPY ROM
        JMP     0F800H  ;BOOT MONITOR
;
; CP/M 2.2
;
CPM:    LXI     DE, 0E45CH;DEST/ROM PAGE
        MVI     C, 27   ;28 PAGES
        DW      CPROM   ;COPY ROM
        JMP     0FA00H  ;BOOT CPM
;
; DISK QUADRANT
;
DISK:   LXI     DE, 0FF01H;DEST/ROM PAGE
        MVI     C, 0    ;1 PAGE
        DW      CPROM   ;COPY ROM
        JMP     0FF00H  ;BOOT DISK
;
; JUMP VECTOR TABLE
;
TABLE:  DB      HALT
        DB      KERNEL
        DB      CPM
        DB      RST1
        DB      DISK
        DB      DISK
        DB      DISK
        DB      DISK
