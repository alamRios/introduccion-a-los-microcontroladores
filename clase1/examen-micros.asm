/*
1. Con el sobreflujo timer0 aproximadamente cada 16mseg, haga un toggle en la señal de salida por el pin pb0
*/
	.def temp = r16
	.cseg
	.org 0
	rjmp reset
	.org $010
	rjmp timer0_ovf

reset: ldi temp,$05
	out tccr0b,temp
	ldi temp,$01
	sts timsk0,temp
	ldi temp,$01
	out ddrb,temp
	ldi temp,$00
	sei

main: out portb,temp
	rjmp main

timer0_ovf:com temp
    reti

/*
2. Se tiene conectado un push-button con resistencia de pull-up interna en el pin pb0 de manera que cada que 
    se presiona el botón se toma una muestra de una señál analógica en adc0, la resolución del adc es de 8 bits 
    y el resultado de la conversaión se muesra en 8 leds conectados en el puerto c
*/
	.def temp = r16
	.cseg
	.org 0
	rjmp reset
	
	.org $015
	rjmp adc_conv

reset:ldi temp,$FF
	out ddrb,temp

	ldi temp,$06
	sts admux,temp

	ldi temp,$01
	sts didr0,temp
    out portb,temp ; push button

	ldi temp, $ec
	sts adcsra, temp
	
    ldi temp,$00
    out portc, temp

	sei
main: in pinb,temp
    cpi temp, $01
    breq update_adc
    rjmp main

update_adc: out portc, temp
    rjmp main

adc_conv:lds temp, adch
	reti

/*
3. Utilizando el timer1 y fast pwm de 8 bits generar una señal pwm con una frecuencia de 4kHz aproximadamente
    y un ciclo de trabajo del 25% aprox
*/
	.def temp = r16
	.cseg
	.org 0
;reset
ldi temp,$40
out ddrd,temp

ldi temp,$81
out tccr1a,temp
ldi temp,$09
out tccr1b,temp
ldi temp,125
out ocr1a,temp

main: rjmp main

/*
4. Modifique el código del problema anterior de manera que por medio de la usart se pueda modificar el ciclo de 
    trabajo de la señal pwm, es decir los datos que se reciben en la suart modifican el ciclo de trabajo de la 
    señal pwm
*/

/*
5. Obtenga una señal cuadrada en el pin pb0 de un periodo aproximado de 32 mseg, utilice un delay
*/
    .def temp = r16
	.def cont1 = r17
	.def cont2 = r18
	.cseg
	.org 0

	ldi temp,$ff
	out ddrb,temp

main:out portb,temp
	rcall delay_16ms
	inc temp
	rjmp main

delay_16ms: ldi cont1,64
salto1:ldi cont2,250
salto2:nop nop nop
	nop nop nop
	nop
	dec cont2
	brne salto2
	dec cont1
	brne salto1
	ret