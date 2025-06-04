#include "constants.s"

.globl draw_casa_calamardo
.globl draw_casa_patricio
.globl draw_casa_bob

draw_casa_calamardo:
    str x30, [sp, #-8]!

    // Parte principal
        // Oreja derecha
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x1, #390
        mov x2, #203
        mov x3, #415
        mov x4, #291
        bl draw_rectangle
        movz x0, 0x17, lsl #16  // Color: #172740
	    movk x0, 0x2740, lsl #0
        mov x1, #390
        mov x2, #206
        mov x3, #413
        mov x4, #289
        bl draw_rectangle


        // Oreja izquierda
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x1, #213
        mov x2, #203
        mov x3, #250
        mov x4, #291
        bl draw_rectangle

        movz x0, 0x1e, lsl #16  // Color: #1E3253
	    movk x0, 0x3253, lsl #0
        mov x1, #215
        mov x2, #206
        mov x3, #250
        mov x4, #289
        bl draw_rectangle

        //Parte central
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
	    mov x1, #245             // x0: coordenada x inicial
	    mov x2, #103             // y0: coordenada y inicial 
	    mov x3, #133             // ux: vector u 
	    mov x4, #0               // uy
	    mov x5, #-20              // vx: vector v 
	    mov x6, #289             // vy
	    bl draw_parallelogram

        mov x1, #317             // x0: coordenada x inicial
	    mov x2, #103             // y0: coordenada y inicial 
	    mov x3, #67             // ux: vector u 
	    mov x4, #0               // uy
	    mov x5, #20              // vx: vector v 
	    mov x6, #289             // vy
	    bl draw_parallelogram


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

    // Ojos
        // izquierdo
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x3, #275
        mov x4, #224
        mov x5, #22
        bl draw_fill_circle

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
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x3, #353
        mov x4, #224
        mov x5, #22
        bl draw_fill_circle

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
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x1, #287
        mov x2, #341
        mov x3, #341
        mov x4, #390
        bl draw_rectangle

        mov x3, #314
        mov x4, #346
        mov x5, #27
        bl draw_fill_semi_circle


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
    
draw_casa_patricio:
    str x30, [sp, #-8]!

    movz x0, 0x0005, lsl #16  // Color
	movk x0, 0x100A, lsl #0
    mov x3, #102
    mov x4, #389
    mov x5, #82
    bl draw_fill_semi_circle

    movz x0, 0x52, lsl #16  // Color: #522620 <- casa de patricio
	movk x0, 0x2620, lsl #0
    mov x3, #102
    mov x4, #389
    mov x5, #80
    bl draw_fill_semi_circle

    // Sombreado para la casa. Color: #672f28
    movz x0, 0x67, lsl 16
    movk x0, 0x2f28, lsl 0
    mov x3, #95
    mov x4, #389
    mov x5, #73
    bl draw_fill_semi_circle

    
    movz x0, 0xF1, lsl #16  // Color: #F19803 <- antena
	movk x0, 0x9803, lsl #0

    mov x1, #100
    mov x2, #279
    mov x3, #104
    mov x4, #308
    bl draw_rectangle

    mov x1, #80
    mov x2, #279
    mov x3, #139
    mov x4, #283
    bl draw_rectangle
    
    mov x1, #90
    mov x2, #264
    mov x3, #4
    mov x4, #0
    mov x5, #-10
    mov x6, #15
    bl draw_parallelogram

    mov x1, #80
    mov x2, #283
    mov x3, #4
    mov x4, #0
    mov x5, #10
    mov x6, #15
    bl draw_parallelogram

    mov x1, #105
    mov x2, #264
    mov x3, #4
    mov x4, #0
    mov x5, #10
    mov x6, #34
    bl draw_parallelogram

    mov x1, #125
    mov x2, #264
    mov x3, #4
    mov x4, #0
    mov x5, #8
    mov x6, #34
    bl draw_parallelogram

    ldr x30, [sp], #8
    ret

draw_casa_bob:
    str lr, [sp, #-8]!  

    //CHIMENEA
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x1, #560 
        mov x2, #248
        mov x3, #605 
        mov x4, #272
        bl draw_rectangle
        mov x1, #607 
        mov x2, #270
        mov x3, #0
        mov x4, #-20
        mov x5, #15
        mov x6, #-20
        bl draw_parallelogram
        mov x1, #598     
        mov x2, #220
        mov x3, #622 
        mov x4, #252
        bl draw_rectangle
        mov x1, #595     
        mov x2, #205
        mov x3, #625 
        mov x4, #222
        bl draw_rectangle
        mov x1, #600
        mov x2, #247
        mov x3, #620
        mov x4, #247
        bl draw_line

        movz x0, 0x10, lsl #16  // Color: #102653
	    movk x0, 0x2653, lsl #0
        mov x1, #560 
        mov x2, #250
        mov x3, #605 
        mov x4, #270
        bl draw_rectangle
        mov x1, #605 
        mov x2, #270
        mov x3, #0
        mov x4, #-20
        mov x5, #15
        mov x6, #-20
        bl draw_parallelogram
        mov x1, #600     
        mov x2, #222
        mov x3, #620 
        mov x4, #247
        bl draw_rectangle
        mov x1, #597     
        mov x2, #206
        mov x3, #623 
        mov x4, #220
        bl draw_rectangle

        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x1, #600
        mov x2, #249
        mov x3, #620
        mov x4, #249
        bl draw_line
        mov x1, #600
        mov x2, #249
        mov x3, #605
        mov x4, #270
        bl draw_line
    // ANANA
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x1, #468           // x0: coordenada x inicial
	    mov x2, #389           // y0: coordenada y inicial 
	    mov x3, #110           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-12           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        mov x1, #582          // x0: coordenada x inicial
	    mov x2, #389           // y0: coordenada y inicial 
	    mov x3, #-40               // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #12          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram
        mov x1, #456           // x0: coordenada x inicial
	    mov x2, #359           // y0: coordenada y inicial 
	    mov x3, #130           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-6           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        mov x1, #553          // x0: coordenada x inicial
	    mov x2, #359           // y0: coordenada y inicial 
	    mov x3, #42             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #6          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram

        mov x1, #450           // x0: coordenada x inicial
	    mov x2, #329           // y0: coordenada y inicial 
	    mov x3, #130           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-2           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        mov x1, #559          // x0: coordenada x inicial
	    mov x2, #329           // y0: coordenada y inicial 
	    mov x3, #42             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #2          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram
        mov x1, #448           // x0: coordenada x inicial
	    mov x2, #299           // y0: coordenada y inicial 
	    mov x3, #130           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #3           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        mov x1, #562          // x0: coordenada x inicial
	    mov x2, #299           // y0: coordenada y inicial 
	    mov x3, #40             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-3          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram
        mov x1, #451           // x0: coordenada x inicial
	    mov x2, #269           // y0: coordenada y inicial
	    mov x3, #110           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #9           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        mov x1, #559          // x0: coordenada x inicial
	    mov x2, #269           // y0: coordenada y inicial 
	    mov x3, #40             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-9          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram



        movz x0, 0xe0, lsl #16  // Color: #e06903 <- casa de bob
	    movk x0, 0x690e, lsl #0

        mov x1, #470           // x0: coordenada x inicial
	    mov x2, #389           // y0: coordenada y inicial 
	    mov x3, #110           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-12           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        
        //---------------------
        mov x1, #580          // x0: coordenada x inicial
	    mov x2, #389           // y0: coordenada y inicial 
	    mov x3, #-40               // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #12          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram


        mov x1, #458           // x0: coordenada x inicial
	    mov x2, #359           // y0: coordenada y inicial 
	    mov x3, #130           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-6           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        //---------------------
        mov x1, #551          // x0: coordenada x inicial
	    mov x2, #359           // y0: coordenada y inicial 
	    mov x3, #42             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #6          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram


        mov x1, #452           // x0: coordenada x inicial
	    mov x2, #329           // y0: coordenada y inicial 
	    mov x3, #130           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-2           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        //---------------------
        mov x1, #557          // x0: coordenada x inicial
	    mov x2, #329           // y0: coordenada y inicial 
	    mov x3, #42             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #2          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram


        mov x1, #450           // x0: coordenada x inicial
	    mov x2, #299           // y0: coordenada y inicial 
	    mov x3, #130           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #3           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        //---------------------
        mov x1, #560          // x0: coordenada x inicial
	    mov x2, #299           // y0: coordenada y inicial 
	    mov x3, #40             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-3          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram


        mov x1, #453           // x0: coordenada x inicial
	    mov x2, #269           // y0: coordenada y inicial
	    mov x3, #110           // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #9           // vx: vector v 
	    mov x6, #-30            // vy
	    bl draw_parallelogram
        //---------------------
        mov x1, #557          // x0: coordenada x inicial
	    mov x2, #269           // y0: coordenada y inicial 
	    mov x3, #40             // ux: vector u 
	    mov x4, #0             // uy
	    mov x5, #-9          // vx: vector v 
	    mov x6, #-30           // vy
	    bl draw_parallelogram

    // Parte de arriba
        movz x0, 0x0005, lsl #16  // Color
	    movk x0, 0x100A, lsl #0
        mov x3, #525
        mov x4, #265
        mov x5, #71      
        bl draw_fill_semi_circle

        movz x0, 0xe0, lsl #16  // Color: #e06903 <- casa de bob
	    movk x0, 0x690e, lsl #0
        mov x3, #525
        mov x4, #265
        mov x5, #69      
        bl draw_fill_semi_circle

    // Detalles del anana
        movz x0, 0x97, lsl #16  // Color: #972305
	    movk x0, 0x2305, lsl #0
        mov x1, #527
        mov x2, #197
        mov x3, #3
        mov x4, #-3
        mov x5, #70
        mov x6, #80
        bl draw_parallelogram

        mov x1, #477
        mov x2, #217
        mov x3, #3
        mov x4, #-3
        mov x5, #117
        mov x6, #130
        bl draw_parallelogram


        mov x1, #454
        mov x2, #267
        mov x3, #3
        mov x4, #-3
        mov x5, #109
        mov x6, #123
        bl draw_parallelogram

        mov x1, #455
        mov x2, #347
        mov x3, #3
        mov x4, #-3
        mov x5, #39
        mov x6, #43
        bl draw_parallelogram

    // INCL DERECHA

        mov x1, #543
        mov x2, #199
        mov x3, #3
        mov x4, #3
        mov x5, #-90
        mov x6, #70
        bl draw_parallelogram

        mov x1, #584
        mov x2, #232
        mov x3, #3
        mov x4, #3
        mov x5, #-130
        mov x6, #115
        bl draw_parallelogram

        mov x1, #599
        mov x2, #287
        mov x3, #1
        mov x4, #4
        mov x5, #-110
        mov x6, #100
        bl draw_parallelogram
    
        mov x1, #590
        mov x2, #366
        mov x3, #2
        mov x4, #2
        mov x5, #-27
        mov x6, #20
        bl draw_parallelogram

    // detalles cuadraditos
        mov x1, #534
        mov x2, #235
        mov x3, #538
        mov x4, #249
        bl draw_rectangle

        mov x1, #570
        mov x2, #272
        mov x3, #574
        mov x4, #286
        bl draw_rectangle

        mov x1, #531
        mov x2, #307
        mov x3, #535
        mov x4, #321
        bl draw_rectangle


        mov x1, #496
        mov x2, #271
        mov x3, #500
        mov x4, #285
        bl draw_rectangle

        mov x1, #459
        mov x2, #301
        mov x3, #463
        mov x4, #315
        bl draw_rectangle

        mov x1, #493
        mov x2, #342
        mov x3, #497
        mov x4, #356
        bl draw_rectangle

        mov x1, #528
        mov x2, #373
        mov x3, #532
        mov x4, #387
        bl draw_rectangle

        mov x1, #565
        mov x2, #348
        mov x3, #569
        mov x4, #362
        bl draw_rectangle

    // Ventana superior
        movz x0, 0x17, lsl #16  // Color
	    movk x0, 0x2740, lsl #0
        mov x3, #498
        mov x4, #252
        mov x5, #22
        bl draw_fill_circle

        movz x0, 0x45, lsl #16  // Color: #456BB9
	    movk x0, 0x6BB9, lsl #0
        mov x3, #498
        mov x4, #252
        mov x5, #20
        bl draw_fill_circle

        movz x0, 0x5E, lsl #16  // Color: #5EB5E7
	    movk x0, 0xB5E7, lsl #0
        mov x3, #498
        mov x4, #252
        mov x5, #10
        bl draw_fill_circle

        // Ventana inferior
        movz x0, 0x17, lsl #16  // Color
	    movk x0, 0x2740, lsl #0
        mov x3, #565
        mov x4, #310
        mov x5, #22
        bl draw_fill_circle

        movz x0, 0x45, lsl #16  // Color: #456BB9
	    movk x0, 0x6BB9, lsl #0
        mov x3, #565
        mov x4, #310
        mov x5, #20
        bl draw_fill_circle

        movz x0, 0x5E, lsl #16  // Color: #5EB5E7
	    movk x0, 0xB5E7, lsl #0
        mov x3, #565
        mov x4, #310
        mov x5, #10
        bl draw_fill_circle

        //Contorno de la puerta
        movz x0, 0x0005, lsl #16
	    movk x0, 0x100A, lsl #0
        mov x1, #500
        mov x2, #348
        mov x3, #552
        mov x4, #389
        bl draw_rectangle

        mov x3, #526
        mov x4, #352
        mov x5, #26
        bl draw_fill_semi_circle

        // Borde azulado puerta.
        movz x0, 0x2f, lsl #16
        movk x0, 0x3c9a, lsl #0
        mov x1, #501
        mov x2, #348
        mov x3, #551
        mov x4, #389
        bl draw_rectangle

        mov x3, #526
        mov x4, #352
        mov x5, #25
        bl draw_fill_semi_circle

        // Contorno puerta interior
        movz x0, 0x0005, lsl #16
	    movk x0, 0x100A, lsl #0
        mov x1, #506
        mov x2, #350
        mov x3, #546
        mov x4, #389
        bl draw_rectangle

        mov x3, #526
        mov x4, #354
        mov x5, #20
        bl draw_fill_semi_circle

        // Puerta.
        movz x0, 0x45, lsl #16
        movk x0, 0x6bb9, lsl #0
        mov x1, #507
        mov x2, #352
        mov x3, #545
        mov x4, #389
        bl draw_rectangle

        mov x3, #526
        mov x4, #354
        mov x5, #19
        bl draw_fill_semi_circle

        // Timón de la puerta.
        movz x0, 0x1e, lsl #16
        movk x0, 0x3253, lsl #0
        mov x3, #526
        mov x4, #365
        mov x5, #6
        bl draw_fill_circle

        // Manija superior derecha
        mov x1, #531
        mov x2, #360
        mov x3, #537
        mov x4, #354
        bl draw_line
        mov x1, #531
        mov x2, #359
        mov x3, #536
        mov x4, #354
        bl draw_line
        mov x1, #532
        mov x2, #360
        mov x3, #537
        mov x4, #355
        bl draw_line

        // Manija superior izquierda
        mov x1, #521
        mov x2, #360
        mov x3, #515
        mov x4, #354
        bl draw_line
        mov x1, #521
        mov x2, #359
        mov x3, #516
        mov x4, #354
        bl draw_line
        mov x1, #520
        mov x2, #360
        mov x3, #515
        mov x4, #355
        bl draw_line

        // Manija inferior izquierda
        mov x1, #521
        mov x2, #370
        mov x3, #516
        mov x4, #375
        bl draw_line
        mov x1, #520
        mov x2, #370
        mov x3, #516
        mov x4, #374
        bl draw_line
        mov x1, #521
        mov x2, #371
        mov x3, #517
        mov x4, #375
        bl draw_line

        // Manija inferior derecha
        mov x1, #531
        mov x2, #370
        mov x3, #536
        mov x4, #375
        bl draw_line
        mov x1, #532
        mov x2, #370
        mov x3, #536
        mov x4, #374
        bl draw_line
        mov x1, #531
        mov x2, #371
        mov x3, #535
        mov x4, #375
        bl draw_line

    ldr lr, [sp], #8
    ret
