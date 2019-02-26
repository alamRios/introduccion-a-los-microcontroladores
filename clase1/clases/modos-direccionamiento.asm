	.def temp = r16
	.cseg
	.org 0
	; =================== MEMORIA DE DATOS

	; indirecto
	;ldi XL,$00
	;ldi XH,$01 ; x = $0100
	;ldi temp,$05
	;st x,temp
	
	; indirecto con desplazamiento
	;ldi YL,$00
	;ldi YH,$01 ; x = $0100
	;ldi temp,$05 ; va a guardar en $013F
	;std y+$3f,temp

	; indirecto con predecremento
	;ldi YL,$0a
	;ldi YH,$01 ; x = $010a
	;ldi temp,$05 ; va a guardar en $010a
	;st y+,temp
	
	; ============= MEMORIA DE PROGRAMA
	; indirecto call
	;ldi ZL,low(subrutina)
	;ldi ZH,high(subrutina)
	;icall
	;ldi temp,$05
	;nop

;subrutina:nop
	;ret

	; indirecto jmp
	;ldi ZL,low(salto)
	;ldi ZH,high(salto)
	;ijmp
;salto1:ldi temp,$05
	;nop

;salto:nop
	;ldi ZL,low(salto1)
	;ldi ZH,high(salto1)
	;ijmp

	ldi ZL,low(sigue)
	ldi ZH,high(sigue)
main:nop
	nop
	rcall subrutina
sigue:nop
	rjmp main

subrutina: nop
	nop
	ret