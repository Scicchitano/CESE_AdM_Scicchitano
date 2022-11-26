/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio7.h"


int32_t max (int32_t * vectorIn, uint32_t longitud)
{
	int32_t max = -1000;
	int32_t pos_max = 0;
	int i = 0;
	for (i = 0; i < longitud; i++) {
		if (vectorIn[i]>max) {
			max = vectorIn[i];
			pos_max=i+1;
		}
	}
	return pos_max;
}

