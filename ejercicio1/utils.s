    .include "constants.s"

    .globl draw_pixel
    .globl draw_line
    .globl draw_rectangle
    .globl draw_semi_circle
    .globl draw_circle

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
    // Inputs:
    //  -x0: color
    //  -x1: coordenada x_0
    //  -x2: coordenada y_0
    //  -x3: coordenada x_1
    //  -x4: coordenada y_1
    // Outputs: ninguno
    // Registros usados:
    // - x7: usada para pasar argumento a abs y recibir su resultado
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
// Description: Dibuja un semicirculo relleno en la pantalla dado su centro (x0, y0), radio r, y direccin.
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

    // Copiar los parámetros a registros temporales
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
    // Dibujar las lineas según la dirección
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
    // Dibujar linea horizontal desde (x_center - x, y_center - y) hasta (x_center + x, y_center - y)
    mov x0, x19             // color
    sub x1, x20, x24        // x_start = x_center - x
    sub x2, x21, x25        // y_start = y_center - y
    add x3, x20, x24        // x_end = x_center + x
    mov x4, x2              // y_end = y_start (misma y para linea horizontal)
    bl draw_line
    b ._update_loop

._draw_lower:
    // Dibujar linea horizontal desde (x_center - x, y_center + y) hasta (x_center + x, y_center + y)
    mov x0, x19             // color
    sub x1, x20, x24        // x_start = x_center - x
    add x2, x21, x25        // y_start = y_center + y
    add x3, x20, x24        // x_end = x_center + x
    mov x4, x2              // y_end = y_start (misma y para linea horizontal)
    bl draw_line
    b ._update_loop

._draw_left:
    // Dibujar linea vertical desde (x_center - y, y_center - x) hasta (x_center - y, y_center + x)
    mov x0, x19             // color
    sub x1, x20, x25        // x_start = x_center - y
    sub x2, x21, x24        // y_start = y_center - x
    mov x3, x1              // x_end = x_start (misma x para línea vertical)
    add x4, x21, x24        // y_end = y_center + x
    bl draw_line
    b ._update_loop

._draw_right:
    // Dibujar linea vertical desde (x_center + y, y_center - x) hasta (x_center + y, y_center + x)
    mov x0, x19             // color
    add x1, x20, x25        // x_start = x_center + y
    sub x2, x21, x24        // y_start = y_center - x
    mov x3, x1              // x_end = x_start (misma x para linea vertical)
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

    