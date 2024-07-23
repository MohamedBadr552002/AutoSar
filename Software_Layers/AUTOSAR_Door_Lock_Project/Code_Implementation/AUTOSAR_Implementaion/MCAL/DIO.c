/*
 * DIO.c
 *
 *  Created on: Jul 20, 2024
 *      Author: Mohamed
 */

#include "DIO.h"


unsigned char Dio_ReadChannel(unsigned char ID){

	return MCAL_GPIO_Readpin(USED_PORT, ID);
}


void Dio_WriteChannel(unsigned char ID,unsigned char Level){
	MCAL_GPIO_Writepin(USED_PORT, ID, Level);
}
