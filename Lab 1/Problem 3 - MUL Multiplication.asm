;
; P3 Multiply -  8 Bit.asm
;
; Created: 01-09-2021
; Author : Jnaneswar
;

.CSEG
		LDI ZL, LOW(NUM<<1)		; Load Adrdress of first data byte
		LDI ZH, HIGH(NUM<<1)	

		LPM R3, Z+				; Load contents of address stored in Z Pointer
		LPM R4, Z

		MUL R3, R4				; Multiply both the numbers and store result in R0 and R1 registers

		NOP						; End of Program
NUM:	.db 0xFF, 0xFF

		
		
