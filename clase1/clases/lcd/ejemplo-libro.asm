/*
 * ejemplo_libro.asm
 *
 *  Created: 06/05/2019 08:28:53 p. m.
 */ 

	.def temp = r16
	.cseg
	.org 0
	
	ldi temp, $fe
	out ddrd, temp
	rcall delay_50ms
	;; funcion set 4 bits
	ldi temp, $20
	out portd, temp
	sbi portd, 2
	cbi potrd, 2
	rcall delay_5ms
	;; funcion set 8 bits
	ldi temp, $20 ; parte baja
	out portd, temp
	sbi portd, 2
	cbi potrd, 2

	ldi temp, $80; parte alta
	out portd, temp
	sbi portd, 2
	cbi potrd, 2
	rcall delay_5ms
	;; display on/off
	ldi temp, $00 ; parte baja
	out portd, temp
	sbi portd, 2
	cbi potrd, 2

	ldi temp, $e0; parte alta
	out portd, temp
	sbi portd, 2
	cbi potrd, 2
	rcall delay_5ms
	;; entry mode
	ldi temp, $00 ; parte baja
	out portd, temp
	sbi portd, 2
	cbi potrd, 2

	ldi temp, $60; parte alta
	out portd, temp
	sbi portd, 2
	cbi potrd, 2
	rcall delay_5ms

delay_50ms: