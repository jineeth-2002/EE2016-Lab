;
; P4 Compare - 8_16 Bit.asm
;
; Created: 01-09-2021
; Author : Jnaneswar
;

.CSEG
		LDI ZL, LOW(NUM<<1)			; Load address of the first value in the set into "Z" Pointer
		LDI ZH, HIGH(NUM<<1)
		LDI R16, $01				; Register for Loop counter
		LDI R18, $05				; Register that stores value n-1 (To stop the loop)

		LPM R17, Z					; R17 to store the largest number ( Initializing with the first number )

loop:	LPM R0, Z+					; Load Two numbers in registers R0,R1 for comparison
		LPM R1, Z
		INC R16						; Increment of Loop counter

		CP R17, R1					; Compare Largest number ( Intially first number in array ) with R1
		BRSH skip					; Branch if R17 ( Max Value ) is same or higher than R1
		MOV R17, R1					; If Max Value < Current value ( R1) , Update R17 ( Max Value ) = R1 ( Current Value )

skip:	CP R18,R16					;
		BRSH loop					; If i < n-1 , Continue the Loop 
									; else stop the Loop

		STS 0xFF, R17				; Store Largest Number in 0xFF LOcation in Memory

end:	NOP
NUM:	.db 0x45,0xAB,0x3E,0x10,0x02,0x05 ; Set of Values

