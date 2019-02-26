; Cada instruccion dura 1 micro seg
; AUTO KID
;d0 d1
; 00 -> <-
; 01 <- ->
; 10 kid 2x
; 11 kid normal

	.def temp = r16
	.def cont1 = r17
	.def cont2 = r18
	.cseg
	.org 0

	ldi temp,$FF
	out ddrb,temp ; puerto b como salida
	ldi temp,$01
	out portb,temp

izq:cpi temp,$80
	breq der
	lsl temp
	out portb,temp
	rcall delay_125ms
	rjmp izq

der:cpi temp,$01
	breq izq
	lsr temp
	out portb,temp
	rcall delay_125ms
	rjmp der


delay_125ms:ldi cont2,50
lazo2:ldi cont1,250
lazo1:nop nop
	nop nop nop 
	nop nop
	dec cont1
	brne lazo1
	dec cont2
	brne lazo2
	ret