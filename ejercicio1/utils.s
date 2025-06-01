    .include "constants.s"

    .globl draw_pixel
    .globl draw_line
    .globl draw_rectangle
    .globl draw_semi_circle
    .globl draw_circle
    .globl draw_fill_circle
    .globl draw_parallelogram
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
    // Dirección del pixel (x,y) = Dirección de inicio del framebuffer + 4 * [x + (y * 640)]
    mov x15, SCREEN_WIDTH
    mul x15, x2, x15
    add x15, x1, x15
    lsl x15, x15, #2
    add x15, x28, x15
    str w0, [x15]
    ret


    // Function: draw_line
    // Description: Dibuja una línea en la pantalla dados sus extremos A = (x_0, y_0) y B = (x_1 ,y_1). 
    // Implementamos el algoritmo de Bresenham. https://zingl.github.io/bresenham.html
    // Inputs (no preservados):
    //  -x0: color
    //  -x1: coordenada x_0
    //  -x2: coordenada y_0
    //  -x3: coordenada x_1
    //  -x4: coordenada y_1
    // Outputs: ninguno
    // Registros usados:
    // - x7: usada para pasar argumento a abs y recibir su resultado  (no preservado)
    // - x19: dx
    // - x20: dy
    // - x21: err
    // - x22: sx
    // - x23: sy
    // - x24: e2


draw_line:
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    str x30, [sp, #-8]!

    // Hago los cálculos iniciales.
    sub x7, x3, x1
    bl abs
    mov x19, x7

    sub x7, x4, x2
    bl abs
    mov x20, x7
    neg x20, x20

    add x21, x19, x20

    // Calculo la dirección del paso en x e y.
    mov x22, #1
    cmp x1, x3
    csneg x22, x22, x22, lt

    mov x23, #1
    cmp x2, x4
    csneg x23, x23, x23, lt

._loop_start:
    bl draw_pixel
    
    // if (x_0==x_1 && y_0==y_1) break;
    // Para A && B, primero comprobamos A. Si A es falso, el AND es falso.
    // Si A es verdadero, entonces comprobamos B.
    cmp x1, x3
    b.ne ._continue_loop

    cmp x2, x4
    b.eq ._loop_end

._continue_loop:        // continuo si not(x_0 == x_1 && y_0==y_1)
    lsl x24, x21, #1

    // if (e2 >= dy) { err += dy; x0 += sx; }
    // Si e2 < dx salta el if.
    cmp x24, x20
    b.lt ._skip_x_if

    add x21, x21, x20
    add x1, x1, x22

._skip_x_if:
    cmp x24, x19
    b.gt ._skip_y_if

    add x21, x21, x19
    add x2, x2, x23

._skip_y_if:
    b ._loop_start

._loop_end:
    ldr x30, [sp], #8
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16

    ret

/*  Function: draw_circle.
   Description: Dibuja un circulo (sin relleno) dadas sus coordenadas del centro (x,y), un radio y un color. 
                'Midpoint Circle Algorithm'
   Inputs:  x3, x4 = xc, yc (coordenadas del centro del circulo)   
            x0 = color del circulo
            x5 = radio del circulo
   Outputs: ninguno
   Temporales: x9, x10 = x, y (coordenadas para dibujar) 
               x11 = p (criterio de seleccion)  
               x12, x13 (auxiliares)
*/
draw_circle:
    str lr, [sp, #-8]!

    mov x9, xzr                 // x=0
    sub x10, xzr, x5            // y=-r
    sub x11, xzr, x5            // p=-r

    ._loop:
        sub x12, xzr, x10
        cmp x9, x12
        b.ge ._end          // if x>=-y --> fin del loop (equivale a un while x<-y)

        cmp x11, xzr
        b.gt ._if
        b ._else            // if p>0, else;

        ._if:
            add x10, x10, #1
            add x13, x9, x10
            lsl x13, x13, #1
            add x13, x13, #1
            add x11, x11, x13           // p += 2*(x+y)+1
            b ._draw

        ._else:
            lsl x13, x9, #1
            add x13, x13, #1      
            add x11, x11, x13           // p += 2*x+1
            b ._draw

        ._draw:
            // en x0 se almacena el color del circulo, por lo tanto tambien se usa para cada pixel

            // pinto pixel en (xc+x, yc+y)
            add x1, x3, x9
            add x2, x4, x10
            bl draw_pixel

            // pinto pixel en (xc-x, yc+y)
            sub x1, x3, x9
            add x2, x4, x10
            bl draw_pixel

            // pinto pixel en (xc+x, yc-y)
            add x1, x3, x9
            sub x2, x4, x10
            bl draw_pixel

            // pinto pixel en (xc-x, yc-y)
            sub x1, x3, x9
            sub x2, x4, x10
            bl draw_pixel

            // pinto pixel en (xc+y, yc+x)
            add x1, x3, x10
            add x2, x4, x9
            bl draw_pixel

            // pinto pixel en (xc+y, yc-x)
            add x1, x3, x10
            sub x2, x4, x9
            bl draw_pixel

            // pinto pixel en (xc-y, yc+x)
            sub x1, x3, x10
            add x2, x4, x9
            bl draw_pixel

            // pinto pixel en (xc-y, yc-x)
            sub x1, x3, x10
            sub x2, x4, x9
            bl draw_pixel

            add x9, x9, #1          // x++
            b ._loop

    ._end:
        ldr lr, [sp], #8
    ret


/*  Function: draw_fill_circle.
   Description: Dibuja un circulo con relleno dadas sus coordenadas del centro (x,y), un radio y un color. 
                'Midpoint Circle Algorithm'
   Inputs:  x3, x4 = xc, yc (coordenadas del centro del circulo)   
            x0 = color del circulo
            x5 = radio del circulo
   Outputs: ninguno
   Temporales: x9, x10 = x, y (coordenadas para dibujar) 
               x11 = p (criterio de seleccion)  
               x12, x13 (auxiliares)
*/
draw_fill_circle:
    str x19, [sp, #-8]!
    str x20, [sp, #-8]!
    str x21, [sp, #-8]!
    str x22, [sp, #-8]!
    str lr, [sp, #-8]!

    mov x9, xzr                 // x=0
    sub x10, xzr, x5            // y=-r
    sub x11, xzr, x5            // p=-r

    ._fill_circle_loop:
        sub x12, xzr, x10
        cmp x9, x12
        b.ge ._fill_circle_end          // if x>=-y --> fin del loop (equivale a un while x<-y)

        cmp x11, xzr
        b.gt ._fill_circle_if
        b ._fill_circle_else            // if p>0, else;

        ._fill_circle_if:
            add x10, x10, #1
            add x13, x9, x10
            lsl x13, x13, #1
            add x13, x13, #1
            add x11, x11, x13           // p += 2*(x+y)+1
            b ._fill_circle_draw

        ._fill_circle_else:
            lsl x13, x9, #1
            add x13, x13, #1      
            add x11, x11, x13           // p += 2*x+1
            b ._fill_circle_draw

        ._fill_circle_draw:
            // en x0 se almacena el color del circulo, por lo tanto tambien se usa para cada pixel

            // pinto pixel en (xc+x, yc+y)
            add x1, x3, x9
            mov x19, x1
            add x2, x4, x10
            mov x20, x2
            bl draw_pixel

            // pinto pixel en (xc-x, yc+y)
            sub x1, x3, x9
            mov x21, x1
            add x2, x4, x10
            mov x22, x2
            bl draw_pixel

            // trazo una linea horizontal entre los puntos de la circunferencia con igual coordenada y
            stp x3, x4, [sp, #-16]!
            mov x1, x19   
            mov x2, x20
            mov x3, x21
            mov x4, x22
            bl draw_line
            ldp x3, x4, [sp], #16
            


            // pinto pixel en (xc+x, yc-y)
            add x1, x3, x9
            mov x19, x1
            sub x2, x4, x10
            mov x20, x2
            bl draw_pixel

            // pinto pixel en (xc-x, yc-y)
            sub x1, x3, x9
            mov x21, x1
            sub x2, x4, x10
            mov x22, x2
            bl draw_pixel

            // trazo una linea horizontal entre los puntos de la circunferencia con igual coordenada y
            stp x3, x4, [sp, #-16]!
            mov x1, x19   
            mov x2, x20
            mov x3, x21
            mov x4, x22
            bl draw_line
            ldp x3, x4, [sp], #16


            // pinto pixel en (xc+y, yc+x)
            add x1, x3, x10
            mov x19, x1
            add x2, x4, x9
            mov x20, x2
            bl draw_pixel

            // pinto pixel en (xc-y, yc+x)
            sub x1, x3, x10
            mov x21, x1
            add x2, x4, x9
            mov x22, x2
            bl draw_pixel

            // trazo una linea horizontal entre los puntos de la circunferencia con igual coordenada y
            stp x3, x4, [sp, #-16]!
            mov x1, x19   
            mov x2, x20
            mov x3, x21
            mov x4, x22
            bl draw_line
            ldp x3, x4, [sp], #16


            // pinto pixel en (xc+y, yc-x)
            add x1, x3, x10
            mov x19, x1
            sub x2, x4, x9
            mov x20, x2
            bl draw_pixel

            // pinto pixel en (xc-y, yc-x)
            sub x1, x3, x10
            mov x21, x1
            sub x2, x4, x9
            mov x22, x2
            bl draw_pixel

            // trazo una linea horizontal entre los puntos de la circunferencia con igual coordenada y
            stp x3, x4, [sp, #-16]!
            mov x1, x19   
            mov x2, x20
            mov x3, x21
            mov x4, x22
            bl draw_line
            ldp x3, x4, [sp], #16


            add x9, x9, #1          // x++
            b ._fill_circle_loop

    ._fill_circle_end:
        ldr lr, [sp], #8
        ldr x22, [sp], #8
        ldr x21, [sp], #8
        ldr x20, [sp], #8
        ldr x19, [sp], #8
    ret


draw_rectangle:
    // Guardar registros en la pila
    sub sp, sp, #64         // Reservar espacio para variables locales y registros
    stp x29, x30, [sp, #0]  // Guardar FP y LR
    mov x29, sp             // Actualizar FP
    stp x19, x20, [sp, #16] // Guardar registros temporales
    stp x21, x22, [sp, #32] // Guardar más registros
    stp x23, x24, [sp, #48] // Guardar más registros

    // Copiar parámetros a registros temporales
    mov x19, x0             // x19 = color
    mov x20, x1             // x20 = x_start
    mov x21, x2             // x21 = y_start
    mov x22, x3             // x22 = x_end
    mov x23, x4             // x23 = y_end

    // Bucle exterior: iterar sobre y desde y_start hasta y_end
    mov x24, x21            // x24 = y_current = y_start
outer_loop:
    cmp x24, x23            // Comparar y_current con y_end
    b.gt end_outer_loop     // Si y_current > y_end, salir

    // Bucle interior: iterar sobre x desde x_start hasta x_end
    mov x25, x20            // x25 = x_current = x_start
inner_loop:
    cmp x25, x22            // Comparar x_current con x_end
    b.gt end_inner_loop     // Si x_current > x_end, salir del bucle interior

    // Dibujar pixel en (x_current, y_current) con color
    mov x0, x19             // x0 = color
    mov x1, x25             // x1 = x_current
    mov x2, x24             // x2 = y_current
    bl draw_pixel           // Llamar a draw_pixel

    // Incrementar x_current
    add x25, x25, #1        // x_current++
    b inner_loop            // Volver al inicio del bucle interior
end_inner_loop:

    // Incrementar y_current
    add x24, x24, #1        // y_current++
    b outer_loop            // Volver al inicio del bucle exterior
end_outer_loop:

    // Restaurar registros y pila
    ldp x19, x20, [sp, #16] // Restaurar x19, x20
    ldp x21, x22, [sp, #32] // Restaurar x21, x22
    ldp x23, x24, [sp, #48] // Restaurar x23, x24
    ldp x29, x30, [sp, #0]  // Restaurar FP y LR
    add sp, sp, #64         // Liberar espacio en la pila
    ret



// Function: draw_semi_circle
// Description: Dibuja un semicirculo en la pantalla dado su centro (x0, y0), radio r, y direccion.
//              Puede ser relleno o no, dependiendo del parametro fill_flag.
// Inputs:
//  -x0: color
//  -x1: coordenada x del centro
//  -x2: coordenada y del centro
//  -x3: radio r
//  -x4: direccion (0: arriba, 1: abajo, 2: izquierda, 3: derecha)
//  -x5: fill_flag (0: no relleno, 1: relleno)
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

    // Copiar los parámetros a registros temporales
    mov x19, x0             // x19 = color
    mov x20, x1             // x20 = x_center
    mov x21, x2             // x21 = y_center
    mov x22, x3             // x22 = radius
    mov x23, x4             // x23 = direction
    // x5 = fill_flag, se usará directamente

    // Inicializar variables para el algoritmo de Bresenham
    mov x24, #0             // x = 0
    mov x25, x22            // y = radius
    sub x26, xzr, x22       // d = -radius

    // Bucle principal del algoritmo de Bresenham
._semi_circle_loop:
    // Dibujar según la dirección
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
    cmp x5, #1
    b.eq ._draw_line_upper
    // Dibujar puntos para contorno
    mov x0, x19             // color
    sub x1, x20, x24        // x_center - x
    sub x2, x21, x25        // y_center - y
    bl draw_pixel
    add x1, x20, x24        // x_center + x
    sub x2, x21, x25        // y_center - y
    bl draw_pixel
    b ._update_loop
._draw_line_upper:
    // Dibujar linea horizontal desde (x_center - x, y_center - y) hasta (x_center + x, y_center - y)
    mov x0, x19             // color
    sub x1, x20, x24        // x_start = x_center - x
    sub x2, x21, x25        // y_start = y_center - y
    add x3, x20, x24        // x_end = x_center + x
    mov x4, x2              // y_end = y_start
    bl draw_line
    b ._update_loop

._draw_lower:
    cmp x5, #1
    b.eq ._draw_line_lower
    // Dibujar puntos para contorno
    mov x0, x19             // color
    sub x1, x20, x24        // x_center - x
    add x2, x21, x25        // y_center + y
    bl draw_pixel
    add x1, x20, x24        // x_center + x
    add x2, x21, x25        // y_center + y
    bl draw_pixel
    b ._update_loop
._draw_line_lower:
    // Dibujar linea horizontal desde (x_center - x, y_center + y) hasta (x_center + x, y_center + y)
    mov x0, x19             // color
    sub x1, x20, x24        // x_start = x_center - x
    add x2, x21, x25        // y_start = y_center + y
    add x3, x20, x24        // x_end = x_center + x
    mov x4, x2              // y_end = y_start
    bl draw_line
    b ._update_loop

._draw_left:
    cmp x5, #1
    b.eq ._draw_line_left
    // Dibujar puntos para contorno
    mov x0, x19             // color
    sub x1, x20, x25        // x_center - y
    sub x2, x21, x24        // y_center - x
    bl draw_pixel
    sub x1, x20, x25        // x_center - y
    add x2, x21, x24        // y_center + x
    bl draw_pixel
    b ._update_loop
._draw_line_left:
    // Dibujar linea vertical desde (x_center - y, y_center - x) hasta (x_center - y, y_center + x)
    mov x0, x19             // color
    sub x1, x20, x25        // x_start = x_center - y
    sub x2, x21, x24        // y_start = y_center - x
    mov x3, x1              // x_end = x_start
    add x4, x21, x24        // y_end = y_center + x
    bl draw_line
    b ._update_loop

._draw_right:
    cmp x5, #1
    b.eq ._draw_line_right
    // Dibujar puntos para contorno
    mov x0, x19             // color
    add x1, x20, x25        // x_center + y
    sub x2, x21, x24        // y_center - x
    bl draw_pixel
    add x1, x20, x25        // x_center + y
    add x2, x21, x24        // y_center + x
    bl draw_pixel
    b ._update_loop
._draw_line_right:
    // Dibujar linea vertical desde (x_center + y, y_center - x) hasta (x_center + y, y_center + x)
    mov x0, x19             // color
    add x1, x20, x25        // x_start = x_center + y
    sub x2, x21, x24        // y_start = y_center - x
    mov x3, x1              // x_end = x_start
    add x4, x21, x24        // y_end = y_center + x
    bl draw_line
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


// Function: draw_parallelogram
// Description: Dibuja un paralelogramo relleno en la pantalla, definido por un punto de inicio y dos vectores.
// Inputs:
//  - x0: color
//  - x1: x0 (coordenada x del punto de inicio)  
//  - x2: y0 (coordenada y del punto de inicio)
//  - x3: ux (componente x del primer vector)    
//  - x4: uy (componente y del primer vector)
//  - x5: vx (componente x del segundo vector)   
//  - x6: vy (componente y del segundo vector)
// 
//  Los puntos x0 e y0 son el punto inicial, llamemoslo A. 
//  El vector u (ux, uy) define el primer lado desde el punto A hasta el punto B.
//  El vector v (vx, vy) define el segundo lado desde el punto A hasta el punto D
//
// Outputs: ninguno
// Registros modificados: ninguno aparte de los temporales

draw_parallelogram:
    // Guardar registros en la pila
    sub sp, sp, #128        // Reservar 128 bytes: 16 para x29/x30, 80 para parametros, 32 para temporales
    stp x29, x30, [sp, #0]  // Guardar FP y LR
    add x29, sp, #0         // Set FP
    str x0, [x29, #16]      // Guardar color
    str x1, [x29, #24]      // Guardar x0
    str x2, [x29, #32]      // Guardar y0
    str x3, [x29, #40]      // Guardar ux
    str x4, [x29, #48]      // Guardar uy
    str x5, [x29, #56]      // Guardar vx
    str x6, [x29, #64]      // Guardar vy

    // Calcular los vertices del paralelogramo
    // A = (x0, y0)
    ldr x1, [x29, #24]      // x_A = x0
    ldr x2, [x29, #32]      // y_A = y0
    str x1, [x29, #80]      // Guardar x_A
    str x2, [x29, #88]      // Guardar y_A

    // B = (x0 + ux, y0 + uy)
    ldr x9, [x29, #40]      // x9 = ux
    ldr x10, [x29, #48]     // x10 = uy
    add x3, x1, x9          // x_B = x0 + ux
    add x4, x2, x10         // y_B = y0 + uy
    str x3, [x29, #96]      // Guardar x_B
    str x4, [x29, #104]     // Guardar y_B

    // C = (x0 + ux + vx, y0 + uy + vy)
    ldr x11, [x29, #56]     // x11 = vx
    ldr x12, [x29, #64]     // x12 = vy
    add x3, x3, x11         // x_C = x_B + vx
    add x4, x4, x12         // y_C = y_B + vy
    str x3, [x29, #112]     // Guardar x_C
    str x4, [x29, #120]     // Guardar y_C

    // D = (x0 + vx, y0 + vy)
    add x3, x1, x11         // x_D = x0 + vx
    add x4, x2, x12         // y_D = y0 + vy

    // Encontrar y_min y y_max
    ldr x2, [x29, #88]      // y_A
    ldr x4, [x29, #104]     // y_B
    ldr x10, [x29, #120]    // y_C
    mov x19, x2             // y_min = y_A
    mov x20, x2             // y_max = y_A

    cmp x4, x19             // Comparar y_B con y_min
    csel x19, x4, x19, lt   // y_min = min(y_B, y_min)
    cmp x4, x20             // Comparar y_B con y_max
    csel x20, x4, x20, gt   // y_max = max(y_B, y_max)

    cmp x10, x19            // Comparar y_C con y_min
    csel x19, x10, x19, lt  // y_min = min(y_C, y_min)
    cmp x10, x20            // Comparar y_C con y_max
    csel x20, x10, x20, gt  // y_max = max(y_C, y_max)

    add x3, x1, x11         // y_D = y0 + vy
    cmp x3, x19             // Comparar y_D con y_min
    csel x19, x3, x19, lt   // y_min = min(y_D, y_min)
    cmp x3, x20             // Comparar y_D con y_max
    csel x20, x3, x20, gt   // y_max = max(y_D, y_max)

    // Bucle para cada y en [y_min, y_max]
    mov x21, x19            // y_current = y_min
._fill_loop:
    cmp x21, x20            // Comparar y_current con y_max
    b.gt ._end_fill_loop    // Si y_current > y_max, salir

    // Encontrar intersecciones de la linea y = y_current con los lados
    // Almacenar x_min y x_max para la línea horizontal
    mov x22, #0x7FFFFFFF    // x_min = max_int
    mov x23, #-0x80000000   // x_max = min_int

    // Verificar interseccion con lado A-B: (x_A, y_A) a (x_B, y_B)
    ldr x1, [x29, #80]      // x_A
    ldr x2, [x29, #88]      // y_A
    ldr x3, [x29, #96]      // x_B
    ldr x4, [x29, #104]     // y_B
    bl ._check_intersection
    cbz x0, ._skip_ab       // Si no hay interseccion, saltar
    cmp x9, x22             // Comparar x_inter con x_min
    csel x22, x9, x22, lt   // x_min = min(x_inter, x_min)
    cmp x9, x23             // Comparar x_inter con x_max
    csel x23, x9, x23, gt   // x_max = max(x_inter, x_max)
._skip_ab:

    // Verificar interseccion con lado B-C: (x_B, y_B) a (x_C, y_C)
    ldr x1, [x29, #96]      // x_B
    ldr x2, [x29, #104]     // y_B
    ldr x3, [x29, #112]     // x_C
    ldr x4, [x29, #120]     // y_C
    bl ._check_intersection
    cbz x0, ._skip_bc       // Si no hay interseccion, saltar
    cmp x9, x22             // Comparar x_inter con x_min
    csel x22, x9, x22, lt   // x_min = min(x_inter, x_min)
    cmp x9, x23             // Comparar x_inter con x_max
    csel x23, x9, x23, gt   // x_max = max(x_inter, x_max)
._skip_bc:

    // Verificar interseccion con lado C-D: (x_C, y_C) a (x_D, y_D)
    ldr x1, [x29, #112]     // x_C
    ldr x2, [x29, #120]     // y_C
    ldr x3, [x29, #80]      // x_D = x0 + vx
    ldr x4, [x29, #32]      // y_D = y0 + vy
    ldr x10, [x29, #56]     // vx
    ldr x11, [x29, #64]     // vy
    add x3, x3, x10         // x_D
    add x4, x4, x11         // y_D
    bl ._check_intersection
    cbz x0, ._skip_cd       // Si no hay interseccion, saltar
    cmp x9, x22             // Comparar x_inter con x_min
    csel x22, x9, x22, lt   // x_min = min(x_inter, x_min)
    cmp x9, x23             // Comparar x_inter con x_max
    csel x23, x9, x23, gt   // x_max = max(x_inter, x_max)
._skip_cd:

    // Verificar interseccion con lado D-A: (x_D, y_D) a (x_A, y_A)
    ldr x1, [x29, #80]      // x_D = x0 + vx
    ldr x2, [x29, #32]      // y_D = y0 + vy
    ldr x10, [x29, #56]     // vx
    ldr x11, [x29, #64]     // vy
    add x1, x1, x10         // x_D
    add x2, x2, x11         // y_D
    ldr x3, [x29, #80]      // x_A
    ldr x4, [x29, #88]      // y_A
    bl ._check_intersection
    cbz x0, ._skip_da       // Si no hay interseccion, saltar
    cmp x9, x22             // Comparar x_inter con x_min
    csel x22, x9, x22, lt   // x_min = min(x_inter, x_min)
    cmp x9, x23             // Comparar x_inter con x_max
    csel x23, x9, x23, gt   // x_max = max(x_inter, x_max)
._skip_da:

    // Dibujar linea horizontal desde x_min hasta x_max en y_current
    ldr x0, [x29, #16]      // color
    mov x1, x22             // x_0 = x_min
    mov x2, x21             // y_0 = y_current
    mov x3, x23             // x_1 = x_max
    mov x4, x21             // y_1 = y_current
    bl draw_line

    // Incrementar y_current
    add x21, x21, #1
    b ._fill_loop

._end_fill_loop:
    // Restaurar registros y pila
    ldp x29, x30, [sp, #0]  // Restaurar FP y LR
    add sp, sp, #128        // Liberar espacio en la pila
    ret

// Subrutina auxiliar: check_intersection
// Description: Calcula la interseccion de la linea y = y_current con el segmento de (x1, y1) a (x3, y4)
// Inputs:
//  - x1, x2: coordenadas (x, y) del primer punto
//  - x3, x4: coordenadas (x, y) del segundo punto
//  - x21: y_current
// Outputs:
//  - x0: 1 si hay interseccion, 0 si no
//  - x9: x_inter (coordenada x de la interseccion, si existe)
// Registros usados: x10, x11, x12, x13
._check_intersection:
    // Guardar LR
    str x30, [sp, #-16]!

    // Verificar si la linea horizontal esta dentro del rango y del segmento
    mov x10, x2                 // y1
    mov x11, x4                 // y2
    cmp x10, x11
    csel x12, x10, x11, le      // x12 = min(y1, y2)
    csel x13, x10, x11, gt      // x13 = max(y1, y2)
    cmp x21, x12
    b.lt ._no_intersection      // y_current < min(y1, y2)
    cmp x21, x13
    b.gt ._no_intersection      // y_current > max(y1, y2)

    // Calcular x_inter = x1 + (y_current - y1) * (x2 - x1) / (y2 - y1)
    sub x12, x4, x2             // dy = y2 - y1
    cbz x12, ._no_intersection // Evitar division por cero
    sub x13, x21, x2            // y_current - y1
    sub x10, x3, x1             // dx = x2 - x1
    mul x13, x13, x10           // (y_current - y1) * (x2 - x1)
    sdiv x13, x13, x12          // (y_current - y1) * (x2 - x1) / (y2 - y1)
    add x9, x1, x13             // x_inter = x1 + resultado
    mov x0, #1                  // Indicar interseccin valida
    b ._end_intersection

._no_intersection:
    mov x0, #0              // No hay interseccion

._end_intersection:
    ldr x30, [sp], #16      // Restaurar LR
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

    