.include "constants.s"
	.globl main


main:
	// x0 contiene la direccion base del framebuffer
	mov x28, x0	// Guarda la direccion base del framebuffer en x28
	
	// POSICION INICIAL MEDUSA (solo se inicializa una vez)
	mov x25, #25	// x_medusa
	mov x26, #430	// y_medusa

	// POSICION INICIAL GARY (solo se inicializa una vez)
	mov x17, #18	// x_gary
	mov x18, #467	// y_gary

restore_pos:
	// POSICIONES INICIALES BURBUJAS
	mov x19, #212	// y_bubble1
	mov x20, #235	// y_bubble2
	mov x21, #240	// y_bubble3
	mov x22, #230	// y_bubble4
	mov x23, #220	// y_bubble5
	mov x24, #253	// y_bubble6

animation_loop:
	// BACKGROUND ----------------------
	movz x0, 0x40, lsl #16  // #40d0cf
	movk x0, 0xD0CF, lsl #0
	movz x1, 0x17, lsl #16	// #176cd6
	movk x1, 0x6CD6, lsl #0
	bl background_gradient
	bl draw_flower
	//-----------------------------------

	bl draw_sand
	bl draw_road
	bl draw_odc_sign
	bl draw_edificios_fondo

	bl draw_casa_calamardo
	bl draw_casa_patricio

	// DIBUJAR BURBUJAS
	mov x3, #607
	mov x4, x24
	mov x5, #10
	bl draw_bubble
	mov x3, #612
	mov x4, x23
	mov x5, #9
	bl draw_bubble
	mov x3, #607
	mov x4, x22
	mov x5, #8
	bl draw_bubble
	mov x3, #604
	mov x4, x21
	mov x5, #7
	bl draw_bubble
	mov x3, #615
	mov x4, x20
	mov x5, #7
	bl draw_bubble
	mov x3, #611
	mov x4, x19
	mov x5, #6
	bl draw_bubble

	// DIBUJAR MEDUSA
	mov x3, x25
	mov x4, x26
	mov x5, #15
	bl draw_medusa


	// DIBUJAR GARY
	bl draw_gary

	bl draw_casa_bob

	// ACTUALIZAR POSICIONES BURBUJAS
	sub x19, x19, #8
	sub x20, x20, #12
	sub x21, x21, #16
	sub x22, x22, #12
	sub x23, x23, #16
	sub x24, x24, #12

	// ACTUALIZAR POSICION MEDUSA
	add x25, x25, #8   // mover 2 en x
	sub x26, x26, #4   // mover -1 en y

	// ACTUALIZAR POSICION GARY
	add x17, x17, #8   // mover 2 en x hacia la derecha

	// VERIFICAR REINICIO BURBUJAS
	cmp x19, #0
	b.le restore_pos

	// VERIFICAR REINICIO MEDUSA
	cmp x25, #639
	b.gt reset_medusa
	cmp x26, #15
	b.lt reset_medusa
	b check_gary

reset_medusa:
	mov x25, #25    // Reiniciar a la posicion inicial consistente
	mov x26, #430
	b check_gary

check_gary:
	// VERIFICAR REINICIO GARY
	cmp x23, #639   // Si x_gary > 639, reiniciar
	b.gt reset_gary
	b continue_animation

reset_gary:
	mov x23, #18    // Reiniciar x_gary a la posicion inicial
	b continue_animation

continue_animation:
	mov x9, #10
	bl delay

	b animation_loop
		