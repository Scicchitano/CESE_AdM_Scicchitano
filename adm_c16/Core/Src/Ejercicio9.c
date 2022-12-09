/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio9.h"


void invertir (uint16_t * vector, uint32_t longitud)
{
	//uint16_t vector[10] = {2,3,6,5,4,3,2,7,8,3};
	uint16_t aux = 0;
	for (int i = 0; i < longitud/2; i++) {
		aux = vector[i];
		vector[i] = vector[longitud-1-i];
		vector[longitud-1-i] = aux;
	}
}

