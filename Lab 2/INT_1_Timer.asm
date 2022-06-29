;
; Int_1_Timer_Blink.asm
;
; Created: 21-09-2021 19:05:27
; Author : Jnaneswar
;

.org 0x0000
rjmp reset

.org 0x0004
rjmp int1_ISR

.org 0x0100
reset:
	    ;Loading stack pointer address
        LDI R16,0x70
	    OUT SPL,R16
	    LDI R16,0x00
	    OUT SPH,R16
	  

	    ;Interface port B pin0 to be output
	    ;so to view LED blinking
	    LDI R16,0x00
	    OUT DDRB,R16
	  
	    LDI R16,0x00
	    OUT DDRD,R16

	  
	    LDI R16,0x00		; Set MCUCR register to enable low level interrupt
	    OUT MCUCR,R16

	  
	    LDI R16,0x80		; Set GICR register to enable interrupt 1
	    OUT GICR,R16

	    LDI R16,0x00		; PORTB as input of Push Button signal
	    OUT PORTB,R16

	    SEI				;

ind_loop:rjmp ind_loop

int1_ISR:IN R16,SREG
		 PUSH R16
         
         LDI R16,0x0A

loop:    LDI R20, HIGH (15625-1)
         OUT OCR1AH, R20
         LDI R20, LOW (15625-1)
         OUT OCR1AL, R20

         LDI R20,0x0
         OUT TCNT1H, R20
         OUT TCNT1L, R20

         OUT TCCR1A, R20
         LDI R20, 0xB
         OUT TCCR1B, R20
again:   IN R20,TIFR
         SBRS R20, OCF1A
         RJMP again

         LDI R20,1<<OCF1A
         OUT TIFR, R20
         LDI R19, 0x00
         OUT TCCR1B, R19
         OUT TCCR1A, R19

         DEC R16
         BRNE loop


		 POP R16
		 OUT SREG,R16

		 RETI
	
