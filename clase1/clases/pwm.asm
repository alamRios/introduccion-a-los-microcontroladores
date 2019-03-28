/*
 * pwm.asm
 *
 *  Created: 11/03/2019 08:23:32 p. m.
 *	Programa para generar una señal PWM en puerto b con Fast PWM
 */ 
	.def temp = r16
	.def salto = r17
	.def cont1 = r18
	.def cont2 = r19
	.cseg
	.org 0
	
	ldi temp,$40
	out ddrd,temp
	ldi temp,$01
	out portd,temp
	ldi temp,$83
	out tccr0a,temp
	ldi temp,$01
	out tccr0b,temp
	ldi temp,127
	ldi salto,5
	out ocr0a,temp ; Registro de comparacion

main:sbic pind,0
	rjmp main
	rcall delay_20ms
	in temp,ocr0a
	add temp,salto
	out 0cr0a,temp
	rjmp main

delay_20ms:ldi cont1,10
s1:	ldi cont2,250
s2:	nop nop nop
	nop nop
	nop nop
	dec cont2
	brne s2
	dec cont1
	brne s1
	ret