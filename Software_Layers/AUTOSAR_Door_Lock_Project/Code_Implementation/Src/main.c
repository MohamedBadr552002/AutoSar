/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Mohamed Badr
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2023 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */


#if !defined(__SOFT_FP__) && defined(__ARM_FP)
#warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
#endif



#include "stm32f103c6.h"
#include "STM32F103C6_DRIVER_GPIO.h"
#include "keybad.h"
#include "LCD.h"
#include "7_segments.h"
#include "I2C_slave_EEPROM.h"
#include "Servo_Motor.h"
#include "STM32F103C6_DRIVER_EXTI.h"
#include "STM32F103C6_DRIVER_RCC.h"
#include "STM32F103C6_DRIVER_USART.h"
#include "STM32F103C6_DRIVER_SPI.h"
#include "STM32F103C6_DRIVER_I2C.h"
#include "STM32F103C6_DRIVER_TIMER.h"





#define CYCLES_PER_LOOP 3



void MCU_Init(void)
{

	RCC_GPIOA_CLK_EN();

	GPIO_pinConfig_t PinCfg_Door_Sensor;

	/* PA3 ---> Door Sensor */
	PinCfg_Door_Sensor.GPIO_PIN_NUMBER = GPIO_PIN3;
	PinCfg_Door_Sensor.GPIO_MODE = GPIO_MODE_INPUT_FLO;
	MCAL_GPIO_Init(GPIOA, &PinCfg_Door_Sensor);

	/* PA7 ---> Led On/OFF */
	PinCfg_Door_Sensor.GPIO_PIN_NUMBER = GPIO_PIN7;
	PinCfg_Door_Sensor.GPIO_MODE = GPIO_MODE_OUTPUT_PP;
	PinCfg_Door_Sensor.GPIO_OUTPUT_SPEED = GPIO_SPEED_10M;
	MCAL_GPIO_Init(GPIOA, &PinCfg_Door_Sensor);


}






void wait_cycles( uint32_t n ){
	uint32_t l = n/CYCLES_PER_LOOP;
	asm volatile( "0:" "SUBS %[count], 1;" "BNE 0b;" :[count]"+r"(l) );;


}


void StartOS(void){
	uint8_t i = 0;
	while(1){
		if(i==10){
			Door_Get_state_runnable();
			i++;
		}
		else if(i==12){
			DoorLockIndication_SWC_runable();
			i=0;
		}
		else{
			i++;
		}
		wait_cycles(10);
	}
}



int main()
{

	MCU_Init();
	StartOS();
    while(1)
    {


    }

    return 0;

}


