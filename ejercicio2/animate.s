    .globl draw_bubble
    .globl draw_medusa
    .global draw_gary


/* draw_bubble: dibuja una burbuja parametrizada, 
    con centro (x,y) donde x: x3; y: x4, y radio r: x5.
    ¡Cuidado!, No usar con radios muy grandes ni muy chicos (7<=r<=12).
*/
draw_bubble:   
    str x30, [sp, #-8]!

    movz x0, 0x1e, lsl #16  // Color: #1EABBC
	movk x0, 0xabbc, lsl #0
    bl draw_fill_circle
    movz x0, 0x74, lsl #16  // Color: #74DCDF
	movk x0, 0xdcdf, lsl #0 
    sub x5, x5, #2
    bl draw_fill_circle
    movz x0, 0xa2, lsl #16  // Color: #B9ECED
	movk x0, 0xcadf, lsl #0
    add x4, x4, #2
    sub x5, x5, #2 
    bl draw_fill_circle
    movz x0, 0xff, lsl #16  // Color: #ffffff
	movk x0, 0xffff, lsl #0
    sub x3, x3, #2
    sub x4, x4, #4
    sub x5, x5, #1 
    bl draw_fill_circle
    
    ldr x30, [sp], #8
    ret

draw_medusa:
    str x30, [sp, #-8]!        // Guardar el registro de retorno
    stp x19, x20, [sp, #-16]!  // Guardar x19 y x20 para preservar xc e yc

    // Dibujar el cuerpo (semicirculo relleno orientado hacia arriba)
    movz x0, 0xDB, lsl #16     // Color del cuerpo: #DB83D3
    movk x0, 0x83D3, lsl #0
    // x3 = xc, x4 = yc, x5 = radio ya estan configurados desde la llamada
    bl draw_fill_semi_circle

    // Guardar las coordenadas del centro (xc, yc) para los tentaculos
    mov x19, x3                // xc
    mov x20, x4                // yc

    // Dibujar tentaculo 1 (izquierda)
    movz x0, 0xFF, lsl #16     // Color de los tentaculos: #FF69B4
    movk x0, 0x69B4, lsl #0
    sub x1, x19, #15           // x_inicio = xc - 15
    add x2, x20, #10           // y_inicio = yc + 10
    sub x3, x19, #20           // x_fin = xc - 20
    add x4, x20, #30           // y_fin = yc + 30
    bl draw_line

    // Dibujar tentaculo 2 (centro)
    movz x0, 0xFF, lsl #16     // Color: #FF69B4
    movk x0, 0x69B4, lsl #0
    sub x1, x19, #10           // x_inicio = xc - 10
    add x2, x20, #10           // y_inicio = yc + 10
    sub x3, x19, #10           // x_fin = xc - 10
    add x4, x20, #30           // y_fin = yc + 30
    bl draw_line

    // Dibujar tentaculo 3 (derecha)
    movz x0, 0xFF, lsl #16     // Color: #FF69B4
    movk x0, 0x69B4, lsl #0
    sub x1, x19, #5            // x_inicio = xc - 5
    add x2, x20, #10           // y_inicio = yc + 10
    mov x3, x19                // x_fin = xc
    add x4, x20, #30           // y_fin = yc + 30
    bl draw_line

    ldp x19, x20, [sp], #16    // Restaurar x19 y x20
    ldr x30, [sp], #8          // Restaurar el registro de retorno
    ret

    
/*
    draw_gary: Dibuja a Gary parametrizado. Con centro (x,y) donde x = x17; y = x18.
*/
draw_gary:
    str lr, [sp, #-8]!
    stp x17, x18, [sp, #-16]!
    /* Coordenadas iniciales del centro: (x17,x18) = (18,467) */
    // Caracola.
    movz x0, #0xff, lsl #16
    movk x0, #0x8ea4, lsl #0
    add x3, x17, #12
    sub x4, x18, #13
    mov x5, #15
    bl draw_fill_circle

    // Dibujo el cuerpo de gary.
    movz x0, #0xf6, lsl #16
    movk x0, #0xff00, lsl #0
    sub x1, x17, #2
    mov x2, x18
    add x3, x17, #37
    add x4, x18, #2
    bl draw_rectangle

    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    mov x1, x17
    sub x2, x18, #3
    add x3, x17, #39
    sub x4, x18, #1
    bl draw_rectangle

    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    add x1, x17, #17
    sub x2, x18, #5
    add x3, x17, #41
    sub x4, x18, #4
    bl draw_rectangle

    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    add x1, x17, #27
    sub x2, x18, #6
    add x3, x17, #44
    sub x4, x18, #6
    bl draw_rectangle

    // Parte boca.
    movz x0, #0x5a, lsl #16
    movk x0, #0x0b15, lsl #0
    add x1, x17, #31
    sub x2, x18, #3
    add x3, x17, #35
    sub x4, x18, #1
    bl draw_rectangle

    add x1, x17, #32
    sub x2, x18, #5
    add x3, x17, #37
    sub x4, x18, #4
    bl draw_rectangle

    // Parte ojos.
    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    add x1, x17, #30
    sub x2, x18, #19
    add x3, x17, #32
    sub x4, x18, #6
    bl draw_line

    add x1, x17, #31
    sub x2, x18, #19
    add x3, x17, #33
    sub x4, x18, #6
    bl draw_line

    add x1, x17, #39
    sub x2, x18, #6
    add x3, x17, #41
    sub x4, x18, #19
    bl draw_line

    add x1, x17, #40
    sub x2, x18, #6
    add x3, x17, #42
    sub x4, x18, #19
    bl draw_line

    // OJOS.
    movz x0, #0xf6, lsl #16
    movk x0, #0xff00, lsl #0
    add x3, x17, #29
    sub x4, x18, #24
    mov x5, #5
    bl draw_fill_circle

    add x3, x17, #44
    sub x4, x18, #24
    bl draw_fill_circle

    // Iris.
    movz x0, #0xff, lsl #16
    movk x0, #0x8d31, lsl #0
    add x3, x17, #31
    sub x4, x18, #17
    mov x5, #3
    bl draw_fill_circle

    add x3, x17, #46
    sub x4, x18, #17
    mov x5, #3
    bl draw_fill_circle

    // Pupilas
    movz x0, #0x00, lsl #0
    add x1, x17, #31
    sub x2, x18, #26
    add x3, x17, #33
    sub x4, x18, #24
    bl draw_rectangle

    add x1, x17, #46
    sub x2, x18, #26
    add x3, x17, #48
    sub x4, x18, #24
    bl draw_rectangle

    ldp x17, x18, [sp], #16
    ldr lr, [sp], #8
    ret
