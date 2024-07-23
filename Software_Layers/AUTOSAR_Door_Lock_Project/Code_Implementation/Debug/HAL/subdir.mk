################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../HAL/7_segments.c \
../HAL/I2C_slave_EEPROM.c \
../HAL/LCD.c \
../HAL/Servo_Motor.c \
../HAL/keybad.c 

OBJS += \
./HAL/7_segments.o \
./HAL/I2C_slave_EEPROM.o \
./HAL/LCD.o \
./HAL/Servo_Motor.o \
./HAL/keybad.o 

C_DEPS += \
./HAL/7_segments.d \
./HAL/I2C_slave_EEPROM.d \
./HAL/LCD.d \
./HAL/Servo_Motor.d \
./HAL/keybad.d 


# Each subdirectory must supply rules for building sources it contributes
HAL/%.o HAL/%.su HAL/%.cyclo: ../HAL/%.c HAL/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/HAL/includes" -I"D:/work/embedded systems course/Unit_20(Autosar)/Unit_2(AutoarSWLayers)/AUTOSAR Door Lock Project/Code_Implementation/STM32F103C6_DRIVER/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-HAL

clean-HAL:
	-$(RM) ./HAL/7_segments.cyclo ./HAL/7_segments.d ./HAL/7_segments.o ./HAL/7_segments.su ./HAL/I2C_slave_EEPROM.cyclo ./HAL/I2C_slave_EEPROM.d ./HAL/I2C_slave_EEPROM.o ./HAL/I2C_slave_EEPROM.su ./HAL/LCD.cyclo ./HAL/LCD.d ./HAL/LCD.o ./HAL/LCD.su ./HAL/Servo_Motor.cyclo ./HAL/Servo_Motor.d ./HAL/Servo_Motor.o ./HAL/Servo_Motor.su ./HAL/keybad.cyclo ./HAL/keybad.d ./HAL/keybad.o ./HAL/keybad.su

.PHONY: clean-HAL

