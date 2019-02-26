; CONSTANTE EN MEMORIA DE PROGRAMA
	.def temp = r16
	.cseg
	.org 0

	ldi temp,$04
	ldi ZL,low(display*2)
	ldi ZH,high(display*2)
	ldi XL,$00
	ldi XH,$01
lazo:lpm r15,z+ ; leer de memoria de programa
	st x+,r15
	adiw ZL,1
	dec temp
	brne lazo
	nop
	nop

	.cseg
	display: .db $3f, $03, $5a, $14