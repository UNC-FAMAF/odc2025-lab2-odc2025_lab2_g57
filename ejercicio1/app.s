	.include "constants.s"
	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x28, x0	// Guarda la dirección base del framebuffer en x28
	//---------------- CODE HERE ------------------------------------

	//bl background
	movz x0, 0xC7, lsl 16
	movk x0, 0x1585, lsl 00
	
	mov x1, #640
	mov x2, #0
	mov x3, #0
	mov x4, #480
	bl draw_line
	mov x1, #0
	mov x2, #0
	mov x3, #640
	mov x4, #480
	bl draw_line

	//bl background_gradient
	bl draw_sand
	bl draw_road
	bl draw_edificios_fondo
	bl draw_flower
	

	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
