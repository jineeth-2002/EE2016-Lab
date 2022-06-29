;
; Problem 2 - Manual Mult - 8 Bit.asm
;
; Created: 01-09-2021
; Author : Jnaneswar
;

.DEF ANSL = R0            ;To hold low-byte of answer     
.DEF ANSH = R1            ;To hold high-byte of answer

.CSEG
		LDI ZL, LOW(NUM<<1)			; Load address into "Z" Pointer
		LDI ZH, HIGH(NUM<<1)

        LPM R16,Z+         ;Load multiplicand into A
        LPM R18,Z          ;Load multiplier into B
MUL8x8:
        LDI R20,8         ;Load bit counter into C
        CLR ANSH          ;Clear high-byte of answer
        MOV ANSL,R18      ;Copy multiplier into low-byte of answer
        LSR ANSL          ;Shift low-bit of multiplier into Carry
LOOP:   BRCC SKIP         ;If carry is zero then skip addition 
        ADD ANSH,R16      ;Add multiplicand to answer
SKIP:   ROR ANSH          ;Shift low-bit of high-byte 
        ROR ANSL          ;of answer into low-byte
        DEC R20           ;Decrement bit-counter
        BRNE LOOP         ;If all eight bytes used
                          ;Result stored in ANSL and ANSH

end:	NOP
NUM:	.db 0x04, 0x05