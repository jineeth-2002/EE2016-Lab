;
; P1 Add - 8 Bit.asm
;
; Created: 01-09-2021
; Author : Jnaneswar
;

.CSEG	
		LDI ZL,LOW(NUM<<1)		; Load Address of first data byte
		LDI ZH,HIGH(NUM<<1)

		LPM R0, Z+		; Load contents of location stored in Z pointer
		LPM R1, Z

		LDI R16, $00	; Clear R16, To hold carry

		ADD R0, R1		; Add Bytes together
		BRCC abc`		; Jump, if no carry
		LDI R16, $01

abc:	NOP				; End of Program, NO Operation
NUM:	.db 0xFF,0xFF
						; Two numbers added and result is stored in R0

