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
    str x30, [sp, #-8]!
    mov x19, x3
    mov x20, x4
    movz x0, 0xDB, lsl #16  // Color: #DB83D3
	movk x0, 0x83D3, lsl #0
    bl draw_fill_semi_circle
    mov x0, x19
    mov x1, x20
    
// guardar x19

    
    ldr x30, [sp], #8
    ret
/*
    draw_gary: Dibuja a Gary parametrizado. Con centro (x,y) donde x = x25; y = x26.
*/
draw_gary:
    str lr, [sp, #-8]!
    stp x25, x26, [sp, #-16]!
    /* Coordenadas iniciales del centro: (x25,x26) = (18,467) */
    // Caracola.
    movz x0, #0xff, lsl #16
    movk x0, #0x8ea4, lsl #0
    add x3, x25, #12
    sub x4, x26, #13
    mov x5, #15
    bl draw_fill_circle

    // Dibujo el cuerpo de gary.
    movz x0, #0xf6, lsl #16
    movk x0, #0xff00, lsl #0
    sub x1, x25, #2
    mov x2, x26
    add x3, x25, #37
    add x4, x26, #2
    bl draw_rectangle

    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    mov x1, x25
    sub x2, x26, #3
    add x3, x25, #39
    sub x4, x26, #1
    bl draw_rectangle

    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    add x1, x25, #25
    sub x2, x26, #5
    add x3, x25, #41
    sub x4, x26, #4
    bl draw_rectangle

    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    add x1, x25, #27
    sub x2, x26, #6
    add x3, x25, #44
    sub x4, x26, #6
    bl draw_rectangle

    // Parte boca.
    movz x0, #0x5a, lsl #16
    movk x0, #0x0b15, lsl #0
    add x1, x25, #31
    sub x2, x26, #3
    add x3, x25, #35
    sub x4, x26, #1
    bl draw_rectangle

    add x1, x25, #32
    sub x2, x26, #5
    add x3, x25, #37
    sub x4, x26, #4
    bl draw_rectangle

    // Parte ojos.
    movz x0, #0x8b, lsl #16
    movk x0, #0xc7eb, lsl #0
    add x1, x25, #30
    sub x2, x26, #19
    add x3, x25, #32
    sub x4, x26, #6
    bl draw_line

    add x1, x25, #31
    sub x2, x26, #19
    add x3, x25, #33
    sub x4, x26, #6
    bl draw_line

    add x1, x25, #39
    sub x2, x26, #6
    add x3, x25, #41
    sub x4, x26, #19
    bl draw_line

    add x1, x25, #40
    sub x2, x26, #6
    add x3, x25, #42
    sub x4, x26, #19
    bl draw_line

    // OJOS.
    movz x0, #0xf6, lsl #16
    movk x0, #0xff00, lsl #0
    add x3, x25, #29
    sub x4, x26, #24
    mov x5, #5
    bl draw_fill_circle

    add x3, x25, #44
    sub x4, x26, #24
    bl draw_fill_circle

    // Iris.
    movz x0, #0xff, lsl #16
    movk x0, #0x8d31, lsl #0
    add x3, x25, #31
    sub x4, x26, #25
    mov x5, #3
    bl draw_fill_circle

    add x3, x25, #46
    sub x4, x26, #25
    mov x5, #3
    bl draw_fill_circle

    // Pupilas
    movz x0, #0x00, lsl #0
    add x1, x25, #31
    sub x2, x26, #26
    add x3, x25, #33
    sub x4, x26, #24
    bl draw_rectangle

    add x1, x25, #46
    sub x2, x26, #26
    add x3, x25, #48
    sub x4, x26, #24
    bl draw_rectangle

    ldp x25, x26, [sp], #16
    ldr lr, [sp], #8
    ret
