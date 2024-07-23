################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../STM32F103C6_DRIVER/USART/STM32F103C6_DRIVER_USART.c 

OBJS += \
./STM32F103C6_DRIVER/USART/STM32F103C6_DRIVER_USART.o 

C_DEPS += \
./STM32F103C6_DRIVER/USART/STM32F103C6_DRIVER_USART.d 


# Each subdirectory must supply rules for building sources it contributes
STM32F103C6_DRIVER/USART/%.o STM32F103C6_DRIVER/USART/%.su STM32F103C6_DRIVER/USART/%.cyclo: ../STM32F103C6_DRIVER/USART/%.c STM32F103C6_DRIVER/USART/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/HAL/includes" -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/STM32F103C6_DRIVER/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-STM32F103C6_DRIVER-2f-USART

clean-STM32F103C6_DRIVER-2f-USART:
	-$(RM) ./STM32F103C6_DRIVER/USART/STM32F103C6_DRIVER_USART.cyclo ./STM32F103C6_DRIVER/USART/STM32F103C6_DRIVER_USART.d ./STM32F103C6_DRIVER/USART/STM32F103C6_DRIVER_USART.o ./STM32F103C6_DRIVER/USART/STM32F103C6_DRIVER_USART.su

.PHONY: clean-STM32F103C6_DRIVER-2f-USART

