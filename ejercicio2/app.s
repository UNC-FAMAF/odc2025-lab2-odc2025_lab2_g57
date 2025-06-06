.include "constants.s"
	.globl main


/*  MAIN DE EJEMPLO ANIMACION (GONZA)
	main:
		// x0 contiene la direccion base del framebuffer
		mov x20, x0		// Guarda la direccion base del framebuffer en x20
		mov x28, x20	// Configura x28 para las funciones de utils.s

		// Definir colores
		movz w25, 0xFF00, lsl 16  
		movk w25, 0x0000, lsl 0
		movz w26, 0xFFFF, lsl 16  
		movk w26, 0xFFFF, lsl 0

		// Definir posiciones iniciales
		mov x22, #200  // x del primer circulo
		mov x23, #220  // x del segundo circulo
		mov x24, #200  // x del tercer circulo
		mov x21, #400  // y inicial del primer circulo
		mov x27, #435  // y inicial del segundo circulo
		mov x19, #470  // y inicial del tercer circulo

	animation_loop:
		// Pintar el fondo 
		mov w0, w25   // color 
		mov x1, #0    // x_start
		mov x2, #0    // y_start
		mov x3, #639  // x_end
		mov x4, #479  // y_end
		bl draw_rectangle

		// Dibujar el primer circulo
		mov w0, w26   
		mov x3, x22   
		mov x4, x21   
		mov x5, #10   
		bl draw_fill_circle

		// Dibujar el segundo circulo
		mov w0, w26
		mov x3, x23
		mov x4, x27   
		mov x5, #10
		bl draw_fill_circle

		// Dibujar el tercer circulo
		mov w0, w26
		mov x3, x24
		mov x4, x19   
		mov x5, #10
		bl draw_fill_circle

		// Actualizar la posicion y de cada circulo
		sub x21, x21, #2  // Mover primer circulo hacia arriba
		cmp x21, #0
		b.ge no_reset1
		mov x21, #470     // Reiniciar y del primer circulo
	no_reset1:

		sub x27, x27, #2  // Mover segundo circulo hacia arriba
		cmp x27, #0
		b.ge no_reset2
		mov x27, #420     // Reiniciar y del segundo circulo
	no_reset2:

		sub x19, x19, #2  // Mover tercer circulo hacia arriba
		cmp x19, #0
		b.ge no_reset3
		mov x19, #370     // Reiniciar y del tercer circulo
	no_reset3:

		// Retardo para controlar la velocidad
		movz x8, #0x98, lsl 16   // Valor para el delay (10,000,000)
		movk x8, #0x9680, lsl 0
		bl delay

		b animation_loop  // Repetir la animacion
*/


main:
	// x0 contiene la direccion base del framebuffer
	mov x28, x0	// Guarda la direccion base del framebuffer en x28
	
	// POSICION INICIAL MEDUSA (solo se inicializa una vez)
	mov x25, #25	// x_medusa
	mov x26, #430	// y_medusa

	// POSICION INICIAL GARY (solo se inicializa una vez)
	mov x23, #18	// x_gary
	mov x24, #467	// y_gary

restore_pos:
	// POSICIONES INICIALES BURBUJAS
	mov x19, #200	// y_bubble1
	mov x20, #186	// y_bubble2
	mov x21, #178	// y_bubble3
	mov x22, #165	// y_bubble4

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
	mov x4, x19

	mov x5, #8
	bl draw_bubble
	mov x3, #615
	mov x4, x20
	mov x5, #7
	bl draw_bubble
	mov x3, #603
	mov x4, x21
	mov x5, #6
	bl draw_bubble
	mov x3, #607
	mov x4, x22
	mov x5, #9
	bl draw_bubble

	// DIBUJAR MEDUSA
	mov x3, x25
	mov x4, x26
	mov x5, #15
	bl draw_medusa

	// Guardar x25 y x26 antes de dibujar Gary
	stp x25, x26, [sp, #-16]!

	// DIBUJAR GARY
	mov x25, x23    // Pasar x_gary a x25 para draw_gary
	mov x26, x24    // Pasar y_gary a x26 para draw_gary
	bl draw_gary

	// Restaurar x25 y x26 despues de dibujar Gary
	ldp x25, x26, [sp], #16

	bl draw_casa_bob

	// ACTUALIZAR POSICIONES BURBUJAS
	sub x19, x19, #6
	sub x20, x20, #2
	sub x21, x21, #3
	sub x22, x22, #4

	// ACTUALIZAR POSICION MEDUSA
	add x25, x25, #2   // mover 2 en x
	sub x26, x26, #1   // mover -1 en y

	// ACTUALIZAR POSICION GARY
	add x23, x23, #2   // mover 2 en x hacia la derecha

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
	mov x9, #7
	bl delay

	b animation_loop
		