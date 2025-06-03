.global delay
/*  Función delay: Modifica el tiempo de delay con x8
    Inputs x8
    Outputs: None.
    Temporales: x9.
*/
fun_delay:
    str lr, [sp, #-8]!
    sub x9, x8, #1
    cbnz x9, delay
    ldr lr, [sp] #8
    ret