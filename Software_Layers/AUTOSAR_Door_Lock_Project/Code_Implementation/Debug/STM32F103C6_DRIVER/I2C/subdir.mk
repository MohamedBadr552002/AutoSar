################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../STM32F103C6_DRIVER/I2C/STM32F103C6_DRIVER_I2C.c 

OBJS += \
./STM32F103C6_DRIVER/I2C/STM32F103C6_DRIVER_I2C.o 

C_DEPS += \
./STM32F103C6_DRIVER/I2C/STM32F103C6_DRIVER_I2C.d 


# Each subdirectory must supply rules for building sources it contributes
STM32F103C6_DRIVER/I2C/%.o STM32F103C6_DRIVER/I2C/%.su STM32F103C6_DRIVER/I2C/%.cyclo: ../STM32F103C6_DRIVER/I2C/%.c STM32F103C6_DRIVER/I2C/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/HAL/includes" -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/STM32F103C6_DRIVER/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-STM32F103C6_DRIVER-2f-I2C

clean-STM32F103C6_DRIVER-2f-I2C:
	-$(RM) ./STM32F103C6_DRIVER/I2C/STM32F103C6_DRIVER_I2C.cyclo ./STM32F103C6_DRIVER/I2C/STM32F103C6_DRIVER_I2C.d ./STM32F103C6_DRIVER/I2C/STM32F103C6_DRIVER_I2C.o ./STM32F103C6_DRIVER/I2C/STM32F103C6_DRIVER_I2C.su

.PHONY: clean-STM32F103C6_DRIVER-2f-I2C

