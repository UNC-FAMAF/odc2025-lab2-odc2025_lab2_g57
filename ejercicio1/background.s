.include "constants.s"

.globl background
.globl draw_sand
.globl draw_road
.globl draw_edificios_fondo


background:
    str x30, [sp, #-8]!

    // Franja 0 - Color: #40D0CF
    movz x0, 0x40, lsl #16
    movk x0, 0xD0CF, lsl #0
    mov x1, 0
    mov x2, 0
    mov x3, 640
    mov x4, 8
    bl draw_rectangle

    // Franja 1 - Color: #3FCDCF
    movz x0, 0x3F, lsl #16
    movk x0, 0xCDCF, lsl #0
    mov x1, 0
    mov x2, 8
    mov x3, 640
    mov x4, 16
    bl draw_rectangle

    // Franja 2 - Color: #3DC9D0
    movz x0, 0x3D, lsl #16
    movk x0, 0xC9D0, lsl #0
    mov x1, 0
    mov x2, 16
    mov x3, 640
    mov x4, 24
    bl draw_rectangle

    // Franja 3 - Color: #3CC6D0
    movz x0, 0x3C, lsl #16
    movk x0, 0xC6D0, lsl #0
    mov x1, 0
    mov x2, 24
    mov x3, 640
    mov x4, 32
    bl draw_rectangle

    // Franja 4 - Color: #3AC2D0
    movz x0, 0x3A, lsl #16
    movk x0, 0xC2D0, lsl #0
    mov x1, 0
    mov x2, 32
    mov x3, 640
    mov x4, 40
    bl draw_rectangle

    // Franja 5 - Color: #39BFD0
    movz x0, 0x39, lsl #16
    movk x0, 0xBFD0, lsl #0
    mov x1, 0
    mov x2, 40
    mov x3, 640
    mov x4, 48
    bl draw_rectangle

    // Franja 6 - Color: #38BCD1
    movz x0, 0x38, lsl #16
    movk x0, 0xBCD1, lsl #0
    mov x1, 0
    mov x2, 48
    mov x3, 640
    mov x4, 56
    bl draw_rectangle

    // Franja 7 - Color: #36B8D1
    movz x0, 0x36, lsl #16
    movk x0, 0xB8D1, lsl #0
    mov x1, 0
    mov x2, 56
    mov x3, 640
    mov x4, 64
    bl draw_rectangle

    // Franja 8 - Color: #35B5D1
    movz x0, 0x35, lsl #16
    movk x0, 0xB5D1, lsl #0
    mov x1, 0
    mov x2, 64
    mov x3, 640
    mov x4, 72
    bl draw_rectangle

    // Franja 9 - Color: #34B2D1
    movz x0, 0x34, lsl #16
    movk x0, 0xB2D1, lsl #0
    mov x1, 0
    mov x2, 72
    mov x3, 640
    mov x4, 80
    bl draw_rectangle

    // Franja 10 - Color: #32AED2
    movz x0, 0x32, lsl #16
    movk x0, 0xAED2, lsl #0
    mov x1, 0
    mov x2, 80
    mov x3, 640
    mov x4, 88
    bl draw_rectangle

    // Franja 11 - Color: #31ABD2
    movz x0, 0x31, lsl #16
    movk x0, 0xABD2, lsl #0
    mov x1, 0
    mov x2, 88
    mov x3, 640
    mov x4, 96
    bl draw_rectangle

    // Franja 12 - Color: #2FA7D2
    movz x0, 0x2F, lsl #16
    movk x0, 0xA7D2, lsl #0
    mov x1, 0
    mov x2, 96
    mov x3, 640
    mov x4, 104
    bl draw_rectangle

    // Franja 13 - Color: #2EA4D3
    movz x0, 0x2E, lsl #16
    movk x0, 0xA4D3, lsl #0
    mov x1, 0
    mov x2, 104
    mov x3, 640
    mov x4, 112
    bl draw_rectangle

    // Franja 14 - Color: #2DA1D3
    movz x0, 0x2D, lsl #16
    movk x0, 0xA1D3, lsl #0
    mov x1, 0
    mov x2, 112
    mov x3, 640
    mov x4, 120
    bl draw_rectangle

    // Franja 15 - Color: #2B9DD3
    movz x0, 0x2B, lsl #16
    movk x0, 0x9DD3, lsl #0
    mov x1, 0
    mov x2, 120
    mov x3, 640
    mov x4, 128
    bl draw_rectangle

    // Franja 16 - Color: #2A9AD3
    movz x0, 0x2A, lsl #16
    movk x0, 0x9AD3, lsl #0
    mov x1, 0
    mov x2, 128
    mov x3, 640
    mov x4, 136
    bl draw_rectangle

    // Franja 17 - Color: #2997D4
    movz x0, 0x29, lsl #16
    movk x0, 0x97D4, lsl #0
    mov x1, 0
    mov x2, 136
    mov x3, 640
    mov x4, 144
    bl draw_rectangle

    // Franja 18 - Color: #2793D4
    movz x0, 0x27, lsl #16
    movk x0, 0x93D4, lsl #0
    mov x1, 0
    mov x2, 144
    mov x3, 640
    mov x4, 152
    bl draw_rectangle

    // Franja 19 - Color: #2690D4
    movz x0, 0x26, lsl #16
    movk x0, 0x90D4, lsl #0
    mov x1, 0
    mov x2, 152
    mov x3, 640
    mov x4, 160
    bl draw_rectangle

    // Franja 20 - Color: #248CD5
    movz x0, 0x24, lsl #16
    movk x0, 0x8CD5, lsl #0
    mov x1, 0
    mov x2, 160
    mov x3, 640
    mov x4, 168
    bl draw_rectangle

    // Franja 21 - Color: #2389D5
    movz x0, 0x23, lsl #16
    movk x0, 0x89D5, lsl #0
    mov x1, 0
    mov x2, 168
    mov x3, 640
    mov x4, 176
    bl draw_rectangle

    // Franja 22 - Color: #2286D5
    movz x0, 0x22, lsl #16
    movk x0, 0x86D5, lsl #0
    mov x1, 0
    mov x2, 176
    mov x3, 640
    mov x4, 184
    bl draw_rectangle

    // Franja 23 - Color: #2082D5
    movz x0, 0x20, lsl #16
    movk x0, 0x82D5, lsl #0
    mov x1, 0
    mov x2, 184
    mov x3, 640
    mov x4, 192
    bl draw_rectangle

    // Franja 24 - Color: #1F7FD6
    movz x0, 0x1F, lsl #16
    movk x0, 0x7FD6, lsl #0
    mov x1, 0
    mov x2, 192
    mov x3, 640
    mov x4, 200
    bl draw_rectangle

    // Franja 25 - Color: #1E7CD6
    movz x0, 0x1E, lsl #16
    movk x0, 0x7CD6, lsl #0
    mov x1, 0
    mov x2, 200
    mov x3, 640
    mov x4, 208
    bl draw_rectangle

    // Franja 26 - Color: #1C78D6
    movz x0, 0x1C, lsl #16
    movk x0, 0x78D6, lsl #0
    mov x1, 0
    mov x2, 208
    mov x3, 640
    mov x4, 216
    bl draw_rectangle

    // Franja 27 - Color: #1B75D6
    movz x0, 0x1B, lsl #16
    movk x0, 0x75D6, lsl #0
    mov x1, 0
    mov x2, 216
    mov x3, 640
    mov x4, 224
    bl draw_rectangle

    // Franja 28 - Color: #1971D7
    movz x0, 0x19, lsl #16
    movk x0, 0x71D7, lsl #0
    mov x1, 0
    mov x2, 224
    mov x3, 640
    mov x4, 232
    bl draw_rectangle

    // Franja 29 - Color: #186ED7
    movz x0, 0x18, lsl #16
    movk x0, 0x6ED7, lsl #0
    mov x1, 0
    mov x2, 232
    mov x3, 640
    mov x4, 480
    bl draw_rectangle




    ldr x30, [sp], 8
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
    // Añado piedritas para cambiarlo un poco y que no sea una franja de un color
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

    ldr x30, [sp], #8
    ret
    
