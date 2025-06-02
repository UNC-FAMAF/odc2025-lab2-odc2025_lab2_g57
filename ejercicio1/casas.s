#include "constants.s"

.globl draw_casa_calamardo

draw_casa_calamardo:
    str x30, [sp, #-8]!

    // Parte principal
    movz x0, 0x1e, lsl #16  // Color: #1E3253
	movk x0, 0x3253, lsl #0
	
	mov x1, #248             // x0: coordenada x inicial
	mov x2, #106             // y0: coordenada y inicial 
	mov x3, #133             // ux: vector u 
	mov x4, #0               // uy
	mov x5, #-20              // vx: vector v 
	mov x6, #284             // vy
	bl draw_parallelogram

    movz x0, 0x17, lsl #16  // Color: #172740
	movk x0, 0x2740, lsl #0
    mov x1, #314             // x0: coordenada x inicial
	mov x2, #106             // y0: coordenada y inicial 
	mov x3, #67             // ux: vector u 
	mov x4, #0               // uy
	mov x5, #20              // vx: vector v 
	mov x6, #284             // vy
	bl draw_parallelogram


    // Orejas
    // derecha
    movz x0, 0x17, lsl #16  // Color: #172740
	movk x0, 0x2740, lsl #0
    mov x1, #378
    mov x2, #206
    mov x3, #413
    mov x4, #289
    bl draw_rectangle

    // izquierda
    movz x0, 0x1e, lsl #16  // Color: #1E3253
	movk x0, 0x3253, lsl #0
    mov x1, #215
    mov x2, #206
    mov x3, #250
    mov x4, #289
    bl draw_rectangle


    // Ojos
    // izquierdo
    movz x0, 0x45, lsl #16  // Color: #456BB9
	movk x0, 0x6BB9, lsl #0
    mov x3, #275
    mov x4, #224
    mov x5, #20
    bl draw_fill_circle

    movz x0, 0x5E, lsl #16  // Color: #5EB5E7
	movk x0, 0xB5E7, lsl #0
    mov x3, #275
    mov x4, #224
    mov x5, #10
    bl draw_fill_circle

    //derecho
    movz x0, 0x45, lsl #16  // Color: #456BB9
	movk x0, 0x6BB9, lsl #0
    mov x3, #353
    mov x4, #224
    mov x5, #20
    bl draw_fill_circle

    movz x0, 0x5E, lsl #16  // Color: #5EB5E7
	movk x0, 0xB5E7, lsl #0
    mov x3, #353
    mov x4, #224
    mov x5, #10
    bl draw_fill_circle


    // Cejas 
    movz x0, 0x10, lsl #16  // Color: #101C2D <- BORDES
	movk x0, 0x1C2D, lsl #0
    mov x1, #235
    mov x2, #196
    mov x3, #393
    mov x4, #199
    bl draw_rectangle

    mov x1, #235
    mov x2, #174
    mov x3, #393
    mov x4, #177
    bl draw_rectangle

    mov x1, #235
    mov x2, #174
    mov x3, #238
    mov x4, #199
    bl draw_rectangle

    mov x1, #390
    mov x2, #174
    mov x3, #393
    mov x4, #199
    bl draw_rectangle

    // Detalles
    movz x0, 0x1e, lsl #16  // Color: #1E3253
	movk x0, 0x3253, lsl #0
    mov x1, #239
    mov x2, #178
    mov x3, #241
    mov x4, #195
    bl draw_rectangle

    movz x0, 0x17, lsl #16  // Color: #172740
	movk x0, 0x2740, lsl #0
    mov x1, #387
    mov x2, #178
    mov x3, #389
    mov x4, #195
    bl draw_rectangle

    // Nariz
    movz x0, 0x10, lsl #16  // Color: #101C2D <- BORDES
	movk x0, 0x1C2D, lsl #0
    mov x1, #301
    mov x2, #200
    mov x3, #326
    mov x4, #203
    bl draw_rectangle

    mov x1, #294
    mov x2, #294
    mov x3, #334
    mov x4, #297
    bl draw_rectangle

    mov x1, #292         // x0 = xA
    mov x2, #297         // y0 = yA
    mov x3, #3           // ux = xB - xA
    mov x4, #0           // uy = yB - yA
    mov x5, #9           // vx = xD - xA
    mov x6, #-97         // vy = yD - yA
    bl draw_parallelogram

    mov x1, #323
    mov x2, #200
    mov x3, #3
    mov x4, #0
    mov x5, #9
    mov x6, #97
    bl draw_parallelogram

    // Puerta
    movz x0, 0xB4, lsl #16  // Color: #B45716
	movk x0, 0x5716, lsl #0
    mov x1, #289
    mov x2, #341
    mov x3, #339
    mov x4, #390
    bl draw_rectangle

    mov x3, #314
    mov x4, #346
    mov x5, #25
    bl draw_fill_semi_circle

    movz x0, 0xCD, lsl #16  // Color: #CD7F32 <- picaporte
	movk x0, 0x7F32, lsl #0
    mov x1, #332
    mov x2, #367
    mov x3, #335
    mov x4, #370
    bl draw_rectangle

    movz x0, 0x44, lsl #16  // Color: #441609 <- DETALLES
	movk x0, 0x1609, lsl #0
    mov x1, #313
    mov x2, #321
    mov x3, #315
    mov x4, #390
    bl draw_rectangle

    mov x1, #300
    mov x2, #325
    mov x3, #302
    mov x4, #390
    bl draw_rectangle

    mov x1, #326
    mov x2, #325
    mov x3, #328
    mov x4, #390
    bl draw_rectangle

    
    ldr x30, [sp], #8
    ret
    