## Preguntas orientadoras

### 1. Describa brevemente los diferentes perfiles de familias de microprocesadores/microcontroladores de ARM. Explique alguna de sus diferencias características.
Existen 3 tipos los cuales se diferencian especialmente en el area de aplicacion en el que se utilizan:

El **ARM Cortex-A** es un grupo de núcleos de procesador RISC ARM de 32 y 64 bits. Son rocesadores de alto rendimiento orientados a la implementación de
sistemas operativos en sistemas embebidos de alta performance

El **ARM Cortex-R** es una familia de núcleos de procesador RISC ARM de 32 y 64 bits. Son procesadores orientados a sistemas de tiempo real donde prima la necesidad de implementar soluciones de baja latencia y alta capacidad de procesamiento.

El **ARM Cortex-M** es un grupo de núcleos de procesador RISC ARM de 32 bits. Son procesadores orientados a dispositivos de consumo masivo y sistemas embebidos compactos 

## Cortex M
### 1. Describa brevemente las diferencias entre las familias de procesadores Cortex M0, M3 y M4.
### 2. ¿Por qué se dice que el set de instrucciones Thumb permite mayor densidad de código? Explique
Porque el set de instrucciones Thumb son de 16 bits. Por lo tanto en el mismo espacio de memoria entran mas instrucciones Thumb que en una arquitectura de 32 bits.
### 3. ¿Qué entiende por arquitectura load-store? ¿Qué tipo de instrucciones no posee este tipo de arquitectura?

En la arquitectura load-store, para que las instrucciones puedan ser operadas, las mismas deben ser leidas de la memoria SRAM y guardar los resultados en un registro

### 4. ¿Cómo es el mapa de memoria de la familia?

El mapa de memoria es plano de 4 GB y esta dividido por distintos rangos de memoria que contienen informacion de el codigo, los perifericos, SRAM, RAM externa, dispositivos externos, entre otros.

### 5. ¿Qué ventajas presenta el uso de los “shadowed pointers” del PSP y el MSP?

### 6. Describa los diferentes modos de privilegio y operación del Cortex M, sus relaciones y como se conmuta de uno al otro. Describa un ejemplo en el que se pasa del modo privilegiado a no priviligiado y nuevamente a privilegiado.

El programa se inicia en modo Thread privilegiado. Luego por SW se puede pasar al modo Thread no privilegiado.
Las interrupciones se ejecutan en modo Handler. El modo Handler siempre es privilegiado es decir que en el contexto de interrupcion, siempre voy a tener acceso a todos los perifericos.
Cuando se termina de ejecutar la interrupcion, el procesador vuelve a la funcion en la que estaba, es decir que vuelve al modo en el que estaba.

### 7. ¿Qué se entiende por modelo de registros ortogonal? Dé un ejemplo
Todos los registros se pueden utilizar para cualquier instruccion. Son de proposito general. Es decir los registros puedes ser utilizados tanto para guardar datos como operandos. Es decir, el manual no especifica que registros usar para alguna determinada operacion.

### 8. ¿Qué ventajas presenta el uso de intrucciones de ejecución condicional (IT)? Dé un ejemplo
La ventaja es que no te que hacer un salto conficional como con un if. ENTONCES EL PIPELINE MANTIENE SU REGIMEN EJECUTANDO UNA INSTRUCCION POR CICLO.
Por ejemplo, si se agrega el sufijo NE, la instruccion se ejecutara si el flag de estado Z es 1
### 9. Describa brevemente las excepciones más prioritarias (reset, NMI, Hardfault).
Reset es cuando se reinicia el microcontrolador.
El NMI es una interrupcion no enmascarable que se dispara cuando ocurre una interrupcion de hardware que advierte el error de una señal que no puede ser salvado.
Hardfault es cualquier tipo de contexto que ponga al microcontrolador en estado de falta.

### 10. Describa las funciones principales de la pila. ¿Cómo resuelve la arquitectura el llamado a funciones y su retorno?
### 11. Describa la secuencia de reset del microprocesador.
### 12. ¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de los periféricos?
### 13. ¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo
### 14. ¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?
### 15. Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo
### 17. ¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?
### 16. Explique las características avanzadas de atención a interrupciones: tail chaining y late arrival.
### 17. ¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la portabilidad de los sistemas operativos embebidos?
### 18. ¿Qué funciones cumple la unidad de protección de memoria (MPU)?
### 19. ¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las regiones definidas?
### 20. ¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto de las excepciones? Dé un ejemplo
### 21. ¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un sistema operativo embebido.

## ISA
### 1. ¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo
Letras que se agregan a final del nombre de una instruccion como variante de la misma.
En el caso de ldr se puede agregar una 'b' para leer solo los 8 bits menos significativos en vez de leer los 32 bits.
### 2. ¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo
Para que el valor se extienda a 32 bits y mantenga el signo
### 3. ¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un ejemplo con operaciones con datos de 8 bits.
### 4. Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la pila antes de ser modificados?
### 5. ¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un ejemplo.
