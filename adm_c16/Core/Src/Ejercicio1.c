/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio1.h"
void zeros (uint32_t * vector, uint32_t longitud){
	int i = 0;
	for (i = 0; i < longitud; i++) {
		*(vector + i) = 0;
	}
}
