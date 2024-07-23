################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorLockIndication_SWC.c \
../AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorSensorAbstraction.c 

OBJS += \
./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorLockIndication_SWC.o \
./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorSensorAbstraction.o 

C_DEPS += \
./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorLockIndication_SWC.d \
./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorSensorAbstraction.d 


# Each subdirectory must supply rules for building sources it contributes
AUTOSAR_Implementaion/RTE_Generated_Files/%.o AUTOSAR_Implementaion/RTE_Generated_Files/%.su AUTOSAR_Implementaion/RTE_Generated_Files/%.cyclo: ../AUTOSAR_Implementaion/RTE_Generated_Files/%.c AUTOSAR_Implementaion/RTE_Generated_Files/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/HAL/includes" -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/STM32F103C6_DRIVER/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-AUTOSAR_Implementaion-2f-RTE_Generated_Files

clean-AUTOSAR_Implementaion-2f-RTE_Generated_Files:
	-$(RM) ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorLockIndication_SWC.cyclo ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorLockIndication_SWC.d ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorLockIndication_SWC.o ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorLockIndication_SWC.su ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorSensorAbstraction.cyclo ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorSensorAbstraction.d ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorSensorAbstraction.o ./AUTOSAR_Implementaion/RTE_Generated_Files/Rte_DoorSensorAbstraction.su

.PHONY: clean-AUTOSAR_Implementaion-2f-RTE_Generated_Files

