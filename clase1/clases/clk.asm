/*
 * clk.asm
 *
 *  Created: 25/02/2019 08:18:13 p. m.
 */ 

	.def temp = r16
	.cseg
	.org 0
	rjmp reset
	.org $010
	rjmp timer0_ovf

reset:


timer0_ovf:
