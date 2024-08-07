/********************************************************************
 * Automatically generated by ARUnit
 * Filename: Rte_DoorSensorAbstraction.h
 * Generated on: Sun Jul 21 19:31:3 EEST
 ********************************************************************/

#ifndef RTE_DOORSENSORABSTRACTION_H
#define RTE_DOORSENSORABSTRACTION_H

#include "Rte_DoorSensorAbstraction_Type.h"

#ifdef __cplusplus
	extern "C" {
#endif /* __cplusplus */

/**************** component data structure definition ****************/

#ifndef IN_RTE_C
typedef const Rte_CDS_DoorSensorAbstraction * const Rte_Instance;
#endif

/************************* instance handle ***************************/

extern const Rte_CDS_DoorSensorAbstraction * const Rte_Inst_DoorSensorAbstraction;

/************************ application errors *************************/

#define RTE_E_IN_CS_LED_E_OK ((Std_ReturnType)0)
#define RTE_E_IN_CS_LED_E_NOK ((Std_ReturnType)1)

/*************************** init values *****************************/


/****************** per instance memory definition *******************/


/************************* exclusive areas ***************************/


/************************* RTE API mapping ***************************/

/*****************************************************
 * Port: 		PP_SR_door_state
 * Interface:	IN_SR_DoorLock
 * DataElement:	DoorState
 * Runnable:	Door_Get_state
 *****************************************************/
extern void Rte_IWrite_DoorSensorAbstraction_Door_Get_state_PP_SR_door_state_DoorState (My_uint8 DoorState);
#ifndef IN_RTE_C
#define Rte_IWrite_Door_Get_state_PP_SR_door_state_DoorState(RTEData) \
	Rte_IWrite_DoorSensorAbstraction_Door_Get_state_PP_SR_door_state_DoorState(RTEData)
#endif
extern My_uint8* Rte_IWriteRef_DoorSensorAbstraction_Door_Get_state_PP_SR_door_state_DoorState(void);
#ifndef IN_RTE_C
#define Rte_IWriteRef_Door_Get_state_PP_SR_door_state_DoorState() \
	Rte_IWriteRef_DoorSensorAbstraction_Door_Get_state_PP_SR_door_state_DoorState()
#endif

/*****************************************************
 * Port: 		PP_CS_led_switch
 * Interface:	IN_CS_LED
 * Operation:	led_switch
 *****************************************************/
extern Std_ReturnType Led_Switch_Set_runnable(My_uint8 Led_state) ;


/**************** event triggered runnable entities *******************/

/*****************************************************
 * Runnable: 	Door_Get_state
 * Period:		0.01
 *****************************************************/
extern void Door_Get_state_runnable(void);


/******** ARUnit-specific function pointers for server call delegates *********/


#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */

#endif /* RTE_DOORSENSORABSTRACTION_H */