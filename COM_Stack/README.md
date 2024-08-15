# Autosar Communication Stack 

![Com Stack](https://github.com/user-attachments/assets/92641650-6f0e-4b67-87a7-92a3303fca02)

the communication stack divided into two main paths:
* the Data Path 
* the Network Control Path

![Com Stack (1)](https://github.com/user-attachments/assets/3cef4999-302d-412e-bf68-7826ebfad678)


## The Network Control Path

### COMM (Communication Manager):
* Manages overall communication scheduling and state transitions.
* Ensures communication modules are correctly initialized
#### Example
you want to transitioning from startup to normal communication mode

* Initial Startup:
1) The vehicle is powered on
2) the `COMM` initializes all communication-related modules
3) the `COMM` ensure that the COM, PduR, and CanIF modules are ready for operation

* Transision to normal Operation:
1) `COMM` Change the state of communication modules from initization state to the normal operation state.
2) `COMM` Sets up the schedule for periodoc messages, ensuring that they are sent at the correct intervals.

* Handling State Transitions:
It the Vehicle is switched to a low-power mode 
1)  the `COMM` manages notifying all relevant modules to reduce power consumption.
2)  Also ensure that communication modules enter a standby mode and stop sending the periodic messages.

### NM (Network Management):
* Handles the startup, synchronization, and shutdown of the network.
* Ensure that all nodes are synchronized and operate correctly.
#### Examole
Staring and Stopping CAN Network

* Network Startup:
1) When vehicle is trunned on, `NM` initiates the startup sequence for CAN network
2) `NM` Send weakup message to all nodes making sure for Ready communication.

* Network Synchronization:
1) `NM` monitors the network to ensure all nodes are synchronized.
2) If there's a node is not responding, `NM` reinitiate or notify the system for an issue.

* Network Shutdown:
1) When Vehicle is turned off, `NM` sends a sleep command to all nodes in the network.
2) Reduce the consumed power from nodes as possible.

### BUS SM (State Manager):
Manages the states of the communication bus, particularly during errors.
#### Example
Managing the bus state during a communication error.

* Normal Operation;
1) `BUS SM` ensures that can bus is in the operational state.

* Error Detection:
1) If a communication error is detected, `BUS SM` takes actions to handle the error.
2) It transition the bus to an ERROR state, notifying all modules of the issue.

* Recovery:
1) `BUS SM` Manages the recovery peocess by attempting to reset the bus.
2) Once the error is cleared, `BUS SM` transitions the bus back to normal operation state.



### BUS NM (Network Management):
* Coordinates network management messages and monitors node status on the CAN bus.
* Similar to NM, focuses on network management tasks specifically for the communication bus.

#### Example
Corrdinating network managment messages

* Network coordination:
1) `BUS NM` ensures that network management messages are correctly
2) It manages messages such as node status, network availability, and synchronization.

* Node Monitoring:
1) `BUS NM` monitors the status of all nodes on CAN bus.
2) If a node fails to respond, `BUS NM` retries the message or triggers a diagnostic routine.

* Network Reconfiguration:
1) If a node is added to network,  `BUS NM` handles the reconfiguration process.
2) It updates the network configuration and ensures that all nodes are correctly integrated.


## The Data Path 
The Data Path involves the flow of data (signals) from the application layer down to the bus and vice versa.

### COM
* Handling the packing and unpacking of the signals and signal groups.
* Interface between the application layer and the PduR (PDU Router)

### PDU Router (pduR)
Routes the messages between different communication modules like CAN, LIN, FlxRay.

### Transport Protocol (BUS TP)
Handled the large PDUs across Manages the segmentation and reassembly of PDUs that exceed the maximum frame size.

### BUS IF
Handling hardware abstraction and manages the frames to provides a unified interface for accessing the CAN Driver.

### BUS Driver
Responsible for aTransmitting and Recieving data Over the CAN Network.

## AUTOSAR COM Stack Example on CAN module

![Com_Stack_CAN drawio](https://github.com/user-attachments/assets/a8ab4a94-1b70-456f-ac07-8cc614862aa9)