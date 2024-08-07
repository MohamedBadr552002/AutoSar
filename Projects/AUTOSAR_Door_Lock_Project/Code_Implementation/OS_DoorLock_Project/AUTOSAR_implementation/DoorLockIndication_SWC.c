/********************************************************************
 * Mohamed Badr
 * Filename: DoorLockIndication_SWC_.c
 * Generated on: Sun Jul 21 19:31:3 EEST
 ********************************************************************/

#include "RTE_Generated_Files/Rte_DoorLockIndication_SWC.h"

#define LEDON  1
#define LEDOFF 0


/* Implement the main logic Algorithm to define the action must be taken*/
void DoorLockIndication_SWC_runable(void){

	unsigned char door_state =0;

	Rte_Read_DoorLockIndication_SWC_RP_SR_door_state_DoorState(&door_state);

	if(door_state){
		Rte_Call_DoorLockIndication_SWC_RP_CS_ledControl_led_switch(LEDON);
	}else{
		Rte_Call_DoorLockIndication_SWC_RP_CS_ledControl_led_switch(LEDOFF);
	}


}
