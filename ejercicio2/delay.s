.global delay
.equ INNER_LOOP_ITERATIONS, 0x0f00000


/*  Función delay: Crea un retardo basado en el valor de x8
    Inputs: x9 - numero de iteraciones para el retardo
    Outputs: None
    Temporales: x10
*/
delay:
    cbz x9, end_delay
    mov x10, INNER_LOOP_ITERATIONS
delay_loop:
    subs x10, x10, #1
    b.ne delay_loop
    sub x9, x9, #1
    b delay
end_delay:
    ret
    