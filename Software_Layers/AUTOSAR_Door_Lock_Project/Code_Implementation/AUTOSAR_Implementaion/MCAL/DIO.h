/*
 * DIO.h
 *
 *  Created on: Jul 20, 2024
 *      Author: Mohamed
 */

#ifndef DIO_H_
#define DIO_H_

#include "STM32F103C6_DRIVER_GPIO.h"

unsigned char Dio_ReadChannel(unsigned char ID);
void Dio_WriteChannel(unsigned char ID,unsigned char Level);


#define USED_PORT	GPIOA

#define LED_PIN		GPIO_PIN7
#define DOOR_PIN	GPIO_PIN3


#define LEDON	0
#define LEDOFF	1

#endif /* DIO_H_ */
