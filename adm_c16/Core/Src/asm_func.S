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
.global asm_downsampleM
.global asm_invertir
.global asm_corr


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


  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 8
@
@ Prototipo en "C":
@   void downsampleM (int32_t * vectorIn, int32_t * vectorOut, uint32_t longitud, uint32_t N);
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector IN
@   r1: longitud
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_downsampleM:            @ Etiqueta/nombre de la función.
        mov r4, 0         @ i = 1
        mov r5, 0         @ x = 0
        asm_downsampleM_bucle:  @ Etiqueta de comienzo de bucle.
        	mul r7,r5,r3		@x*N
        	sub r7,r4,r7		@i-x*N
        	add r7,1			@i-x*N+1
        	cmp r7,r3
        	beq Multiplo		@Si r7=r3

        	cmp r7,r3
        	bne No_Multiplo		@Si r7!=r3

        	Multiplo:
	        	add r5,1	@x++
	        	add r0,4

        	No_Multiplo:
        		ldr r1,[r0]
	        	add r0,4
	        	add r1,4

			add r4,1
		    subs r2, 1            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_downsampleM_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).
    	bx lr





  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 9
@
@ Prototipo en "C":
@   void invertir (uint16_t * vector, uint32_t longitud)
@
@ Parametros recibidos:
@   r0: dirección de memoria de inicio del vector IN
@   r1: longitud
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_invertir:            @ Etiqueta/nombre de la función.
        mov r2, #0         @ aux = 0
        mov r3, #0         @ aux2 = 0
        mov r4, #0         @ i = 0
        mov r5,r0
        add r5,r1
        add r5,r1
        sub r5,2
        asm_invertir_bucle:  @ Etiqueta de comienzo de bucle.
        	ldrh r2,[r5]		@aux = vector[longitud-1-i];
        	ldrh r3,[r0]		@aux2 = vector[i];
        	strh r2,[r0]		@vector[i] = aux;
        	strh r3,[r5]		@vector[longitud-1-i] = aux2;




        	sub r5,2
        	add r0,2
		    subs r1, 2            @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_invertir_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).

    	bx lr





  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ EJERCICIO 10
@
@ Prototipo en "C":
@   void corr (int16_t *vectorX, int16_t * vector Y, int16_t vectorCorr, uint32_t longitud)
@
@ Parametros recibidos:
@   r0: dirección de memoria del vector x
@   r1: dirección de memoria del vector y
@   r2: dirección de memoria del vector correlacion
@   r3: longitud
.thumb_func               @ Se avisa al emsablador que esta es una funcion
    asm_corr:            @ Etiqueta/nombre de la función.
		mov r4, #0         @ i = 0
		mov r6,r0
		mov r7,r1
        asm_corr_bucle:  @ Etiqueta de comienzo de bucle.
        	mov r9, #0         @ n = 0
        	corr_bucle_sumatoria:
        		sub r5,r3,r4	@N-i
				mul r8,r6,r7
				add r2,r2,r8

				add r9,1
				cmp r9,r3
				bne corr_bucle_sumatoria		@Si N!=n

			mov r7,r1
			sub r7,r4	@y[n−i/2]
			sub r7,r4	@y[n−i]

			add r2,1			@i++
		    subs r3, 1           @ Resta 1 a la cantidad de elementos y actualiza flags de estado del procesador. En particular, estamos interesados en el flag Z.
		    bne asm_corr_bucle   @ La instrucción se ejecuta mientras el resultado de r1 - 1 no sea cero (Z == 0).

    	bx lr







