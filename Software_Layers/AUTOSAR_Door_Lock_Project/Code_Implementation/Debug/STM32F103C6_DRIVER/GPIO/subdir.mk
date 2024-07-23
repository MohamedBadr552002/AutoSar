################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../STM32F103C6_DRIVER/GPIO/STM32F103C6_DRIVER_GPIO.c 

OBJS += \
./STM32F103C6_DRIVER/GPIO/STM32F103C6_DRIVER_GPIO.o 

C_DEPS += \
./STM32F103C6_DRIVER/GPIO/STM32F103C6_DRIVER_GPIO.d 


# Each subdirectory must supply rules for building sources it contributes
STM32F103C6_DRIVER/GPIO/%.o STM32F103C6_DRIVER/GPIO/%.su STM32F103C6_DRIVER/GPIO/%.cyclo: ../STM32F103C6_DRIVER/GPIO/%.c STM32F103C6_DRIVER/GPIO/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/HAL/includes" -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/STM32F103C6_DRIVER/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-STM32F103C6_DRIVER-2f-GPIO

clean-STM32F103C6_DRIVER-2f-GPIO:
	-$(RM) ./STM32F103C6_DRIVER/GPIO/STM32F103C6_DRIVER_GPIO.cyclo ./STM32F103C6_DRIVER/GPIO/STM32F103C6_DRIVER_GPIO.d ./STM32F103C6_DRIVER/GPIO/STM32F103C6_DRIVER_GPIO.o ./STM32F103C6_DRIVER/GPIO/STM32F103C6_DRIVER_GPIO.su

.PHONY: clean-STM32F103C6_DRIVER-2f-GPIO

