/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio3.h"

void productoEscalar16(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitud, uint16_t escalar){
	int i = 0;
	for (i = 0; i < longitud; i++) {
		*(vectorOut + i) = *(vectorIn + i)*escalar;
	}
}
