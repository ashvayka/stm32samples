################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/BlinkLed.c \
../src/Timer.c \
../src/_initialize_hardware.c \
../src/_write.c \
../src/main.c \
../src/stm32f429i_discovery.c \
../src/stm32f429i_discovery_eeprom.c \
../src/stm32f429i_discovery_gyroscope.c \
../src/stm32f429i_discovery_io.c \
../src/stm32f429i_discovery_lcd.c \
../src/stm32f429i_discovery_sdram.c \
../src/stm32f429i_discovery_ts.c 

OBJS += \
./src/BlinkLed.o \
./src/Timer.o \
./src/_initialize_hardware.o \
./src/_write.o \
./src/main.o \
./src/stm32f429i_discovery.o \
./src/stm32f429i_discovery_eeprom.o \
./src/stm32f429i_discovery_gyroscope.o \
./src/stm32f429i_discovery_io.o \
./src/stm32f429i_discovery_lcd.o \
./src/stm32f429i_discovery_sdram.o \
./src/stm32f429i_discovery_ts.o 

C_DEPS += \
./src/BlinkLed.d \
./src/Timer.d \
./src/_initialize_hardware.d \
./src/_write.d \
./src/main.d \
./src/stm32f429i_discovery.d \
./src/stm32f429i_discovery_eeprom.d \
./src/stm32f429i_discovery_gyroscope.d \
./src/stm32f429i_discovery_io.d \
./src/stm32f429i_discovery_lcd.d \
./src/stm32f429i_discovery_sdram.d \
./src/stm32f429i_discovery_ts.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=soft -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-move-loop-invariants -Wall -Wextra  -g3 -DDEBUG -DUSE_FULL_ASSERT -DTRACE -DOS_USE_TRACE_SEMIHOSTING_STDOUT -DSTM32F429xx -DUSE_HAL_DRIVER -DHSE_VALUE=8000000 -I"../include" -I"../system/include" -I"../system/include/cmsis" -I"../system/include/stm32f4-hal" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


