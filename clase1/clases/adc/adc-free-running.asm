/*
 * adc.asm
 *
 *  Created: 01/04/2019 08:16:25 p. m.
 *   Author: Turing
 */ 

 ; ADC = (Vin * 256) / Vref con 8 bits
	.def temp = r16
	.cseg
	.org 0
	rjmp reset
	
	.org $015
	rjmp adc_conv

reset:ldi temp,$FF
	out ddrb,temp

	ldi temp,$06
	sts admux,temp

	ldi temp,$01
	sts didr0,temp

	ldi temp, $ec
	sts adcsra, temp
	
	sei
main: rjmp main

adc_conv:lds temp, adch
	out portb, temp
	reti
