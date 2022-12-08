.syntax unified
.thumb
.text

@ Simbolos exportados
.global asm_zeros
.global asm_svc
.global asm_sum
.global asm_productoEscalar32
.global asm_max
.global asm_productoEscalar16
.global asm_productoEscalar12
.global asm_pack32to16


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_svc (void)
@
.thumb_func
    asm_svc:
        svc 0
        bx lr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   uint32_t asmSum (uint32_t firstOperand, uint32_t secondOperand)
@
@ Parametros recibidos:
@   r0: firstOperand
@   r1: secondOperand
@
@ Valor de retorno:
@   r0: resultado de la suma de firstOperand y secondOperand
@
.thumb_func
    asm_sum:
        add r0, r1  @ r0 = r0 + r1
        bx lr       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}






@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 1
@
@ Prototipo en "C":
@   void asm_zeros (uint32_t * vector, uint32_t longitud)
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector
@   r1: longitud
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_zeros:            @ Etiqueta/nombre de la función.
        mov r2, 0         @ r2 = 0
        asm_zeros_bucle:  @ Etiqueta de comienzo de bucle.
		    str r2, [r0]          @ Asigna 0 a la palabra en dirección r0.
		    add r0, 4             @ Pasa a la siguiente palabra/elemento en vector.
		    subs r1, 1            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_zeros_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).
    	bx lr                 @ La instrucción de salto no se ejecutó porque Z == 1, volvemos a quién nos llamó.



  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 2
@
@ Prototipo en "C":
@   void productoEscalar32(uint32_t * vectorIn, uint32_t * vectorOut, uint32_t longitud, uint32_t escalar)
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector de entrada
@   r1: dirección de memoria de inicio del vector de salida
@   r2: longitud
@   r3: escalar
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_productoEscalar32:            @ Etiqueta/nombre de la función.
        asm_productoEscalar32_bucle:  @ Etiqueta de comienzo de bucle.
        	ldr r5,[r0]
		    mul r4,r3,r5
			str r4,[r1]
		    add r0, 4             @ Pasa a la siguiente palabra/elemento en vector.
		    add r1, 4             @ Pasa a la siguiente palabra/elemento en vector.
		    subs r2, 1            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_productoEscalar32_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).
    	bx lr                 @ La instrucción de salto no se ejecutó porque Z == 1, volvemos a quién nos llamó.




   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 3
@
@ Prototipo en "C":
@   void productoEscalar16(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitud, uint16_t escalar)
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector de entrada
@   r1: dirección de memoria de inicio del vector de salida
@   r2: longitud
@   r3: escalar
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_productoEscalar16:            @ Etiqueta/nombre de la función.
        asm_productoEscalar16_bucle:  @ Etiqueta de comienzo de bucle.
		    ldr r5,[r0]
		    mul r4,r3,r5
			str r4,[r1]
		    add r0, 2             @ Pasa a la siguiente palabra/elemento en vector.
		    add r1, 2             @ Pasa a la siguiente palabra/elemento en vector.
		    subs r2, 1            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_productoEscalar16_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).
    	bx lr                 @ La instrucción de salto no se ejecutó porque Z == 1, volvemos a quién nos llamó.



     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 4
@
@ Prototipo en "C":
@   void productoEscalar12(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitud, uint16_t escalar)
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector de entrada
@   r1: dirección de memoria de inicio del vector de salida
@   r2: longitud
@   r3: escalar
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_productoEscalar12:            @ Etiqueta/nombre de la función.
    	mov r7,#0xFFF0			@Mascara de 12 bits
        asm_productoEscalar12_bucle:  @ Etiqueta de comienzo de bucle.
		    ldr r5,[r0]
		    mul r4,r3,r5
		    and r6,r5,r7		@aplico Mascara de 12 bits
			str r5,[r1]			@Guardo en r1 el resultado de la multiplicacion con la mascara aplicada
		    add r0, 2             @ Pasa a la siguiente palabra/elemento en vector.
		    add r1, 2             @ Pasa a la siguiente palabra/elemento en vector.
		    subs r2, 1            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_productoEscalar12_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).
    	bx lr                 @ La instrucción de salto no se ejecutó porque Z == 1, volvemos a quién nos llamó.



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 6
@
@ Prototipo en "C":
@   void pack32to16 (int32_t * vectorIn, int16_t *vectorOut, uint32_t longitud);
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector IN
@   r1: dirección de memoria de inicio del vector OUT
@   r2: longitud
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_pack32to16:            @ Etiqueta/nombre de la función.
        mov r2, 0         @ r2 = 0
        asm_pack32to16_bucle:  @ Etiqueta de comienzo de bucle.
		    lsr r1,r0,16		@r1= r0>>16
		    add r0, 4             @ Pasa a la siguiente palabra/elemento en vector.
		    add r1, 2             @ Pasa a la siguiente palabra/elemento en vector.
		    subs r2, 1            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_pack32to16_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).
    	bx lr




  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 7
@
@ Prototipo en "C":
@   int32_t max (int32_t * vectorIn, uint32_t longitud);
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector IN
@   r1: longitud
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_max:            @ Etiqueta/nombre de la función.
        mov r2, 0         @ r2 = -1000
        mov r3, 0         @ r3 = 0
        asm_max_bucle:  @ Etiqueta de comienzo de bucle.
        	ldr r4,[r0]
		    cmp r4,r2
		    bgt new_max		@Si r4>r2
		    new_max:
		    	ldr r2,[r0]
		    add r0, 4             @ Pasa a la siguiente palabra/elemento en vector.
		    subs r1, 1            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_max_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).
		ldr r0,[r2]
    	bx lr









