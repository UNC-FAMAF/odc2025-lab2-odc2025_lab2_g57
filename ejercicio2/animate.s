    .globl draw_bubble


/* draw_bubble: dibuja una burbuja parametrizada, 
    con centro (x,y) donde x: x19; y: x20, y radio r: x21.
    ¡Cuidado!, No usar con radios muy grandes ni muy chicos (7<=r<=12).
*/
draw_bubble:   
    str x30, [sp, #-8]!
    stp x19, x20, [sp, #-16]!
    str x21, [sp, #-8]!

    // cargo parametros en los registros correspondientes
    mov x3, x19
    mov x4, x20 
    mov x5, x21 

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
    
    ldr x21, [sp], #8
    ldp x19, x20, [sp], #16
    ldr x30, [sp], #8
    ret         

