/*
 * mux_adc.asm
 *
 *  Created: 11/04/2019 08:42:42 p. m.
 *   Author: Turing
 */ 
	.def temp=r16
	.def display=r17
	.def transmitir = r18
	.cseg
	.org 0
	rcall reset
	.org $015
	rjmp adc_conv

reset:ldi temp, $60
	sts admux, temp
	
	ldi temp, $03
	sts didr0, temp
	
	ldi temp,$cc
	sts adcsra, temp

	sei

main:rjmp main

adc_conv:lds temp, admux
	cpi temp, $60
	breq leer_d
	lds transmitir, adch
	ldi temp, $60
	sts admux, temp
	ldi temp,$cc
	sts adcsra, temp
	reti

leer_d:lds display, adch
	ldi temp, $61
	sts admux, temp
	ldi temp, $CC
	sts adcsra, temp