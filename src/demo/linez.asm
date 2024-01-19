; TITLE: 'LINES DEMO'
;
; JAN 17, 2024
;
RAND    EQU     19DDH
MOVMA   EQU     77DDH           ; MOV VM,A

VIDL    EQU     28H
VIDR    EQU     29H
VIDH    EQU     2AH
VSTART  EQU     30H

        ORG     100H

        LXI     H, 0101H        ; 1 PAGE, VMODE 1 (208x160 VGA)
        CALL    003CH           ; RELOC
        MVI     A, 0FFH         ; VSTART=0
        OUT     VSTART          ; SET VIDEO START
        IN      VIDL
        MOV     B, A
        IN      VIDR
        SUB     B
        STA     WID             ; SET WIDTH

        MVI     H, 0            ; ROW=0
C0:     MVI     L, 0            ; COL=0
C1:     XRA     A
        DW      MOVMA
        INR     L
        MVI     A, 0F0H
        CMP     L               ; COL>RIGHT?
        JNC     C1
        INR     H
        IN      VIDH
        CMP     H               ; ROW>HEIGHT?
        JNZ     C0

        LXI     B, 4040H

L0:     MVI     D, 0
        MOV     A, B
        RLC
        MOV     E, A
        JNC     L1
        DCR     D
L1:     LHLD    COL
        DAD     D
        MVI     A, 0FFH
        CMP     H               ; COL<0?
        JNZ     L2              ; NO: CONTINUE
        LXI     H, 0
        JMP     L3
L2:     LDA     WID
        CMP     H               ; COL>WIDTH?
        JNC     L4              ; NO: CONTINUE
        DCR     A
        MOV     H, A
        MVI     L, 0FFH
L3:     LDA     LIN
        INR     A
        STA     LIN
        DW      RAND            ; NEXT VECTOR
L4:     SHLD    COL

        MVI     D, 0
        MOV     A, C
        RLC
        MOV     E, A
        JNC     L5
        DCR     D
L5:     LHLD    ROW
        DAD     D
        MOV     A, H
        CPI     0FFH            ; ROW<0?
        JNZ     L6              ; NO: CONTINUE
        LXI     H, 0
        JMP     L7
L6:     IN      VIDH
        CMP     H               ; COL>HEIGHT?
        JNC     L8              ; NO: CONTINUE
        MOV     H, A
        MVI     L, 0FFH
L7:     LDA     LIN
        INR     A
        STA     LIN
        DW      RAND            ; NEXT VECTOR
L8:     SHLD    ROW

        IN      VIDL
        LXI     H, COL+1
        ADD     M
        MOV     L, A
        LDA     ROW+1
        MOV     H, A
        LDA     LIN
        DW      MOVMA           ; WRITE PIXEL
        JMP     L0

WID     DB      0
LIN     DB      0
ROW     DW      100H
COL     DW      100H

        END
