	.def temp = r16
	.def cuenta = r17
	.def bandera = r18
	.cseg
	.org 0
	rjmp reset
	.org $00e
	rjmp timer0_ovf

reset:ldi temp,$02
	out tccr0a,temp 
	ldi temp,$05
	out tccr0b,temp
	ldi temp,200
	out ocr0a,temp ; comparacion a 200
	ldi temp,$02
	sts timsk0,temp
	ldi temp,$ff
	out ddrb,temp
	ldi cuenta,$00
	ldi bandera,$05
	ldi temp,$00
	sei

main: out portb,cuenta
	rjmp main

timer0_ovf:inc temp
	cp temp,bandera
	brne salir
	inc cuenta
	ldi temp,$00
salir:reti