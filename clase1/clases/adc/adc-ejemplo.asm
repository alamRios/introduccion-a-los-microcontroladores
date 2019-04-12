/*
 * adc_ejemplo.asm
 *
 *  Created: 04/04/2019 08:34:44 p. m.
 *   Author: Turing
 */ 

	.def temp = r16
	.cseg
	.org 0
	rjmp reset
	
	.org $015
	rjmp adc_conv

reset:ldi temp,$FF
	out ddrb,temp

	ldi temp,$e0
	sts admux,temp

	ldi temp,$01
	sts didr0,temp

	ldi temp, $cc
	sts adcsra, temp
	
	sei
main: rjmp main

adc_conv:lds temp, adch
	out portb, temp
	ldi temp,$cc
	sts adcsra, temp
	reti
