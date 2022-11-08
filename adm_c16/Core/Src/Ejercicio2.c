/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio2.h"

void productoEscalar32(uint32_t * vectorIn, uint32_t * vectorOut, uint32_t longitud, uint32_t escalar){
	int i = 0;
	for (i = 0; i < longitud; i++) {
		*(vectorOut + i) = *(vectorIn + i)*escalar;
	}
}
