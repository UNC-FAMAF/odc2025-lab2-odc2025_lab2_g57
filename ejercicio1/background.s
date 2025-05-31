.include "constants.s"

.globl background_gradient
.globl draw_sand
.globl draw_road
.globl draw_edificios_fondo

/**
 * Function: background_gradient
 * Description: Pinta un fondo degrado vertical hasta más de la mitad de la pantalla. Luego, pinta lo restante con el color final.
 *              Se hace uso de interpolación lineal por porcentaje escalar.
 * Registros caller-saved (Es decir, no preservados. Responsabilidad del caller!):
 * - x0: color inicial
 * - x1: color final
 * - x2: contador y
 * - x3: contador x
 * - x4: porcentaje de avance
 * - x5: R_actual
 * - x6: G_actual
 * - x7: B_actual
 * - x8: R_inicial
 * - x9: G_inicial
 * - x10: B_inicial
 * - x11: R_final
 * - x12: G_final
 * - x13: B_final
 * - x14: delta(R)
 * - x15: delta(G)
 * - x16: delta(B)
 * Registros callee-saved usados:
 * - x19: 255 guardado en un registro. Lo uso para escalar el porcentaje.
 * - x20: 260 guardado en un registro. Es la cantidad de filas que quiero que haya degradado de color a color.
 * - x21: color a pintar.
 * - x28: dirección base del frame buffer.
 **/
background_gradient:
    // Guardo registros callee-saved usados
    stp x19, x20, [sp, #-16]!
    stp x21, x28, [sp, #-16]!
    str x30, [sp, #-8]!

    // Extraer componentes R,G,B del color inicial (x0) a registros temporales x8, x9, x10.
    lsr x8, x0, #16            // R_inicial 

    lsr x9, x0, #8            
    and x9, x9, #0xFF          // Ahora tengo que hacer un filtro que me deje los ultimos 8 bits. Uso un and bit a bit como un filtro. Finalmente, G_inicial

    and x10, x0, #0xFF         // B_inicial

    // Extraer componentes R,G,B del color final (x1) a registros temporales x11, x12, x13.
    lsr x11, x1, #16           // R_final

    lsr x12, x1, #8            
    and x12, x12, #0xFF        // G_final 

    and x13, x1, #0xFF         // B_final

    // Calculo los delta de R,G,B. Es decir, delta(R) = R_final - R_inicial, delta(G) = G_final - G_inicial, delta(B) = B_final - B_inicial
    sub x14, x11, x8
    sub x15, x12, x9
    sub x16, x13, x10

    // x2 es el contador de y, voy a iterar 260 veces porque el degradad llega hasta un poquito más de la mitad de la pantalla
    mov x2, #0
._loop_y:
    cmp x2, SCREEN_HEIGH
    b.ge ._background_done

    mov x3, SCREEN_WIDTH

    cmp x2, #260
    b.ge ._gradient_done

    // Calculo el color interpolado.

    // Calculo el porcentaje de avance para la fila actual.
    // porcentaje = (fila actual * 255) / 260
    mov x19, #255
    mov x20, #260
    mul x4, x2, x19
    udiv x4, x4, x20

    // Interpolación lineal para el componente R.
    // R_actual: R_incial + ((delta(R) * porcentaje) / 255)
    mul x5,  x14, x4
    udiv x5, x5, x19
    add x5, x8, x5

    // Interpolación lineal para el componente G.
    // G_actual: G_incial + ((delta(G) * porcentaje) / 255)
    mul x6,  x15, x4
    udiv x6, x6, x19
    add x6, x9, x6
    
    // Interpolación lineal para el componente R.
    // R_actual: R_incial + ((delta(R) * porcentaje) / 255)
    mul x7,  x16, x4
    udiv x7, x7, x19
    add x7, x10, x7

    // Conformo el color
    lsl x5, x5, #16
    mov x21, x5

    lsl x6, x6, #8
    orr x21, x21, x6

    orr x21,x21, x7

    b ._loop_x

._gradient_done:
    mov x21, x1

._loop_x:
    str w21, [x28]
    add x28, x28, #4
    sub x3, x3, #1
    cbnz x3, ._loop_x

    add x2, x2, #1
    b ._loop_y

._background_done:
    // Restauro registros callee-saved
    ldr x30, [sp], #8
    ldp x21, x28, [sp], #16
    ldp x19, x20, [sp], #16
    
    ret





/**
 * Function: draw_sand
 * Temporales no guardados (responsabilidad del caller!):
 * - x0: color
 * - x1
 * - x2
 * - x3
 * - x4
 **/
draw_sand:
    str x30, [sp, #-8]!

    // color de la arena = 0xD0D097
    // CBCA8A
    // ece2c6
    // 0xCFCF8F
    movz x0, 0xCF, lsl #16
	movk x0, 0xCF8F, lsl #00
    mov x1, #0
    mov x2, #330
    mov x3, #640
    mov x4, #480
    bl draw_rectangle
._draw_sand_details:
    // Añado piedritas para cambiarlo un poco y que no sea una franja de color.
    // No es lo más elegante del mundo. Se podría hacer una función que haga un patrón de piedritas. TODO
    mov x1, #5
    mov x2, #345
    bl draw_pebble
    mov x1, #17
    mov x2, #342
    bl draw_pebble
    mov x1, #34
    mov x2, #343
    bl draw_pebble
    mov x1, #43
    mov x2, #343
    bl draw_pebble
    mov x1, #20
    mov x2, #351
    bl draw_pebble
    mov x1, #30
    mov x2, #351
    bl draw_pebble
    mov x1, #9
    mov x2, #356
    bl draw_pebble
    mov x1, #3
    mov x2, #363
    bl draw_pebble
    mov x1, #13
    mov x2, #361
    bl draw_pebble
    mov x1, #26
    mov x2, #363
    bl draw_pebble
    mov x1, #39
    mov x2, #359
    bl draw_pebble
    mov x1, #15
    mov x2, #368
    bl draw_pebble
    mov x1, #20
    mov x2, #374
    bl draw_pebble
    mov x1, #34
    mov x2, #380
    bl draw_pebble
    mov x1, #18
    mov x2, #385
    bl draw_pebble
    mov x1, #7
    mov x2, #381
    bl draw_pebble
    mov x1, #0
    mov x2, #380
    bl draw_pebble
    mov x1, #34
    mov x2, #392
    bl draw_pebble
    mov x1, #35
    mov x2, #401
    bl draw_pebble
    mov x1, #45
    mov x2, #410
    bl draw_pebble
    mov x1, #24
    mov x2, #409
    bl draw_pebble
    mov x1, #10
    mov x2, #408
    bl draw_pebble
    mov x1, #17
    mov x2, #433
    bl draw_pebble
    mov x1, #118
    mov x2, #442
    bl draw_pebble
    mov x1, #164
    mov x2, #437
    bl draw_pebble
    mov x1, #179
    mov x2, #441
    bl draw_pebble
    mov x1, #147
    mov x2, #426
    bl draw_pebble
    mov x1, #132
    mov x2, #427
    bl draw_pebble
    mov x1, #143
    mov x2, #414
    bl draw_pebble
    mov x1, #176
    mov x2, #415
    bl draw_pebble
    mov x1, #201
    mov x2, #408
    bl draw_pebble
    mov x1, #183
    mov x2, #428
    bl draw_pebble
    mov x1, #194
    mov x2, #429
    bl draw_pebble
    mov x1, #194
    mov x2, #394
    bl draw_pebble
    mov x1, #210
    mov x2, #391
    bl draw_pebble
    mov x1, #218
    mov x2, #403
    bl draw_pebble
    mov x1, #229
    mov x2, #407
    bl draw_pebble
    mov x1, #237
    mov x2, #397
    bl draw_pebble
    mov x1, #216
    mov x2, #418
    bl draw_pebble
    mov x1, #209
    mov x2, #382
    bl draw_pebble
    mov x1, #198
    mov x2, #377
    bl draw_pebble
    mov x1, #196
    mov x2, #362
    bl draw_pebble
    mov x1, #214
    mov x2, #363
    bl draw_pebble
    mov x1, #194
    mov x2, #352
    bl draw_pebble
    mov x1, #207
    mov x2, #344
    bl draw_pebble
    mov x1, #193
    mov x2, #342
    bl draw_pebble
    mov x1, #310
    mov x2, #432
    bl draw_pebble
    mov x1, #293
    mov x2, #431
    bl draw_pebble
    mov x1, #308
    mov x2, #418
    bl draw_pebble
    mov x1, #327
    mov x2, #402
    bl draw_pebble
    mov x1, #324
    mov x2, #435
    bl draw_pebble
    mov x1, #313
    mov x2, #444
    bl draw_pebble
    mov x1, #330
    mov x2, #442
    bl draw_pebble
    mov x1, #335
    mov x2, #427
    bl draw_pebble
    mov x1, #355
    mov x2, #427
    bl draw_pebble
    mov x1, #347
    mov x2, #406
    bl draw_pebble
    mov x1, #366
    mov x2, #412
    bl draw_pebble
    mov x1, #374
    mov x2, #422
    bl draw_pebble
    mov x1, #391
    mov x2, #432
    bl draw_pebble
    mov x1, #404
    mov x2, #425
    bl draw_pebble
    mov x1, #413
    mov x2, #444
    bl draw_pebble
    mov x1, #396
    mov x2, #407
    bl draw_pebble
    mov x1, #378
    mov x2, #406
    bl draw_pebble
    mov x1, #391
    mov x2, #396
    bl draw_pebble
    mov x1, #406
    mov x2, #380
    bl draw_pebble
    mov x1, #415
    mov x2, #381
    bl draw_pebble
    mov x1, #416
    mov x2, #373
    bl draw_pebble
    mov x1, #406
    mov x2, #362
    bl draw_pebble
    mov x1, #398
    mov x2, #362
    bl draw_pebble
    mov x1, #391
    mov x2, #358
    bl draw_pebble
    mov x1, #413
    mov x2, #358
    bl draw_pebble
    mov x1, #420
    mov x2, #349
    bl draw_pebble
    mov x1, #400
    mov x2, #348
    bl draw_pebble
    mov x1, #429
    mov x2, #404
    bl draw_pebble
    mov x1, #438
    mov x2, #397
    bl draw_pebble
    mov x1, #445
    mov x2, #405
    bl draw_pebble
    mov x1, #432
    mov x2, #419
    bl draw_pebble
    mov x1, #414
    mov x2, #444
    bl draw_pebble
    mov x1, #391
    mov x2, #433
    bl draw_pebble
    mov x1, #403
    mov x2, #425
    bl draw_pebble
    mov x1, #445
    mov x2, #405
    bl draw_pebble
    mov x1, #456
    mov x2, #404
    bl draw_pebble
    mov x1, #543
    mov x2, #408
    bl draw_pebble
    mov x1, #553
    mov x2, #420
    bl draw_pebble
    mov x1, #538
    mov x2, #428
    bl draw_pebble
    mov x1, #569
    mov x2, #414
    bl draw_pebble
    mov x1, #538
    mov x2, #419
    bl draw_pebble
    mov x1, #550
    mov x2, #433
    bl draw_pebble
    mov x1, #583
    mov x2, #420
    bl draw_pebble
    mov x1, #579
    mov x2, #405
    bl draw_pebble
    mov x1, #595
    mov x2, #397
    bl draw_pebble
    mov x1, #604
    mov x2, #405
    bl draw_pebble
    mov x1, #598
    mov x2, #432
    bl draw_pebble
    mov x1, #621
    mov x2, #419
    bl draw_pebble
    mov x1, #620
    mov x2, #437
    bl draw_pebble
    mov x1, #629
    mov x2, #396
    bl draw_pebble
    mov x1, #611
    mov x2, #385
    bl draw_pebble
    mov x1, #617
    mov x2, #376
    bl draw_pebble
    mov x1, #603
    mov x2, #367
    bl draw_pebble
    mov x1, #610
    mov x2, #363
    bl draw_pebble
    mov x1, #617
    mov x2, #362
    bl draw_pebble
    mov x1, #632
    mov x2, #361
    bl draw_pebble
    mov x1, #625
    mov x2, #352
    bl draw_pebble
    mov x1, #632
    mov x2, #343
    bl draw_pebble
    mov x1, #616
    mov x2, #343
    bl draw_pebble
    mov x1, #600
    mov x2, #344
    bl draw_pebble

    ldr x30, [sp], #8
    ret


/**
 * Function: draw_pebble
 * Inputs no preservados (Cuidado! Responsabilidad del caller):
 * - x1: coordenada x
 * - x2: coordenada y
 * Registros no preservados (Cuidado! Responsabilidad del caller)
 * - x10
 * - x11
 * Registros callee saved usados:
 * - x20
 * - x21
 * - x22
 **/
draw_pebble:
    stp x20, x21, [sp, #-16]!
    stp x22, x30, [sp, #-16]!

    mov x10, x1
    mov x11, x2
    

    // Color de la piedrita = 0xA4AB82
    movz x20, 0xa4, lsl #16
    movk x20, 0xab82, lsl #00

    // Color más claro = 0x00B8BF96
    movz x21, 0xb8, lsl #16
    movk x21, 0xbf96, lsl #00

    // Color más oscuro
    movz x22, 0x90, lsl #16
    movk x22, 0x976e, lsl #00

    // Las coordenadas son relativas al punto original (x10, x11).

    mov x0, x21
    sub x1, x10, #1
    sub x2, x11, #1
    bl draw_pixel

    mov x0, x21
    mov x1, x10
    sub x2, x11, #1
    bl draw_pixel

    mov x0, x21
    sub x1, x10, #1
    mov x2, x11
    bl draw_pixel

    
    mov x0, x20
    add x1, x10, #1
    sub x2, x11, #1
    bl draw_pixel

    mov x0, x20
    mov x1, x10
    mov x2, x11
    bl draw_pixel

    mov x0, x20
    add x1, x10, #1
    mov x2, x11
    bl draw_pixel

    mov x0, x20
    sub x1, x10, #1
    add x2, x11, #1
    bl draw_pixel

    mov x0, x20
    mov x1, x10
    add x2, x11, #1
    bl draw_pixel

    mov x0, x22
    add x1, x10, #1
    add x2, x11, #1
    bl draw_pixel

    mov x0, x22
    mov x1, x10
    add x2, x11, #2
    bl draw_pixel

    mov x0, x22
    add x1, x10, #1
    add x2, x11, #2
    bl draw_pixel


    ldp x22, x30, [sp], #16 
    ldp x20, x21, [sp], #16
    

    ret



draw_road:
    str x30, [sp, #-8]!
    

    // color de la ruta: 0x334750
    movz x0, 0x33, lsl #16
	movk x0, 0x4750, lsl #00

    mov x1, #0
    mov x2, #455
    mov x3, #640
    mov x4, #480
    bl draw_rectangle

    mov x1, #0
    mov x2, #451
    mov x3, #101
    mov x4, #455
    bl draw_rectangle

    mov x1, #432
    mov x2, #451
    mov x3, #640
    mov x4, #455
    bl draw_rectangle



    // color del cordón de la ruta: 0x203A37
    movz x0, 0x20, lsl #16
	movk x0, 0x3A37, lsl #00

    mov x1, #516
    mov x2, #447
    mov x3, #640
    mov x4, #450
    bl draw_rectangle

    // diagonal derecha casa bob
    mov x1, #516
    mov x2, #441
    mov x3, #519
    mov x4, #446
    bl draw_rectangle

    mov x1, #520
    mov x2, #418
    mov x3, #523
    mov x4, #440
    bl draw_rectangle

    mov x1, #524
    mov x2, #405
    mov x3, #527
    mov x4, #417
    bl draw_rectangle

    mov x1, #528
    mov x2, #400
    mov x3, #531
    mov x4, #404
    bl draw_rectangle
    
    // recta larga
    mov x1, #101
    mov x2, #452
    mov x3, #431
    mov x4, #455
    bl draw_rectangle

    // parte casa patricio hasta diagonal
    
    mov x1, #0
    mov x2, #447
    mov x3, #27
    mov x4, #450
    bl draw_rectangle

    
    mov x1, #432
    mov x2, #447
    mov x3, #440
    mov x4, #450
    bl draw_rectangle

    mov x1, #441
    mov x2, #441
    mov x3, #444
    mov x4, #446
    bl draw_rectangle

    mov x1, #445
    mov x2, #433
    mov x3, #448
    mov x4, #440
    bl draw_rectangle

    mov x1, #449
    mov x2, #428
    mov x3, #452
    mov x4, #432
    bl draw_rectangle
    
    mov x1, #453
    mov x2, #423
    mov x3, #456
    mov x4, #427
    bl draw_rectangle

    mov x1, #457
    mov x2, #419
    mov x3, #461
    mov x4, #422
    bl draw_rectangle


    mov x1, #462
    mov x2, #413
    mov x3, #465
    mov x4, #418
    bl draw_rectangle

    mov x1, #466
    mov x2, #409
    mov x3, #469
    mov x4, #412
    bl draw_rectangle

    mov x1, #470
    mov x2, #404
    mov x3, #477
    mov x4, #408
    bl draw_rectangle

    mov x1, #478
    mov x2, #400
    mov x3, #482
    mov x4, #403
    bl draw_rectangle
    
    


    

    
   
    ldr x30, [sp], #8
    ret


draw_edificios_fondo:
    str x30, [sp, #-8]!
    
    // color de los edificios del fondo: 0x2F3C9A
    movz x0, 0x2F, lsl #16
	movk x0, 0x3C9A, lsl #00

    // 1
    mov x1, #176
    mov x2, #293
    mov x3, #188
    mov x4, #335
    bl draw_rectangle

    mov x1, #189
    mov x2, #312
    mov x3, #193
    mov x4, #321
    bl draw_rectangle

    mov x1, #172
    mov x2, #305
    mov x3, #175
    mov x4, #316
    bl draw_rectangle

    mov x1, #180
    mov x2, #285
    mov x3, #183
    mov x4, #292
    bl draw_rectangle

    // 2
    mov x1, #176
    mov x2, #293
    mov x3, #188
    mov x4, #335
    bl draw_rectangle

    mov x1, #189
    mov x2, #312
    mov x3, #193
    mov x4, #321
    bl draw_rectangle

    mov x1, #172
    mov x2, #305
    mov x3, #175
    mov x4, #316
    bl draw_rectangle

    mov x1, #180
    mov x2, #285
    mov x3, #183
    mov x4, #292
    bl draw_rectangle

    // 3

    // 4


    // detalles




    ldr x30, [sp], #8
    ret
    
