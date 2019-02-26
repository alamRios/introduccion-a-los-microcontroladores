	.def temp = r16
	.def cuenta = r17
	.cseg
	.org 0
	rjmp reset
	.org $010
	rjmp timer0_ovf

reset: ldi temp,$01
	out tccr0b,temp
	sts timsk0,temp
	ldi temp,$ff
	out ddrb,temp

	sei

main: nop
	nop
	nop
	rjmp main

timer0_ovf:nop
	nop
	nop
	reti