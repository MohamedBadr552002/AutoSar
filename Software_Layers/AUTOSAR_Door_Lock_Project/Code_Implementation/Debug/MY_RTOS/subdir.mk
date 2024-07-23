################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MY_RTOS/CortexMX_Porting.c \
../MY_RTOS/RTOS_FIFO.c \
../MY_RTOS/scheduler.c 

OBJS += \
./MY_RTOS/CortexMX_Porting.o \
./MY_RTOS/RTOS_FIFO.o \
./MY_RTOS/scheduler.o 

C_DEPS += \
./MY_RTOS/CortexMX_Porting.d \
./MY_RTOS/RTOS_FIFO.d \
./MY_RTOS/scheduler.d 


# Each subdirectory must supply rules for building sources it contributes
MY_RTOS/%.o MY_RTOS/%.su MY_RTOS/%.cyclo: ../MY_RTOS/%.c MY_RTOS/subdir.mk
	arm-none-eabi-gcc -gdwarf-2 "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DSTM32 -DSTM32F1 -DSTM32F103C6Tx -DDEBUG -c -I../Inc -I"D:/work/embedded systems course/Stm32_IDE_workspace/___DRIVER___/MY_RTOS/inc" -I"D:/work/embedded systems course/Stm32_IDE_workspace/___DRIVER___/HAL/includes" -I"D:/work/embedded systems course/Stm32_IDE_workspace/___DRIVER___/STM32F103C6_DRIVER/inc" -I"D:/work/embedded systems course/Stm32_IDE_workspace/___DRIVER___/CMSIS_V5" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-MY_RTOS

clean-MY_RTOS:
	-$(RM) ./MY_RTOS/CortexMX_Porting.cyclo ./MY_RTOS/CortexMX_Porting.d ./MY_RTOS/CortexMX_Porting.o ./MY_RTOS/CortexMX_Porting.su ./MY_RTOS/RTOS_FIFO.cyclo ./MY_RTOS/RTOS_FIFO.d ./MY_RTOS/RTOS_FIFO.o ./MY_RTOS/RTOS_FIFO.su ./MY_RTOS/scheduler.cyclo ./MY_RTOS/scheduler.d ./MY_RTOS/scheduler.o ./MY_RTOS/scheduler.su

.PHONY: clean-MY_RTOS

