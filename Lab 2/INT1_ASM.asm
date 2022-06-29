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
		 MOV R0,R16
		 ;Modify below loops to make LED blink for 1 sec
	c1:	 LDI R16,0x01	; To blink LED 10 times ( R0 used )
		 OUT PORTB,R16

		 LDI R16,0xFF
	a1:	 LDI R17,0xFF	; LED ON for 1 second
	a2:	 DEC R17
		 BRNE a2
		 DEC R16
		 BRNE a1
		 
		 LDI R16,0x00
		 OUT PORTB,R16

		 LDI R16, 0xFF
	b1:	 LDI R17,0xFF	; LED OFF for 1 second
	b2:	 DEC R17
		 BRNE b2
		 DEC R16
		 BRNE b1
		 
		 DEC R0
		 BRNE c1		

		 POP R16
		 OUT SREG,R16

		 LDI R16, 0xC
		 OUT PORTD, R16

		 RETI
	
