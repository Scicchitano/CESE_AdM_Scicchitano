/*
 * Ejercicio1.c
 *
 *  Created on: 8 nov. 2022
 *      Author: diego
 */

#include "Ejercicio5.h"

void filtroVentana10(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitudVectorIn)
{
    int suma = 0;
    uint32_t pos = 0;

    for (int i = 0; i < longitudVectorIn; i++) {
        suma = 0;

        for (int j = i; j < i + 5; j++) {
            if (j>=longitudVectorIn) {
				break;
			}
        }
    }
}

