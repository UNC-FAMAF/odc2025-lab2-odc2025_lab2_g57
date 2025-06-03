	.include "constants.s"
	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x28, x0	// Guarda la dirección base del framebuffer en x28
	//---------------- CODE HERE ------------------------------------
	movz x0, 0x40, lsl #16
    movk x0, 0xD0CF, lsl #0
	movz x1, 0x17, lsl #16
    movk x1, 0x6CD6, lsl #0
	bl background_gradient
	bl draw_flower

	bl draw_sand
	bl draw_road
	bl draw_odc_sign
	bl draw_edificios_fondo


	bl draw_casa_calamardo
	bl draw_casa_patricio
	bl draw_casa_bob

	

	//---------------------------------------------------------------
	// Infinite Loopgi

InfLoop:
	b InfLoop
