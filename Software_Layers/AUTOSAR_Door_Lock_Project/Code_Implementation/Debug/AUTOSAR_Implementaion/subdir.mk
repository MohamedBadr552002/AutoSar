################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../AUTOSAR_Implementaion/DoorLockIndication_SWC.c \
../AUTOSAR_Implementaion/DoorSensorAbstraction.c 

OBJS += \
./AUTOSAR_Implementaion/DoorLockIndication_SWC.o \
./AUTOSAR_Implementaion/DoorSensorAbstraction.o 

C_DEPS += \
./AUTOSAR_Implementaion/DoorLockIndication_SWC.d \
./AUTOSAR_Implementaion/DoorSensorAbstraction.d 


# Each subdirectory must supply rules for building sources it contributes
AUTOSAR_Implementaion/%.o AUTOSAR_Implementaion/%.su AUTOSAR_Implementaion/%.cyclo: ../AUTOSAR_Implementaion/%.c AUTOSAR_Implementaion/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/HAL/includes" -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/STM32F103C6_DRIVER/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-AUTOSAR_Implementaion

clean-AUTOSAR_Implementaion:
	-$(RM) ./AUTOSAR_Implementaion/DoorLockIndication_SWC.cyclo ./AUTOSAR_Implementaion/DoorLockIndication_SWC.d ./AUTOSAR_Implementaion/DoorLockIndication_SWC.o ./AUTOSAR_Implementaion/DoorLockIndication_SWC.su ./AUTOSAR_Implementaion/DoorSensorAbstraction.cyclo ./AUTOSAR_Implementaion/DoorSensorAbstraction.d ./AUTOSAR_Implementaion/DoorSensorAbstraction.o ./AUTOSAR_Implementaion/DoorSensorAbstraction.su

.PHONY: clean-AUTOSAR_Implementaion

