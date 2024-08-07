/********************************************************************
 * Mohamed Badr
 * Filename: DoorSensorAbstraction_.c
 * Generated on: Sun Jul 21 19:31:3 EEST
 ********************************************************************/

#include "RTE_Generated_Files/Rte_DoorSensorAbstraction.h"
#include "MCAL/DIO.h"

#define LEDON  1
#define LEDOFF 0

/*****************************************************
 * Port: 		PP_CS_led_switch
 * Interface:	IN_CS_LED
 * Operation:	led_switch
 *****************************************************/
 Std_ReturnType Led_Switch_Set_runnable(My_uint8 Led_state) {

	 if (Led_state == LEDON){
		 Dio_WriteChannel(LED_ID, LEDON);
	 }
	 else if (Led_state == LEDOFF)
	 {
		 Dio_WriteChannel(LED_ID, LEDOFF);
	 }else{
		 return RTE_E_IN_CS_LED_E_NOK;
	 }
	return  RTE_E_IN_CS_LED_E_OK;
 }



/*****************************************************
 * Runnable: 	Door_Get_state
 * Period:		0.01
 *****************************************************/
 void Door_Get_state_runnable(void){

	 uint8_t door_state =0;

	 door_state = Dio_ReadChannel(DIO_Door_ID);

	 Rte_IWrite_DoorSensorAbstraction_Door_Get_state_PP_SR_door_state_DoorState(door_state);
}
