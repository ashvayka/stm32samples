################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../system/src/stm32f4-hal/stm32f4xx_hal.c \
../system/src/stm32f4-hal/stm32f4xx_hal_cortex.c \
../system/src/stm32f4-hal/stm32f4xx_hal_dma.c \
../system/src/stm32f4-hal/stm32f4xx_hal_dma2d.c \
../system/src/stm32f4-hal/stm32f4xx_hal_flash.c \
../system/src/stm32f4-hal/stm32f4xx_hal_flash_ex.c \
../system/src/stm32f4-hal/stm32f4xx_hal_flash_ramfunc.c \
../system/src/stm32f4-hal/stm32f4xx_hal_gpio.c \
../system/src/stm32f4-hal/stm32f4xx_hal_iwdg.c \
../system/src/stm32f4-hal/stm32f4xx_hal_ltdc.c \
../system/src/stm32f4-hal/stm32f4xx_hal_pcd_ex.c \
../system/src/stm32f4-hal/stm32f4xx_hal_pwr.c \
../system/src/stm32f4-hal/stm32f4xx_hal_pwr_ex.c \
../system/src/stm32f4-hal/stm32f4xx_hal_rcc.c \
../system/src/stm32f4-hal/stm32f4xx_hal_rcc_ex.c \
../system/src/stm32f4-hal/stm32f4xx_hal_sdram.c \
../system/src/stm32f4-hal/stm32f4xx_hal_spi.c \
../system/src/stm32f4-hal/stm32f4xx_ll_fmc.c 

OBJS += \
./system/src/stm32f4-hal/stm32f4xx_hal.o \
./system/src/stm32f4-hal/stm32f4xx_hal_cortex.o \
./system/src/stm32f4-hal/stm32f4xx_hal_dma.o \
./system/src/stm32f4-hal/stm32f4xx_hal_dma2d.o \
./system/src/stm32f4-hal/stm32f4xx_hal_flash.o \
./system/src/stm32f4-hal/stm32f4xx_hal_flash_ex.o \
./system/src/stm32f4-hal/stm32f4xx_hal_flash_ramfunc.o \
./system/src/stm32f4-hal/stm32f4xx_hal_gpio.o \
./system/src/stm32f4-hal/stm32f4xx_hal_iwdg.o \
./system/src/stm32f4-hal/stm32f4xx_hal_ltdc.o \
./system/src/stm32f4-hal/stm32f4xx_hal_pcd_ex.o \
./system/src/stm32f4-hal/stm32f4xx_hal_pwr.o \
./system/src/stm32f4-hal/stm32f4xx_hal_pwr_ex.o \
./system/src/stm32f4-hal/stm32f4xx_hal_rcc.o \
./system/src/stm32f4-hal/stm32f4xx_hal_rcc_ex.o \
./system/src/stm32f4-hal/stm32f4xx_hal_sdram.o \
./system/src/stm32f4-hal/stm32f4xx_hal_spi.o \
./system/src/stm32f4-hal/stm32f4xx_ll_fmc.o 

C_DEPS += \
./system/src/stm32f4-hal/stm32f4xx_hal.d \
./system/src/stm32f4-hal/stm32f4xx_hal_cortex.d \
./system/src/stm32f4-hal/stm32f4xx_hal_dma.d \
./system/src/stm32f4-hal/stm32f4xx_hal_dma2d.d \
./system/src/stm32f4-hal/stm32f4xx_hal_flash.d \
./system/src/stm32f4-hal/stm32f4xx_hal_flash_ex.d \
./system/src/stm32f4-hal/stm32f4xx_hal_flash_ramfunc.d \
./system/src/stm32f4-hal/stm32f4xx_hal_gpio.d \
./system/src/stm32f4-hal/stm32f4xx_hal_iwdg.d \
./system/src/stm32f4-hal/stm32f4xx_hal_ltdc.d \
./system/src/stm32f4-hal/stm32f4xx_hal_pcd_ex.d \
./system/src/stm32f4-hal/stm32f4xx_hal_pwr.d \
./system/src/stm32f4-hal/stm32f4xx_hal_pwr_ex.d \
./system/src/stm32f4-hal/stm32f4xx_hal_rcc.d \
./system/src/stm32f4-hal/stm32f4xx_hal_rcc_ex.d \
./system/src/stm32f4-hal/stm32f4xx_hal_sdram.d \
./system/src/stm32f4-hal/stm32f4xx_hal_spi.d \
./system/src/stm32f4-hal/stm32f4xx_ll_fmc.d 


# Each subdirectory must supply rules for building sources it contributes
system/src/stm32f4-hal/%.o: ../system/src/stm32f4-hal/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=soft -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-move-loop-invariants -Wall -Wextra  -g3 -DDEBUG -DUSE_FULL_ASSERT -DTRACE -DOS_USE_TRACE_SEMIHOSTING_STDOUT -DSTM32F429xx -DUSE_HAL_DRIVER -DHSE_VALUE=8000000 -I"../include" -I"../system/include" -I"../system/include/cmsis" -I"../system/include/stm32f4-hal" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


