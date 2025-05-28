    .include "constants.s"

    .globl draw_pixel
    .globl draw_line
    .globl draw_rectangle
    .globl draw_semi_circle
    .globl abs
    

// ============================== Funciones de dibujo ===============================
    // RECORDAR QUE X28 = dirección base del framebuffer

    // Function: draw_pixel
    // Description: Dibuja un píxel en la pantalla en la posición (x, y) con un color dado.
    // Inputs:
    //  -x0: color
    //  -x1: coordenada x
    //  -x2: coordenada y
    // Outputs: ninguno
    // Registros modificados por esta función:
    // - x15: dirección de la posición (x,y) calculada
draw_pixel:
    // offset = Dirección de inicio del framebuffer + 4 * [x + (y * 640)]
    mov x15, SCREEN_WIDTH
    mul x15, x2, x15
    add x15, x1, x15
    lsl x15, x15, #2
    add x15, x28, x15
    str w0, [x15]
    ret


    // Function: draw_line
    // Description: Dibuja una línea en la pantalla dados sus extremos A = (x_0, y_0) y B = (x_1 ,y_1). Implementamos el algoritmo de Bresenham
    // Inputs:
    //  -x0: color
    //  -x1: coordenada x_0
    //  -x2: coordenada y_0
    //  -x3: coordenada x_1
    //  -x4: coordenada y_1
    // Outputs: ninguno
    // Registros usados:
    // - x7: usada para pasar argumento a abs y recibir su resultado
    // - x9: abs(x1-x0) = abs(dx)
    // - x10: abs(y1-y0) = abs(dy)

draw_line:
    // Guardo LR y FP. Como esta función llama a otras (draw_h_line, draw_v_line, abs), lr debe guardarse. 
    stp x29, x30, [sp,-16]!

    mov x29, sp

    // Calcular abs_dx = abs(x_1 - x_0)
    sub x9, x3, x1
    mov x7, x9
    bl abs
    mov x9, x7     // x9 = abs(dx)

     // Calcular abs_dy = abs(y_1 - y_0)
    sub x10, x4, x2
    mov x7, x10
    bl abs
    mov x10, x7    // x10 = abs(dy)

    // Los argumentos para draw_h_line y draw_v_line (x0-x4) siguen intactos. Luego para los cálculos de abs(dx) y abs(dy) uso:
    // x7, x9, x10, que no se solapan con x0-x4.

    // Acá decido qué rutina para dibujar la línea uso.
    cmp x9, x10     //  comparo abs(dx)  y abs(dy)
    b.gt ._call_draw_h_line

    // abs(dx) <= abs(dy): Línea predominantemente vertical
    bl draw_v_line
    b ._end_draw_line

._call_draw_h_line:
    // abs(dx) > abs(dy): Línea predominantemente horizontal
    bl draw_h_line

._end_draw_line:
    ldp x29, x30, [sp], #16     // Restaura FP y LR.
    ret



    // Function: draw_h_line
    // Description: Dibuja una línea predominantemente horizontal. abs(dx) > abs(dy)
    // Inputs:
    //  -x0: color (copia de x0)
    //  -x1: coordenada x_0 (x_start_orig)
    //  -x2: coordenada y_0 (y_start_orig)
    //  -x3: coordenada x_1 (x_end_orig)
    //  -x4: coordenada y_1 (y_end_orig)
    // Outputs: ninguno
    // Callee-saved registers usados y que deben ser preservados::
    //  x19: color (copia de x0)
    //  x20: x_current (coordenada x que se incrementa)
    //  x21: y_current (coordenada y que se actualiza con y_step)
    //  x22: x_end_final (coordenada x final del bucle)
    //  x23: p (parámetro de decisión del Algoritmo Bresenham)
    //  x24: const_2_dy_abs (2 * abs(dy))
    //  x25: const_2_dx (2 * dx, donde dx es siempre positivo)
    //  x26: y_step (1 o -1)
    //  (x28 es global para framebuffer, nunca lo voy a tocar)
draw_h_line:
    // guardo en la pila los registros callee-saved
    stp x29, x30, [sp, #-80]!

    mov x29, sp

    stp x19, x20, [sp, #16]
    stp x21, x22, [sp, #32]
    stp x23, x24, [sp, #48]
    stp x25, x26, [sp, #64] 


    mov x19, x0                     // x19 = color_arg (copia de x0)

    // Determinar (x_current, y_current) de inicio y x_end_final.
    // Asegurar que x_current itera de x_menor a x_mayor.
    cmp x1, x3                      // if (x_start_orig > x_end_orig)
    mov x20, x1                     // x_current = x_start_orig por defecto
    mov x21, x2                     // y_current = y_start_orig por defecto
    mov x22, x3                     // x_end_final = x_end_orig por defecto
    mov x6, x4                      // temp_y_end_orig = y_end_orig (para dy_orig si no hay swap)
    b.le ._h_points_ordered         // Si x_start_orig <= x_end_orig, ya están ordenados

    // Hay que intercambiar los puntos de inicio y fin para la iteración
    mov x20, x3                     // x_current = x_end_orig (que es menor)
    mov x21, x4                     // y_current = y_end_orig
    mov x22, x1                     // x_end_final = x_start_orig (que es mayor)
    mov x6, x2                      // temp_y_end_orig = y_start_orig (para dy_orig si hay swap)
._h_points_ordered:
    // Ahora: x20 es x_start_iter, x21 es y_start_iter, x22 es x_end_iter. x_current comenzará en x20.
    // x6 tiene la y_final correspondiente a x_end_iter (x22).

    // Calculo constantes de Bresenham
    // dx = x_end_final - x_current (siempre positivo o cero)
    sub x7, x22, x20                // x7 = dx (diferencia en x, ya ordenado)
    // dy_orig = y_end_iter - y_start_iter
    sub x8, x6, x21                 // x8 = dy_orig (diferencia en y, puede ser negativa)

    mov x26, #1                     // x26 (y_step) = 1 por defecto
    cmp x8, xzr                     // if (dy_orig < 0)
    b.ge ._h_dy_positive
    neg x26, x26                    // y_step = -1
    neg x8, x8                      // dy_abs = abs(dy_orig)
._h_dy_positive:
    // x8 ahora contiene abs(dy_orig)

    lsl x24, x8, #1                 // x24 (const_2_dy_abs) = 2 * abs(dy_orig)
    lsl x25, x7, #1                 // x25 (const_2_dx) = 2 * dx (x7 tiene dx)

    // p = 2*dy_abs - dx
    sub x23, x24, x7                // x23 (p) = 2*dy_abs - dx

    // Bucle de dibujo
._h_loop:
    // Dibujar pixel(x_current, y_current, color)
    // Argumentos para draw_pixel: x0=color, x1=x_coord, x2=y_coord
    mov x0, x19                     // x0 = color_arg
    mov x1, x20                     // x1 = x_current
    mov x2, x21                     // x2 = y_current
    bl draw_pixel                   // Llama a draw_pixel.

    // Comprobar si hemos llegado al final
    cmp x20, x22                    // if (x_current == x_end_final)
    b.eq ._h_end_loop               // Si es igual, último píxel dibujado, terminé.

    // Actualizar para el siguiente píxel
    // if (p >= 0)
    cmp x23, xzr
    b.lt ._h_p_negative
    add x21, x21, x26               // y_current += y_step
    sub x23, x23, x25               // p -= 2*dx (const_2_dx)
._h_p_negative:
    add x23, x23, x24               // p += 2*dy_abs (const_2_dy_abs)
    add x20, x20, #1                // x_current++
    b ._h_loop

._h_end_loop:
    ldp x19, x20, [sp, #16]
    ldp x21, x22, [sp, #32]
    ldp x23, x24, [sp, #48]
    ldp x25, x26, [sp, #64]

    ldp x29, x30, [sp], #80

    ret


// Function: draw_v_line
// Description: Dibuja una línea predominantemente vertical. abs(dy) >= abs(dx).
// Inputs:
//  -x0: color
//  -x1: x_start_orig
//  -x2: y_start_orig
//  -x3: x_end_orig
//  -x4: y_end_orig
// Outputs: ninguno
// Callee-saved registers usados y que deben ser preservados.
//  x19: color_arg (copia de x0)
//  x20: x_current (coordenada x que se actualiza con x_step)
//  x21: y_current (coordenada y que se incrementa)
//  x22: y_end_final (coordenada y final del bucle)
//  x23: p (parámetro de decisión de Bresenham)
//  x24: const_2_dx_abs (2 * abs(dx_orig))
//  x25: const_2_dy (2 * dy, donde dy es siempre positivo)
//  x26: x_step (1 o -1)
draw_v_line:
    stp x29, x30, [sp, #-80]!

    mov x29, sp

    stp x19, x20, [sp, #16]
    stp x21, x22, [sp, #32]
    stp x23, x24, [sp, #48]
    stp x25, x26, [sp, #64] 

    // Copio los argumentos a los registros caller-saved y los ordeno.
    mov x19, x0                     // x19 = color_arg

    // Determinar (x_current, y_current) de inicio y y_end_final.
    // Asegurar que y_current itera de y_menor a y_mayor.
    cmp x2, x4                      // if (y_start_orig > y_end_orig)
    mov x20, x1                     // x_current = x_start_orig por defecto
    mov x21, x2                     // y_current = y_start_orig por defecto
    mov x22, x4                     // y_end_final = y_end_orig por defecto
    mov x6, x3                      // temp_x_end_orig = x_end_orig (para dx_orig si no hay swap)
    b.le ._v_points_ordered

    // Intercambiar para la iteración
    mov x20, x3                     // x_current = x_end_orig
    mov x21, x4                     // y_current = y_end_orig (que es menor)
    mov x22, x2                     // y_end_final = y_start_orig (que es mayor)
    mov x6, x1                      // temp_x_end_orig = x_start_orig (para dx_orig si hay swap)
._v_points_ordered:
    // Ahora: x20 es x_start_iter, x21 es y_start_iter, x22 es y_end_iter. y_current comenzará en x21.
    // x6 tiene la x_final correspondiente a y_end_iter (x22).

    // Calculo constantes de Bresenham
    // dy = y_end_final - y_current (siempre positivo o cero)
    sub x7, x22, x21                // x7 = dy
    // dx_orig = x_end_iter - x_start_iter
    sub x8, x6, x20                 // x8 = dx_orig

    mov x26, #1                     // x26 (x_step) = 1
    cmp x8, xzr                     // if (dx_orig < 0)
    b.ge ._v_dx_positive
    neg x26, x26                    // x_step = -1
    neg x8, x8                      // dx_abs = abs(dx_orig)
._v_dx_positive:
    // x8 ahora contiene abs(dx_orig)

    lsl x24, x8, #1                 // x24 (const_2_dx_abs) = 2 * abs(dx_orig)
    lsl x25, x7, #1                 // x25 (const_2_dy) = 2 * dy

    // p = 2*dx_abs - dy
    sub x23, x24, x7                // x23 (p) = 2*dx_abs - dy

    // Bucle de dibujo
._v_loop:
    // Dibujar pixel(x_current, y_current, color)
    mov x0, x19                     // x0 = color
    mov x1, x20                     // x1 = x_current
    mov x2, x21                     // x2 = y_current
    bl draw_pixel

    // Comprobar si hemos llegado al final
    cmp x21, x22                    // if (y_current == y_end_final)
    b.eq ._v_end_loop

    // Actualizar para el siguiente píxel
    cmp x23, xzr                    // if (p >= 0)
    b.lt ._v_p_negative
    add x20, x20, x26               // x_current += x_step
    sub x23, x23, x25               // p -= 2*dy
._v_p_negative:
    add x23, x23, x24               // p += 2*dx_abs
    add x21, x21, #1                // y_current++
    b ._v_loop

._v_end_loop:
    ldp x19, x20, [sp, #16]
    ldp x21, x22, [sp, #32]
    ldp x23, x24, [sp, #48]
    ldp x25, x26, [sp, #64]

    ldp x29, x30, [sp], #80

    ret

/*  Function: draw_parallelogram.
   Description: Dibuja un paralelogramo tomando como vertices (x0,y0), (x1,y1) y (x2,y2), calculando el restante
                y dibujando las aristas con draw_line.
   Inputs: x1, x2  = coordenadas (X0,Y0) del primer vertice.
           x3, x4  = coordenadas (X1,Y1) del segundo vertice.
           x6, x7  = coordenadas (X2,Y2) del tercer vertice.
           x0, x11, x12, x13 ,x14 = color de las lineas. (=====CONSULTAR=====)
   Outputs: None.
   Temporales: x9, x10 =  coordenadas (X3,Y3) del tercer vertice.
*/
draw_parallelogram:
   sub sp, sp, #16
   stur lr, [sp]


   // Calcular coordenada X del cuarto vertice. X3 = X0 + (X2 - X1).
   sub x9, x6, x3
   add x9, x1, x9


   // Calcular coordenada Y del cuarto vertice. Y3 = Y0 + (Y2 - Y1).
   sub x10, x7, x4
   add x10, x10, x2


   // Primer arista. P1 -> P2
   mov x1, x1
   mov x2, x2
   mov x3, x3
   mov x4, x4
   mov x0, x11     // x11 Contiene el color de la arista a dibujar.
   bl draw_line


   // Seguna arista. P2 -> P3
   mov x1, x3
   mov x2, x4
   mov x3, x6
   mov x4, x7
   mov x0, x12
   bl draw_line


   // Tercera arista. P3 -> P4
   mov x1, x6
   mov x2, x7
   mov x3, x15
   mov x4, x9
   mov x0, x13
   bl draw_line


   // Cuarta arista. P4 -> P1
   mov x1, x15
   mov x2, x9
   mov x3, x1
   mov x4, x2
   mov x0, x14
   bl draw_line


   ldur lr, [sp]
   add sp, sp, #16
   ret


// Function: draw_rectangle
// Description: Dibuja un rectangulo en la pantalla dadop dos vertices opuestos: (x0, y0) y (x1, y1).
// Inputs:
//  -x0: color
//  -x1: coordenada x del vertice superior izquierdo
//  -x2: coordenada y del vertice superior izquierdo
//  -x3: coordenada x del vertice inferior derecho
//  -x4: coordenada y del vertice inferior derecho
// Outputs: no hay
// Registros modificados: ninguno aparte de los temporales

draw_rectangle:
    // Guardar los registros y reservar espacio en la pila
    sub sp, sp, #48         // Reservar 48 bytes: 16 para x29/x30, 32 para x1-x4
    stp x29, x30, [sp, #0]  // Guardar FP y LR
    mov x29, sp             // Actualizar FP
    stp x1, x2, [sp, #16]   // Guardar x0_start y y0_start
    stp x3, x4, [sp, #32]   // Guardar x1_end y y1_end

    // Dibujar linea superior: de (x0_start, y0_start) a (x1_end, y0_start)
    ldr x1, [x29, #16]      // x1 = x0_start
    ldr x2, [x29, #24]      // x2 = y0_start
    ldr x3, [x29, #32]      // x3 = x1_end
    ldr x4, [x29, #24]      // x4 = y0_start
    bl draw_line

    // Dibujar linea derecha: de (x1_end, y0_start) a (x1_end, y1_end)
    ldr x1, [x29, #32]      // x1 = x1_end
    ldr x2, [x29, #24]      // x2 = y0_start
    ldr x3, [x29, #32]      // x3 = x1_end
    ldr x4, [x29, #40]      // x4 = y1_end
    bl draw_line

    // Dibujar linea inferior: de (x1_end, y1_end) a (x0_start, y1_end)
    ldr x1, [x29, #32]      // x1 = x1_end
    ldr x2, [x29, #40]      // x2 = y1_end
    ldr x3, [x29, #16]      // x3 = x0_start
    ldr x4, [x29, #40]      // x4 = y1_end
    bl draw_line

    // Dibujar linea izquierda: de (x0_start, y1_end) a (x0_start, y0_start)
    ldr x1, [x29, #16]      // x1 = x0_start
    ldr x2, [x29, #40]      // x2 = y1_end
    ldr x3, [x29, #16]      // x3 = x0_start
    ldr x4, [x29, #24]      // x4 = y0_start
    bl draw_line

    // Restaurar registros y pila
    ldp x29, x30, [sp, #0]  // Restaurar FP y LR
    add sp, sp, #48         // Liberar espacio en la pila
    ret



// Function: draw_semi_circle
// Description: Dibuja un semicrculo en la pantalla dado su centro (x0, y0), radio r, y direccion.
// Inputs:
//  -x0: color
//  -x1: coordenada x del centro
//  -x2: coordenada y del centro
//  -x3: radio r
//  -x4: direccion (0: arriba, 1: abajo, 2: izquierda, 3: derecha)
// Outputs: no hay
// Registros modificados: ninguno aparte de los temporales

draw_semi_circle:
    // Guardar los registros y reservar espacio en la pila
    sub sp, sp, #64         // Reservar 64 bytes: 16 para x29/x30, 48 para temporales
    stp x29, x30, [sp, #0]  // Guardar FP y LR
    mov x29, sp             // Actualizar FP
    stp x19, x20, [sp, #16] // Guardar x19, x20
    stp x21, x22, [sp, #32] // Guardar x21, x22
    stp x23, x24, [sp, #48] // Guardar x23, x24

    // Copiar los parametros a registros temporales
    mov x19, x0             // x19 = color
    mov x20, x1             // x20 = x_center
    mov x21, x2             // x21 = y_center
    mov x22, x3             // x22 = radius
    mov x23, x4             // x23 = direction

    // Inicializar variables para el algoritmo de Bresenham
    mov x24, #0             // x = 0
    mov x25, x22            // y = radius
    sub x26, xzr, x22       // d = -radius

    // Bucle principal del algoritmo de Bresenham
._semi_circle_loop:
    // Dibujar los pixeles segun la direccion
    cmp x23, #0             // Direccion: arriba
    b.eq ._draw_upper
    cmp x23, #1             // Direccion: abajo
    b.eq ._draw_lower
    cmp x23, #2             // Direccion: izquierda
    b.eq ._draw_left
    cmp x23, #3             // Direccion: derecha
    b.eq ._draw_right
    b ._end_semi_circle     // Direccion no valida, salir

._draw_upper:
    // Dibujar los pixeles en la parte superior
    mov x0, x19             // color
    add x1, x20, x24        // x_center + x
    sub x2, x21, x25        // y_center - y
    bl draw_pixel
    mov x0, x19
    sub x1, x20, x24        // x_center - x
    sub x2, x21, x25        // y_center - y
    bl draw_pixel
    b ._update_loop

._draw_lower:
    // Dibujar los pixeles en la parte inferior
    mov x0, x19
    add x1, x20, x24
    add x2, x21, x25
    bl draw_pixel
    mov x0, x19
    sub x1, x20, x24
    add x2, x21, x25
    bl draw_pixel
    b ._update_loop

._draw_left:
    // Dibujar los pixeles en la parte izquierda
    mov x0, x19
    sub x1, x20, x25
    add x2, x21, x24
    bl draw_pixel
    mov x0, x19
    sub x1, x20, x25
    sub x2, x21, x24
    bl draw_pixel
    b ._update_loop

._draw_right:
    // Dibujar los pixeles en la parte derecha
    mov x0, x19
    add x1, x20, x25
    add x2, x21, x24
    bl draw_pixel
    mov x0, x19
    add x1, x20, x25
    sub x2, x21, x24
    bl draw_pixel
    b ._update_loop

._update_loop:
    // Actualizar las variables de Bresenham
    add x26, x26, x24, lsl #1
    add x26, x26, #1
    add x24, x24, #1
    cmp x26, #0
    b.lt ._skip_y_decrement
    sub x25, x25, #1
    sub x26, x26, x25, lsl #1
    sub x26, x26, #1
._skip_y_decrement:
    cmp x24, x25
    b.le ._semi_circle_loop

._end_semi_circle:
    // Restaurar los registros y pila
    ldp x19, x20, [sp, #16]
    ldp x21, x22, [sp, #32]
    ldp x23, x24, [sp, #48]
    ldp x29, x30, [sp, #0]
    add sp, sp, #64
    ret


// ============================== Funciones matemáticas ========================
    // Function: abs
    // Description: Calcula el valor absoluto del registro x
    // Inputs:
    //  -x7: número signado
    // Outputs: ninguno
    // Registros usados:
    // - x19: tal vez sería conveniente usar un registro caller-saved para esta función tan simple. Sería más rápido que cargar x19 a la pila y descargarla luego. Tenia miedo de olvidarme de guardarla cuando llame abs. TODO
abs:
    str x19, [sp, -8]!
    cmp x7, #0           // Compara x7 con 0, actualiza flags
    neg x19, x7           // x19 = -x7 (por si x7 < 0)
    csel x7, x7, x19, GE  // si x7 >= 0 -> x7 = x7, si no -> x7 = -x7
    ldr x19, [sp], 8
    ret

    