/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio6.h"


void pack32to16 (int32_t * vectorIn, int16_t *vectorOut, uint32_t longitud)
{
	int i = 0;
	for (i = 0; i < longitud; i++) {
		*(vectorOut + i) = (uint16_t) (((*(vectorIn + i)) >> 16) & 0xff);
	}
}

