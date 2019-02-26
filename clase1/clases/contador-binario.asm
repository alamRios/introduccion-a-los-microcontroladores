/*
 * contador_binario.asm
 *
 *  Created: 21/02/2019 09:13:18 p. m.
 */ 

	.def temp = r16
	.def cont1 = r17
	.def cont2 = r18
	.def cont3 = r19
	.cseg
	.org 0

	ldi temp,$ff
	out ddrb,temp

main:out portb,temp
	rcall delay_1s
	inc temp
	rjmp main

delay_1s: ldi cont1,2
salto1:ldi cont2,200
salto2:ldi cont3,250
salto3:nop nop nop
	nop nop nop
	nop
	dec cont3
	brne salto3
	dec cont2
	brne salto2
	dec cont1
	brne salto1
	ret