.def aux = R16
.def uni = R17
.def dece = R18
.def mux = R19
.def dispU = R20
.def dispD = R21
.def cont1 = R23
.def cont2 = R24
.cseg
.org 0
rjmp reset
.org 0x010
rjmp timer_cero
reset:
	;configuring portc as output
	ldi aux,0XFF
	OUT DDRC,aux
	;configuring portb as output
	ldi aux,0XFF
	OUT DDRB,aux
	;configuring timer
	ldi aux,0X03
	out tccr0b,aux;setting prescaler in 1024
	ldi aux,0x01
	sts timsk0,aux;setting overflow interruption

	sei
ldi uni,0x00
ldi dece,0x01
ldi dispU,0X3F
ldi dispD,0X3F
ldi mux,0x02
main:
	inc uni	
	;we load the dispaly value constants from
	MOV aux,uni
	ldi ZL,low(disp_7*2)
	ldi ZH,high(disp_7*2)
	ldi XL,0x00
	ldi XH,0x01
	lazoU:
		lpm
		st x+,r0
		MOV dispU,r0
		adiw ZL,1
		dec aux
		brne lazoU
	cpi uni,0x0B
	breq inc_dec	
	/*Delay 1s*/
	rcall delay_250ms
	rcall delay_250ms
	/*rcall delay_250ms
	rcall delay_250ms*/
	rjmp main
res_dec:
	ldi dece,0x00
	rjmp main
inc_dec:
	ldi uni,0x00
	inc dece
	MOV aux,dece
	ldi ZL,low(disp_7*2)
	ldi ZH,high(disp_7*2)
	ldi XL,0x00
	ldi XH,0x01
	lazoD:
		lpm
		st x+,r0
		MOV dispD,r0
		adiw ZL,1
		dec aux
		brne lazoD
	cpi dece,0x0A
	breq res_dec
	rjmp main
timer_cero:
	ldi mux,0x03
	OUT portc,mux
	ldi mux,0x01
	OUT portc,mux
	OUT portb,dispD
	rcall delay_1ms
	rcall delay_1ms
	ldi mux,0x02
	OUT portc,mux
	OUT portb,dispU
	;rcall delay_1ms
	reti

delay_1ms:
ldi cont1,100
lazo1:
	dec cont1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	brne lazo1
	ret
delay_250ms:
	ldi cont1,255
	ldi cont2,75		
	l1:
		dec cont1
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		brne l1
		dec cont2
		brne l1	
	ret

.cseg        ;0    1    2    3    4    5    6    7    8    9
disp_7: .db 0X3F,0X06,0X5B,0X4F,0X66,0X6D,0X7D,0X07,0x7F,0X67
