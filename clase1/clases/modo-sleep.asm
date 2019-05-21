/*
 * modo_sleep.asm
 *
 *  Created: 20/05/2019 08:18:20 p. m.
 *   Author: Turing
 */ 

	.def temp = r16
	.def cont1 = r17
	.def cont2 = r18
	.cseg
	.org 0
	rjmp reset
	.org $003
	rjmp waking_up

reset:ldi temp,$01
	out ddrb,temp
	ldi temp,$40
	out portb,temp; pull-up pinb5
	
	ldi temp,$01
	sts pcicr,temp
	ldi temp,$40
	sts pcmsk0,temp

	sei

main:ldi temp,$01
	out portb,temp
	rcall delay_500ms
	ldi temp,$00
	out portb,temp
	rcall delay_500ms
	ldi temp,$05
	out smcr,temp
	sleep
	rjmp main
	
waking_up: nop
	reti

delay_500ms:ldi cont1,200
s1:	ldi cont2,250
s2: nop nop nop nop
	nop nop nop 
	dec cont2
	brne s2
	dec cont1
	brne s1
	ret
