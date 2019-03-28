; Dibujos en matriz de leds
; programa para puertos de entrada y salida MATRIZ LED 8x8
	.def temp = r16
	.def contador1 = r17
	.def contador2 = r22 
	.cseg
	.org $0
	;Configurando -Entradas
	ldi temp, $00
	out ddrc, temp	; configura puerto c entrada
	ldi temp, $03
	out portc, temp ; configurando dos entradas
	;Configurando Salidas
	ldi temp, $ff
	out ddrd, temp
	out portd, temp
	out ddrb, temp
	out portd, temp

main:	in temp, pinc
		andi temp, $03
		cpi temp, $03
		breq dibujo_2r
		cpi temp, $02
		breq dibujo_1r
		cpi temp, $01
		breq dibujo_3r
	rjmp main

dibujo_1r: rjmp dibujo_1
dibujo_2r: rjmp dibujo_2
dibujo_3r: rjmp dibujo_3

delay_m:ldi contador2, 50
lazo2: ldi contador1, 3
lazo1:  nop
		nop
		nop
		nop
		nop
		nop
		nop
		dec contador1
		brne lazo1
		dec contador2
		brne lazo2
		ret

dibujo_3:ldi temp,$ff
		out portb,temp 
		ldi temp,$01
		out portd,temp
		ldi temp,$00;uno
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$02
		out portd,temp
		ldi temp,$66;dos
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$04
		out portd,temp
		ldi temp,$ff;tres
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$08
		out portd,temp
		ldi temp,$ff;cuatro
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$10
		out portd,temp
		ldi temp,$ff;cinco
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$20
		out portd,temp
		ldi temp,$7e;seis
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$40
		out portd,temp
		ldi temp,$3c;siete
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$80
		out portd,temp
		ldi temp,$18;ocho
		com temp
		out portb,temp
		rcall delay_m
		rjmp main

dibujo_1:ldi temp,$ff
		out portb,temp 
		ldi temp,$01
		out portd,temp
		ldi temp,$3c;uno
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$02
		out portd,temp
		ldi temp,$3c;dos
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$04
		out portd,temp
		ldi temp,$3c;tres
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$08
		out portd,temp
		ldi temp,$3c;cuatro
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$10
		out portd,temp
		ldi temp,$ff;cinco
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$20
		out portd,temp
		ldi temp,$7e;seis
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$40
		out portd,temp
		ldi temp,$3c;siete
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$80
		out portd,temp
		ldi temp,$18;ocho
		com temp
		out portb,temp
		rcall delay_m
		rjmp main

dibujo_2:ldi temp,$ff
		out portb,temp 
		ldi temp,$01
		out portd,temp
		ldi temp,$00;uno
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$02
		out portd,temp
		ldi temp,$18;dos
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$04
		out portd,temp
		ldi temp,$18;tres
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$08
		out portd,temp
		ldi temp,$18;cuatro
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$10
		out portd,temp
		ldi temp,$7e;cinco
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$20
		out portd,temp
		ldi temp,$7e;seis
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp 
		ldi temp,$40
		out portd,temp
		ldi temp,$66;siete
		com temp
		out portb,temp
		rcall delay_m
		ldi temp,$ff
		out portb,temp
		ldi temp,$80
		out portd,temp
		ldi temp,$66;ocho
		com temp
		out portb,temp
		rcall delay_m
		rjmp main