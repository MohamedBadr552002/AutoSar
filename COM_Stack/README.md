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

![image](https://github.com/user-attachments/assets/ffddefee-b216-4741-ab6d-d530962a7def)


![image](https://github.com/user-attachments/assets/a7c5dc72-4556-4a9f-bee2-1a11385694fc)


## Signal Vs Signal group
### Signal 
A signal is the smallest unit of data that can be transmitted over the CAN bus, It represents a specific piece of information Each signal has a defined length in bits and a specific position within a CAN message.

### Signal Group
A signal group is a collection of signals that are logically grouped together, This grouping can be based on the functionality or the source of the signals.

## I-PDU, N-PDU and L-PDU
#### PDU = SDU & PCI
* SDU represents the data slated for transmission
* PCI holds crucial information regarding the next destination of the SDU.it includes details about the source and destination of the SDU.

#### Whenever the PDU is in layers above the Communication Hardware Abstraction layer then it's called I-PDU.

#### Whenever the PDU is in layers below PDUR and above the Communication Drivers layer then it's called N-PDU.

#### Whenever the PDU is below Communication Hardware Abstraction then it's called L-PDU.


## COM Module Features

### Transmission modes (Pdu level)
`1- Direct Mode:` Sending Data immediately without any time constraints or scheduling when it triggered by SWCs.

`2- Periodic Mode:` Data transmission occurs at regular intervals, predetermined by timing parameters. This mode is suitable for periodic data updates.

`3- Mixed:` A combination of Direct and periodic.

### Transfer property (Signal level)
`1- Triggered: ` The transmission of the message is triggered if the signal is written regardless of the signal value.

`2- Triggered On Change: ` The transmission is triggered only if the value of message has been changed.

`3- Repetition : ` Means that the message sent many times when it triggered.

`3- Pending: ` Data Transmission is delayed untill certain conditions.


### Example Lab1 For Direct Mode

![image](https://github.com/user-attachments/assets/bca3394d-8cdf-4c9d-a7c9-8babeb086bc0)

![Screenshot 2024-08-17 142219](https://github.com/user-attachments/assets/921316be-d5ec-4f0c-bbe3-bb08321e4948)


