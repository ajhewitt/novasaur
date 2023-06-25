; TITLE: 'FORMAT'
;
; JUN 24, 2023
;
        .PROJECT        format.com

LF	EQU	10
CR	EQU	13

;-------------------------------------------
;CP/M 2 BDOS Equates
;-------------------------------------------
BIOS    EQU     0FA00H
WBOOT	EQU	BIOS+3  ;Warm Boot
PRINT	EQU	9
BDOS	EQU	5

        .ORG    100H

        JMP     HELP
;
; Exit and print an error message
;
ERXIT:	POP	D		;GET MESSAGE
	MVI	C,PRINT
	CALL	BDOS		;PRINT MESSAGE
EXIT:	JMP	WBOOT		;Warm boot CP/M
;
; Exit with usage message
;
HELP:	call	ERXIT
        db 'Format a drive.',CR,LF
        db 'Usage:',CR,LF
        db ' FORMAT {A:} [/Y]',CR,LF
        db '   A: is only drive available, '
        db '/Y to confirm without further prompt',CR,LF,'$'
        
        END
