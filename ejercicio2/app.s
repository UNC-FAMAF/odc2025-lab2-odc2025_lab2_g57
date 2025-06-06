	.include "constants.s"
	.globl main


/*  MAIN DE EJEMPLO ANIMACION (GONZA)
	main:
		// x0 contiene la dirección base del framebuffer
		mov x20, x0		// Guarda la dirección base del framebuffer en x20
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

		// Actualizar la posición y de cada circulo
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
	//x0 contiene la direccion base del framebuffer
 	mov x28, x0	// Guarda la dirección base del framebuffer en x28
	
	//inicializo frame_counter (en x8)
	mov x8, #0
	
	// POSICIÓN INICAL GARY
	mov x25, #50
	mov x26, #465
restore_pos_burbujas:
	//POSICIONES INICIALES BURBUJAS
	mov x19, #212	//y_bubble1
	mov x20, #235	//y_bubble2
	mov x21, #240	//y_bubble3
	mov x22, #230	//y_bubble4
	mov x23, #220	//y_bubble5
	mov x24, #253	//y_bubble6




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
	bl draw_casa_bob


	//GARY
	bl draw_gary

	//BURBUJAS
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

	bl draw_casa_bob

	mov x3, #16
	mov x4, #430
	mov x5, #15
	//bl draw_medusa
	
	sub x19, x19, #8	//r=6
	sub x20, x20, #12	//r=7
	sub x21, x21, #16	//r=7
	sub x22, x22, #12	//r=8
	sub x23, x23, #16	//r=9
	sub x24, x24, #12	//r=10

	add x25, x25, #12

	// Reinicia posicion de burbujas
	cmp x19, xzr
	b.le restore_pos_burbujas


/*
	cmp x8, #100
	b.ge inf_loop
 	add x8, x8, #1	//actualiza contador
 */

	// DELAY
	mov x9, #20
	bl delay
	b animation_loop


	// INFINITE LOOP
	inf_loop:
		b inf_loop
		