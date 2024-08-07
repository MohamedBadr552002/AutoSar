/*
 * AUTOSAR IN Depth Materials
 * www.learn-in-depth.com
 * Eng.Mohamed Badr
 * badr89270@gmail.com
 *
 */



//    PA15   (*(unsigned int*)(0x40020014)) >> 15
//    PB15   (*(unsigned int*)(0x40020414)) >> 15
//    PC15   (*(unsigned int*)(0x40020814)) >> 15
//    PD15:  (*(unsigned int*)(0x40020C14)) >> 15


#define GPIOA_MODER (*(volatile uint32_t*)(0x40020000)) // GPIOA Mode Register address
#define RCC_AHB1ENR (*(volatile uint32_t*)(0x40023830)) // RCC AHB1 peripheral clock enable register address
#define RCC_AHB1ENR_GPIOAEN (1 << 0) // GPIOA clock enable bit


#include "tp.h"
#include "tpl_os.h"

uint8_t OIE_LED;

void init_GPIOA_PIN0_as_input(void) {
	// Enable GPIOA clock
	RCC_AHB1ENR |= RCC_AHB1ENR_GPIOAEN;

	// Configure GPIOA PIN 0 as input (00 in MODER register for pin 0)
	GPIOA_MODER &= ~(3UL << (0 * 2)); // Clear the 2 bits corresponding to pin 0
}


//simple mydelay function
void mydelay(unsigned int ms)
{
	unsigned int i;
	for(i=0;i<ms;i++)
	{
	}
}
FUNC(int, OS_APPL_CODE) main(void)
{
	initBoard();
	init_GPIOA_PIN0_as_input();
	StartOS(OSDEFAULTAPPMODE);
	return 0;
}


//-------------------------------------------
/* Task Name : RteTaskCyclicTask
 * Job : This task is responsible for invoking both Read Door State runnable and main decision which apply to client-server port
 * Caller : Based on OS timer each 10ms
 * */
#define APP_Task_RteTaskCyclicTask_START_SEC_CODE
#include "tpl_memmap.h"
TASK(RteTaskCyclicTask)
{
	EventMaskType  revievedEvent ;
	while(1){
		WaitEvent(OSEvent_10ms);
		GetEvent(RteTaskCyclicTask , &revievedEvent);
		if((revievedEvent & OSEvent_10ms) == OSEvent_10ms){

			// Clear the event
			ClearEvent(OSEvent_10ms);
			// Call Runnables
			Door_Get_state_runnable(); //Get door state (Open or close)
			//to define the action which must be taken call this runnable
			DoorLockIndication_SWC_runable();

		}

	}

	TerminateTask();

}
#define APP_Task_RteTaskCyclicTask_STOP_SEC_CODE
#include "tpl_memmap.h"



/* Task Name : RteTaskOIE
 * Job : This task is responsible for Operation invoked event for client-server Port to do specific operation
 * Caller : Based on client-server inoked event operation
 * */
#define APP_Task_RteTaskOIE_START_SEC_CODE
#include "tpl_memmap.h"
TASK(RteTaskOIE)
{
	EventMaskType  revievedEvent ;
	while(1){
		WaitEvent(OSOIEvent);
		GetEvent(RteTaskOIE , &revievedEvent);
		if((revievedEvent & OSOIEvent) == OSOIEvent){

			// Clear the event
			ClearEvent(OSOIEvent);
			// Run the runnable
			Led_Switch_Set_runnable(OIE_LED);
		}

	}

	TerminateTask();

}
#define APP_Task_RteTaskOIE_STOP_SEC_CODE
#include "tpl_memmap.h"

/*
 * This is CALLBACK function used to set an event to switch the led based on its state
 * */

void Rte_Call_DoorLockIndication_SWC_RP_CS_ledControl_led_switch_Set_Event(door_state){

	OIE_LED = door_state;

	SetEvent(RteTaskOIE,OSOIEvent);
}

//-------------------------------------------

/*
 *  * This is necessary for ST libraries
 *   */
FUNC(void, OS_CODE) assert_failed(uint8_t* file, uint32_t line)
		{
		}

