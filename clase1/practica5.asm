/*
 * practica5.asm
 *
 *  Created: 11/03/2019 09:02:30 p. m.
 *	
 *	Mismo programa de FastPWM pero con otro botón para disminuir
 *	Añadir validacion de que no haya sobreflujo
 */ 

	.def temp = r16
	.def limdec =r19
	.def liminc =r20
	.def cte = r15
	.def cont1 = r17
	.def cont2 = r18
	.cseg
	.org 0

ldi temp,$40
out ddrd,temp
ldi temp,$03
out portc,temp


ldi temp,$83
out tccr0a,temp
ldi temp,$01
out tccr0b,temp

ldi temp,125
out ocr0a,temp
ldi temp,$05
mov cte,temp

ldi limdec,$00
ldi liminc,$ff
main:
	in temp,PINC
	andi temp,0x03
	cpi temp,0x01
	breq aumentar
	cpi temp,0x02
	breq decrementar
	rjmp main
aumentar:
	rcall delay_50m
	in temp,ocr0a
	cp temp,liminc
	breq limitDec
	add temp,cte
	out ocr0a,temp
	rjmp main
decrementar:
	rcall delay_50m
	in temp,ocr0a
	cp temp,limdec
	breq limitDec
	sub temp,cte
	out ocr0a,temp
	rjmp main
limitDec:
		out ocr0a,temp
		rjmp main
delay_50m:
	ldi cont1,20
lazo2:
	ldi cont2,250
lazo1:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec cont2
	brne lazo1
	dec cont1
	brne lazo2
	ret 