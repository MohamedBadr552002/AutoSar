/********************************************************************
 * Automatically generated by ARUnit
 * Filename: Rte_DoorLockIndication_SWC.h
 * Generated on: Sun Jul 21 19:31:3 EEST
 ********************************************************************/

#ifndef RTE_DOORLOCKINDICATION_SWC_H
#define RTE_DOORLOCKINDICATION_SWC_H

#include "Rte_DoorLockIndication_SWC_Type.h"

#ifdef __cplusplus
	extern "C" {
#endif /* __cplusplus */

/**************** component data structure definition ****************/

#ifndef IN_RTE_C
typedef const Rte_CDS_DoorLockIndication_SWC * const Rte_Instance;
#endif

/************************* instance handle ***************************/

extern const Rte_CDS_DoorLockIndication_SWC * const Rte_Inst_DoorLockIndication_SWC;
extern void Rte_Call_DoorLockIndication_SWC_RP_CS_ledControl_led_switch_Set_Event(uint8_t Led_Switch);

/************************ application errors *************************/

#define RTE_E_IN_CS_LED_E_OK ((Std_ReturnType)0)
#define RTE_E_IN_CS_LED_E_NOK ((Std_ReturnType)1)

/*************************** init values *****************************/


/****************** per instance memory definition *******************/


/************************* exclusive areas ***************************/


/************************* RTE API mapping ***************************/

/*****************************************************
 * Port: 		RP_SR_door_state
 * Interface:	IN_SR_DoorLock
 * DataElement:	DoorState
 *****************************************************/
extern Std_ReturnType Rte_Read_DoorLockIndication_SWC_RP_SR_door_state_DoorState (My_uint8* DoorState);
#ifndef IN_RTE_C
#define Rte_Read_RP_SR_door_state_DoorState(RTEData) \
	Rte_Read_DoorLockIndication_SWC_RP_SR_door_state_DoorState(RTEData)
#endif

/*****************************************************
 * Port: 		RP_CS_ledControl
 * Interface:	IN_CS_LED
 * Operation:	led_switch
 * Sync/Async:	Synchronous
 *****************************************************/
extern Std_ReturnType Rte_Call_DoorLockIndication_SWC_RP_CS_ledControl_led_switch (My_uint8 door_state);
#ifndef IN_RTE_C
#define Rte_Call_RP_CS_ledControl_led_switch(door_state) \
	Rte_Call_DoorLockIndication_SWC_RP_CS_ledControl_led_switch(door_state)
#endif

/**************** event triggered runnable entities *******************/

/*****************************************************
 * Runnable: 	DoorLockIndication_SWC
 * Period:		0.01
 *****************************************************/

extern void DoorLockIndication_SWC_runable(void);

/******** ARUnit-specific function pointers for server call delegates *********/
typedef Std_ReturnType (*FunctionPtr_DoorLockIndication_SWC_RP_CS_ledControl_led_switch)(My_uint8 door_state);


#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */

#endif /* RTE_DOORLOCKINDICATION_SWC_H */
