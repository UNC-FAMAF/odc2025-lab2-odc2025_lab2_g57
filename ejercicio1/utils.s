
    .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32
    .equ BYTES_PER_PIXEL,   4
    
    
    .globl draw_pixel
    .globl draw_line
    .globl draw_rectangle

    .globl abs
    

// ============================== Funciones de dibujo ===============================
    // RECORDAR QUE X0 = dirección base del framebuffer

    // Function: draw_pixel
    // Description: Dibuja un píxel en la pantalla en la posición (x, y) con un color dado.
    // Inputs:
    //  -x1: coordenada x
    //  -x2: coordenada y
    //  -x5: color
    // Outputs: ninguno
    // Temporales:
    // - x9
draw_pixel:
    mov x9, SCREEN_WIDTH
    mul x9, x2, x9
    add x9, x1, x9
    lsl x9, x9, #2
    add x9, x0, x9
    stur w5,[x9]
    ret


    // Function: draw_line
    // Description: Dibuja una línea en la pantalla dados sus extremos A = (x_0, y_0) y B = (x_1 ,y_1). Implementamos el algoritmo de Bresenham
    // Inputs:
    //  -x1: coordenada x_0
    //  -x2: coordenada y_0
    //  -x3: coordenada x_1
    //  -x4: coordenada y_1
    //  -x5: color
    // Outputs: ninguno
    // Temporales:
    // - x9: x1-x0 -> abs(x1-x0)
    // - x10: y1-y0 -> abs(y1-y0)
draw_line:
    sub sp, sp, #16
    stur lr, [sp]

    sub x9, x3, x1
    mov x7, x9
    bl abs
    mov x9, x7

    sub x10, x4, x2
    mov x7, x10
    bl abs
    mov x10, x7

    cmp x9, x10
    b.gt call_draw_h_line

    bl draw_v_line
    b end_draw_line

call_draw_h_line:
    b draw_h_line

end_draw_line:
    ldur lr, [sp]
    add sp, sp, #16
    ret



    // Function: draw_h_line
    // Description: Dibuja una línea en la pantalla dados sus extremos A = (x_0, y_0) y B = (x_1 ,y_1). Implementamos el algoritmo de Bresenham
    // Inputs:
    //  -x1: coordenada x_0
    //  -x2: coordenada y_0
    //  -x3: coordenada x_1
    //  -x4: coordenada y_1
    //  -x5: color
    // Outputs: ninguno
    // Temporales:
    //  - x9: dx
    //  - x10: dy
    //  - x11: dir
    //  - x12: variable que itera en el bucle for (y)
    //  - x13: variable p
    //  - x14: contador i
    //  -x15: aux
draw_h_line:
    sub sp, sp, #16
    stur x30, [sp]
    cmp x1, x3
    csel x1, x3, x1, gt
    csel x3, x1, x3, gt
    csel x2, x4, x2, gt
    csel x4, x2, x4, gt

    sub x9, x3, x1
    sub x10, x4, x2

    cmp x10, xzr
    csneg x10, x10, x10, lt
    mov x11, #1
    csneg x11, x11, x11, lt

    cbz x9, end_draw_h_line
    mov x12, x2
    lsl x13, x10, #1
    sub x13, x13, x9

    mov x14, xzr

loop_draw_h_line:
    cmp x14, x9
    b.gt end_draw_h_line

    add x1, x1, x14
    mov x2, x12
    bl draw_pixel
    
    cmp x13, #0
    b.lt skip_update_y_h_line

    add x12, x12, x11            // y += dir
    lsl x15, x9, #1              // 2*dx
    sub x13, x13, x15            // p -= 2*dx

skip_update_y_h_line:
    lsl x15, x10, #1
    add  x13, x13, x15            // p += 2*dy

end_draw_h_line:
    ldur lr,[sp]
    add sp, sp, #16
    ret



// ahora vertical line
    // Function: draw_v_line
    // Description: Dibuja una línea en la pantalla dados sus extremos A = (x_0, y_0) y B = (x_1 ,y_1). Implementamos el algoritmo de Bresenham
    // Inputs:
    //  -x1: coordenada x_0
    //  -x2: coordenada y_0
    //  -x3: coordenada x_1
    //  -x4: coordenada y_1
    //  -x5: color
    // Outputs: ninguno
    // Temporales:
    //  - x9: dx
    //  - x10: dy
    //  - x11: dir
    //  - x12: variable que itera en el bucle for (x)
    //  - x13: variable p
    //  - x14: contador i
    //  - x15: aux
draw_v_line:
    sub sp, sp, #16
    stur x30, [sp]
    cmp x2, x4
    csel x1, x3, x1, gt
    csel x3, x1, x3, gt
    csel x2, x4, x2, gt
    csel x4, x2, x4, gt

    sub x9, x3, x1
    sub x10, x4, x2

    cmp x9, xzr
    csneg x9, x9, x9, lt
    mov x11, #1
    csneg x11, x11, x11, lt

    cbz x10, end_draw_v_line
    mov x12, x1
    lsl x13, x9, #1
    sub x13, x13, x10

    mov x14, xzr

loop_draw_v_line:
    cmp x14, x10
    b.gt end_draw_v_line

    mov x1, x12
    add x2, x2, x14
    bl draw_pixel
    
    cmp x13, #0
    b.lt skip_update_y_v_line

    add x12, x12, x11            // y += dir
    lsl x15, x10, #1           // 2*dy
    sub x13, x13, x15           // p -= 2*dy

skip_update_y_v_line:
    lsl x15, x9, #1
    add  x13, x13, x15            // p += 2*dy

end_draw_v_line:
    ldur x30,[sp]
    add sp, sp, #16
    ret




    
    







// ============================== Funciones matemáticas ========================
    // Function: abs
    // Description: Calcula el valor absoluto del registro x
    // Inputs:
    //  -x7: número signado
    // Outputs: ninguno
    // Temporales:
    // - x9
abs:
    cmp x7, #0           // Compara x7 con 0, actualiza flags
    neg x9, x0           // x9 = -x7 (por si x7 < 0)
    csel x7, x7, x9, GE  // si x7 >= 0 -> x7 = x7, si no -> x7 = -x7
    ret

    