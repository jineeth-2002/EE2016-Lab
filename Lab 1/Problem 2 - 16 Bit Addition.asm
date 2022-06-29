;
; 16 Bit - Add P2.asm
;
; Created: 01-09-2021
; Author : Jnaneswar
;

.CSEG	
		LDI ZL,LOW(NUM<<1)		; Load Address of first data byte
		LDI ZH,HIGH(NUM<<1)

		LPM R0, Z+		; Load contents of location stored in Z pointer
		LPM R1, Z+
		LPM R2, Z+
		LPM R3, Z

		LDI R16, $00	; Clear R16, To hold carry

		ADD R0, R2		; Add Low Bytes together
		ADC R1, R3		; Add High Bytes together with carry
		BRCC abc`		; Jump, if no carry
		LDI R16, $01

abc:	NOP				; End of Program, NO Operation
NUM:	.dw 0xFFFF,0xFFFF
						; Two numbers added and result is stored in R0 R1 

