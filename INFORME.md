Nombre y apellido 
Integrante 1: Francisco Lopez Benavides
Integrante 2: Franco Javier Brizuela
Integrante 3: Gonzalo Cisnero
Integrante 4: Alé Prieto


Descripción ejercicio 1: A partir de funciones gráficas simples, armamos una escena que representa el barrio de Bob Esponja, incluyendo su casa, la de Calamardo y la de Patricio. Cada parte del dibujo se construyó combinando figuras básicas.


Descripción ejercicio 2: Utilizando las funciones ya definidas e implementando algunas nuevas, se animaron algunos elementos de la escena. En particular, se animan las burbujas, el caracol mascota de Bob Esponja, Gary, y una medusa, dándole vida y dinamismo al barrio.


Justificación instrucciones ARMv8:
bl (Branch with Link): Salta a una subrutina guardando la dirección de retorno en x30 (Link Register). Se usa para llamar funciones. En LEGv8: Tendría que guardar en x30 el lugar desde donde llamé la función. Luego hago un branch hasta la etiqueta (me muevo n instrucciones).
ret (RET): Salta al registro X30 (Link Register). Equivale a br x30 en LEGv8.
neg (NEGate): La instrucción NEG en ARMv8 se utiliza para negar un valor, es decir, para cambiar su signo. Funciona realizando la operación de complemento a dos sobre el operando fuente. Luego lo guarda en un registro. Su equivalencia en LEGv8 es sub X, xzr, X
cneg (Conditional Negate): Si la condición se cumple, niega el valor de un registro y lo guarda en otro. Si no se cumple, copia el valor sin modificar.
csel (Conditional SELect): Selecciona entre dos registros dependiendo del estado de los flags (N, Z, C, V) de la última operación que afectó flags.
csneg (Conditional Select NEGate):  Igual que csel, pero si la condición es verdadera, selecciona Xn (negado), si no, selecciona -Xm. CSNEG Xd, Xn Xm, cond.
stp (Store Pair): Guarda dos registros consecutivos en el stack de una sola vez. Útil para guardar los registros callee-saved.
ldp (Load Pair): Carga dos registros consecutivos en el stack de una sola vez. Se usa para restaurar los registros callee-saved.
madd (Multiply-Add): Multiplica dos registros y suma un tercero.  Xd = Xa + (Xn × Xm).

