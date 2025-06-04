.global delay


/*  Función delay: Crea un retardo basado en el valor de x8
    Inputs: x8 - numero de iteraciones para el retardo
    Outputs: None
    Temporales: x9
*/
delay:
    str lr, [sp, #-8]!      // Guardar lr en la pila
    mov x9, x8              // Copiar x8 a x9 para usarlo como contador
delay_loop:
    subs x9, x9, #1         // Decrementar x9 y actualizar flags
    b.ne delay_loop         // Si x9 no es cero, volver a delay_loop
    ldr lr, [sp], #8        // Restaurar lr y ajustar la pila
    ret
