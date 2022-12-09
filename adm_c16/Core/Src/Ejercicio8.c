/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio8.h"


void downsampleM (int32_t * vectorIn, int32_t * vectorOut, uint32_t longitud, uint32_t N)
{
	int i = 0;
	int x = 0;
	for (i = 0; i < longitud; i++) {
		if ((i+1-x*N)!=N) {
			vectorOut[i-x] = vectorIn[i];
		}else{
			x++;
		}
	}
}

