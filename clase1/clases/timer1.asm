/*
 * timer1.asm
 *
 *  Created: 11/03/2019 09:12:04 p. m.
 *	Hacer que un led parpadee cada segundo utilizando timer1 ovf
 */ 
	.def temp = r16
	.cseg
	.org 0
	rjmp int_reset
	.org $00b
	rjmp blink

int_reset:ldi temp,$01
	out ddrb,temp
	ldi temp,$0b
	sts tccr1b,temp
	ldi temp,$3d
	sts ocr1ah,temp
	ldi temp,$09
	sts ocr1al,temp
	ldi temp,$02
	sts timsk1,temp

main:rjmp main

blink:com temp
	out portb,temp
	reti