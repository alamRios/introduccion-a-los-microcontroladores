/*
 * practica6.asm
 *
 *  Created: 25/03/2019 08:30:03 p. m.
 */ 

	.def temp = r16
	.def cont1 = r17
	.def cont2 = r18
	.def cont3 = r19
	.cseg
	.org 0
	rjmp reset
	rjmp inter0_lampara

reset:ldi temp,$00
	out ddrd,temp
	ldi temp,$01
	out ddrb,temp
	ldi temp,$03; CONFIGURACION PARA INT0
	sts eicra,temp
	ldi temp,$01
	out eimsk,temp
	sei

main:ldi temp,$01
	out portb,temp
interrp:rcall delay_5s
	ldi temp,$00
	out portb,temp
	rjmp interrp
	

inter0_lampara:ldi temp, $01
	out portb,temp
	ldi cont3,10
	ldi cont2,200
	ldi cont1,250
	reti

delay_5s: ldi cont3,10
	dj1:ldi cont2,200
	dj2:ldi cont1,250
	dj3:nop nop nop
		nop nop nop
		nop
		dec cont1
		brne dj3
		dec cont2
		brne dj2
		dec cont3
		brne dj1
	ret 