.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.globl main

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
