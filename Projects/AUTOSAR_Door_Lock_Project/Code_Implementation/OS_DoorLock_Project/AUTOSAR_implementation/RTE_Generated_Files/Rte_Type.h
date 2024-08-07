/********************************************************************
 * Automatically generated by ARUnit
 * Filename: Rte_Type.h
 * Generated on: Sun Jul 21 19:31:3 EEST
 ********************************************************************/

#ifndef RTE_TYPE_H
#define RTE_TYPE_H


#include "Rte.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */
/**************************** datatypes ******************************/

typedef unsigned char My_uint8;


/********************* mode declaration groups ***********************/


/********************** per instance memories ************************/


/******************* implicit buffer declaration *********************/

typedef struct {
	My_uint8 value;
} Rte_DE_My_uint8;


/******************** component data structures **********************/

/*********************************************************************
 * component data structure for SWC: DoorLockIndication_SWC 
 *********************************************************************/
typedef struct Rte_CDS_DoorLockIndication_SWC
{
	/* Data Handles section*/
	/* Per-Instance Memory Handles section*/
	/* Inter-runnable Variable Handles section*/
	/* Calibration Parameter Handles section*/
	/* Exclusive-area Handles section*/
	/* Port API Handles section*/
	/* Inter Runnable Variable API Handles section*/
	uint8 _dummy;
} Rte_CDS_DoorLockIndication_SWC;

/*********************************************************************
 * component data structure for SWC: DoorSensorAbstraction 
 *********************************************************************/
typedef struct Rte_CDS_DoorSensorAbstraction
{
	/* Data Handles section*/
	Rte_DE_My_uint8 *Door_Get_state_PP_SR_door_state_DoorState;
	/* Per-Instance Memory Handles section*/
	/* Inter-runnable Variable Handles section*/
	/* Calibration Parameter Handles section*/
	/* Exclusive-area Handles section*/
	/* Port API Handles section*/
	/* Inter Runnable Variable API Handles section*/
} Rte_CDS_DoorSensorAbstraction;

/*********************************************************************
 * component data structure for SWC: Comp_PKG 
 *********************************************************************/
typedef struct Rte_CDS_Comp_PKG
{
	/* Data Handles section*/
	/* Per-Instance Memory Handles section*/
	/* Inter-runnable Variable Handles section*/
	/* Calibration Parameter Handles section*/
	/* Exclusive-area Handles section*/
	/* Port API Handles section*/
	/* Inter Runnable Variable API Handles section*/
	uint8 _dummy;
} Rte_CDS_Comp_PKG;


#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */

#endif /* RTE_TYPE_H */
