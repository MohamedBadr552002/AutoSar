# Door Lock Indication Project Based on Autosar

## User Story 
Design and Implement a Door Lock Indication System based on Autosar specification, Read the Door state and take an action based on that state
if the door is open, Turn on a led if not tuen that led off.

## System Design

![DoorLook_Ind](https://github.com/user-attachments/assets/7038862c-1c98-4880-93b5-1c230d8646eb)

### 1- RTE Layer
* Design Software Components:
  * Ports
  * Interfaces
  * Data Types
  * Internal Behaviour
  * Runnables
  * RTE Events
    
![image](https://github.com/user-attachments/assets/d94e6d4d-88e8-44c3-b9d8-4a8d472be02c)

* Write ARXML Configuration Packages
  
[See Files from here](https://github.com/MohamedBadr552002/AutoSar/tree/main/Projects/AUTOSAR_Door_Lock_Project/AUTOSAR%20ARXML%20Packages)

### 2- OSEK/VDX Configuration
* Map RTE Runnables to OS Tasks and Events
* Implement System tasks

[See Implementation from here](https://github.com/MohamedBadr552002/AutoSar/tree/main/Projects/AUTOSAR_Door_Lock_Project/Code_Implementation/OS_DoorLock_Project/AUTOSAR_implementation)

## Testing and Validation

![Screenshot 2024-08-07 174902](https://github.com/user-attachments/assets/a1376d61-a65a-4da1-b521-4de8c3e817f2)

![Screenshot 2024-08-07 174928](https://github.com/user-attachments/assets/b24ee173-4910-40a6-bf41-af82a1b31035)

![Screenshot 2024-07-23 150023](https://github.com/user-attachments/assets/1741ca2d-5222-413e-b59c-c96aab5dcd36)

![Screenshot 2024-07-23 150041](https://github.com/user-attachments/assets/5b07a07e-d63f-447b-bdb8-e1ed4e070dda)


