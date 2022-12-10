## Preguntas orientadoras

### 1. Describa brevemente los diferentes perfiles de familias de microprocesadores/microcontroladores de ARM. Explique alguna de sus diferencias características.
Existen 3 tipos los cuales se diferencian especialmente en el area de aplicacion en el que se utilizan:

El **ARM Cortex-A** es un grupo de núcleos de procesador RISC ARM de 32 y 64 bits. Son rocesadores de alto rendimiento orientados a la implementación de
sistemas operativos en sistemas embebidos de alta performance

El **ARM Cortex-R** es una familia de núcleos de procesador RISC ARM de 32 y 64 bits. Son procesadores orientados a sistemas de tiempo real donde prima la necesidad de implementar soluciones de baja latencia y alta capacidad de procesamiento.

El **ARM Cortex-M** es un grupo de núcleos de procesador RISC ARM de 32 bits. Son procesadores orientados a dispositivos de consumo masivo y sistemas embebidos compactos 

## Cortex M
### 1. Describa brevemente las diferencias entre las familias de procesadores Cortex M0, M3 y M4.
#### ***Difererencias de instrucciones:***
* A diferencia de los demas, Cortex M4 tiene instrucciones de punto flotante y DSP y es la arquitectura que mas instrucciones tiene de las 3.
* A diferencia de Cortex M0, Cortex M3 tiene tareas de procesamiento de datos avanzado.
* Cortex M0 es la qe menos instrucciones tiene.

#### ***Difererencias de arquitecturas:***
* Cotex M4 es la unica que puede tener memoria cache.
* Cotex M4 es la unica con arquitectura Harvard.

#### ***Difererencias de extensiones:***
* Cortex M0 es la unica sin division de hardware y sin aritmetica saturada.


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
* Pasar datos a funciones o subrutinas
* Guardar variables locales
* Salvaguardar el estado del procesador y de los registros de propósito
general cuando ocurre una interrupción
* Guardar temporalmente el valor de registros previo a su reutilizació
### 11. Describa la secuencia de reset del microprocesador.
La duración de Power on reset y System reset depende del microcontrolador diseño. En algunos casos, el restablecimiento dura varios milisegundos, ya que el controlador de restablecimiento necesita esperar a que se estabilice una fuente de reloj, como un oscilador de cristal.
Después del reinicio y antes de que el procesador comience a ejecutar el programa, el Cortex-M los procesadores leen las dos primeras palabras de la memoria (Figura 4.30). El comienzo de
el espacio de memoria contiene la tabla de vectores, y las dos primeras palabras en la tabla de vectores son el valor inicial para el puntero de pila principal (MSP) y el vector de reinicio, que es la dirección inicial del controlador de restablecimiento. Después de que el procesador lea estas dos palabras, el procesador configura el MSP y el Contador de programa (PC) con estos valores.
La configuración del MSP es necesaria porque algunas excepciones como el NMI o el controlador HardFault podría ocurrir poco después del reinicio, y la memoria de pila y, por lo tanto, el MSP serán necesarios para llevar parte del estado del procesador a la pila antes del manejo de excepciones
### 12. ¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de los periféricos?
Los Core Peripherals son:

* Nested Vectored Interrupt Controller
* System Control Block
* System timer
* Memory Protection Unit
### 13. ¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo
Las primeras tres fuentes de IRQ tienen prioridades fijas y el resto pueden programarse hasta en 128 niveles de prioridad.
### 14. ¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?
El estándar de interfaz de software de microcontrolador común (CMSIS) es una capa de abstracción independiente del proveedor para microcontroladores que se basan en procesadores Arm Cortex. CMSIS define interfaces de herramientas genéricas y permite un soporte de dispositivo consistente. Las interfaces de software CMSIS simplifican la reutilización del software, reducen la curva de aprendizaje para los desarrolladores de microcontroladores y mejoran el tiempo de comercialización de nuevos dispositivos.

CMSIS proporciona interfaces para procesadores y periféricos, sistemas operativos en tiempo real y componentes de software intermedio. CMSIS incluye un mecanismo de entrega para dispositivos, placas y software, y permite la combinación de componentes de software de múltiples proveedores.
### 15. Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo
### 17. ¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?
### 16. Explique las características avanzadas de atención a interrupciones: tail chaining y late arrival.
* Tail-chaining es un procesamiento consecutivo de excepciones sin la sobrecarga de ahorro de estado y restauración entre interrupciones. El procesador omite el pop de ocho registros y el push de ocho registros cuando sale de un ISR y entra en otro porque esto no tiene efecto en el contenido de la pila.
El procesador se encadena si una interrupción pendiente tiene mayor prioridad que todas las excepciones apiladas.
* Una excepción que llega tarde provoca un cambio en la obtención de la dirección del vector y la obtención previa de la excepción. El ahorro de estado no se realiza para la excepción de llegada tardía porque ya se realizó para la excepción inicial y, por lo tanto, no es necesario repetirlo. En este caso, la ejecución comienza en el vector de la excepción que llega tarde mientras la excepción anterior permanece pendiente.
Si se reconoce una excepción de alta prioridad después de que haya comenzado la obtención del vector de la excepción original, la excepción que llega tarde no puede usar el contexto ya apilado para la excepción original. En este caso, el controlador de excepciones original se reemplaza y su contexto se guarda en la pila.

### 17. ¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la portabilidad de los sistemas operativos embebidos?
El procesador tiene un temporizador de sistema de 24 bits, SysTick, que cuenta regresivamente desde el valor de recarga hasta cero, recarga, es decir, salta al valor en el registro SYST_RVR en el siguiente borde del reloj, luego cuenta regresivamente en los relojes subsiguientes.
### 18. ¿Qué funciones cumple la unidad de protección de memoria (MPU)?
La MPU permite que el software privilegiado defina regiones de memoria y asigne permisos de acceso a la memoria y atributos de memoria a cada una de ellas. Dependiendo de la implementación del procesador, la cantidad de regiones de memoria admitidas variará. La MPU en los procesadores ARMv8-M admite hasta 16 regiones. Los atributos de memoria definen los comportamientos de ordenación y fusión de estas regiones, así como los atributos de almacenamiento en caché y almacenamiento en búfer. Los atributos de caché pueden ser utilizados por cachés internos, si están disponibles, y pueden exportarse para que los utilicen los cachés del sistema.
### 19. ¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las regiones definidas?
### 20. ¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto de las excepciones? Dé un ejemplo
PendSV es una solicitud de servicio a nivel del sistema impulsada por interrupciones. En un entorno de sistema operativo, use PendSV para cambiar de contexto cuando no haya ninguna otra excepción activa.
### 21. ¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un sistema operativo embebido.
Supervisor Call provoca una excepción de Supervisor Call. Para obtener más información, consulte Excepción de llamada de supervisor (SVC).

El software puede usar esta instrucción como una llamada a un sistema operativo para proporcionar un servicio.

## ISA
### 1. ¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo
Letras que se agregan a final del nombre de una instruccion como variante de la misma.
En el caso de ldr se puede agregar una 'b' para leer solo los 8 bits menos significativos en vez de leer los 32 bits.
### 2. ¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo
Para que el valor se extienda a 32 bits y mantenga el signo
### 3. ¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un ejemplo con operaciones con datos de 8 bits.
### 4. Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la pila antes de ser modificados?
+ Los argumentos se reciben en los registros r0,r1,r2,r3. 
+ El resultado se devuelve en el registro r0.

### 5. ¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un ejemplo.
SIMD (instrucción única, varios datos) proporciona compatibilidad de hardware para realizar una operación en varios fragmentos de datos, en paralelo, mediante una sola instrucción.