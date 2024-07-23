################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../AUTOSAR_Implementaion/MCAL/DIO.c 

OBJS += \
./AUTOSAR_Implementaion/MCAL/DIO.o 

C_DEPS += \
./AUTOSAR_Implementaion/MCAL/DIO.d 


# Each subdirectory must supply rules for building sources it contributes
AUTOSAR_Implementaion/MCAL/%.o AUTOSAR_Implementaion/MCAL/%.su AUTOSAR_Implementaion/MCAL/%.cyclo: ../AUTOSAR_Implementaion/MCAL/%.c AUTOSAR_Implementaion/MCAL/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/HAL/includes" -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/STM32F103C6_DRIVER/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-AUTOSAR_Implementaion-2f-MCAL

clean-AUTOSAR_Implementaion-2f-MCAL:
	-$(RM) ./AUTOSAR_Implementaion/MCAL/DIO.cyclo ./AUTOSAR_Implementaion/MCAL/DIO.d ./AUTOSAR_Implementaion/MCAL/DIO.o ./AUTOSAR_Implementaion/MCAL/DIO.su

.PHONY: clean-AUTOSAR_Implementaion-2f-MCAL

