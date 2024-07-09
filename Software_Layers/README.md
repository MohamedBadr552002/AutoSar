#  Emergency Auto Breaking System (Case Study)
## User Store
Implement Emergency Auto Braking System by getting a lidar sensor info also get the speed from speed feedback sensor then
Create an algorithm based on calibration parameter for distance to decide which decision which taken form car 
* Give warning to the driver
* Decrease the speed
* Auto Breaking immediately

![image](https://github.com/MohamedBadr552002/AutoSar/assets/108628976/6c9aee1b-5abc-4abe-8115-a0b61fb3ccd1)

### Software Components

| Software Component | Type | Discription |
|---|---|---|
| SWC1 | Sensor Actuator | Get the distance from Libar sensor |
| SWC2 | Sensor Actuator | Get the current speed feedback |
| SWC3 | Application | Logical algorithm to define which decision will be taken |
| SWC4 | Parameter | Set the Constant value of the distance dynamically |
| SWC5 | Sensor Actuator | Warning the driver by a led |
| SWC6 | Complex driver device | Communicate with hardware directly for critical time functions |
| SWC7 | NV Block | Communicate with NV Manager |
| ECU SWC | ECU ABSTRACTION | Communicate with hardware |
| Dign SWC | SERVICE | Store the actions by the main algorithm |


### Interfaces 

![image](https://github.com/MohamedBadr552002/AutoSar/assets/108628976/3f20fcf2-e5fb-4828-a45b-e1820316ac54)

