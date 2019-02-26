; 0 es entrada, 1 es salida
; port es para sacar
; ddr para configurar
; pin para leer
; pagina 73 del pdf

; Leer entrada de botones en puerto b
; y sacar a salida en puerto d

	.def temp = r16
	.cseg
	.org 0

	ldi temp,$FF
	out ddrb,temp ; puerto b como salida
	out portd,temp ; activar resistencias pull up

main:in temp,pind
	com temp ; complemento a 1
	out portb,temp
	rjmp main