/*
 * echo.asm
 *
 *  Created: 15/04/2019 08:50:19 p. m.
 *   Author: Turing
 */ 

	.def temp = r16
	.cseg
	.org 0
	rjmp reset
	.org $012
	rjmp rx_complete

reset:ldi temp,$01
	out ddrb,temp ; LED at B(0)

	ldi temp,$02
	out ddrd,temp ; Rx & Tx at portd

	sts ucsr0a, temp ; 2x vel

	ldi temp,$98
	sts ucsr0b, temp ; interruptions

	ldi temp,12
	sts ubrr0l,temp ; 9600 baud rate

main:cpi temp,$30
	breq turn_on
	cpi temp,$31
	breq turn_off
	rjmp main

turn_on:ldi temp,$01
	out portb,temp
	rjmp main

turn_off:ldi temp,$00
	out portb,temp
	rjmp main

rx_complete:lds temp, udr0
	reti