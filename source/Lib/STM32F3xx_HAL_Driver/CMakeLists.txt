set(TARGET STM32F3xx_HAL_Driver)

# set(DEFINITION
#     __UVISION_VERSION="529" 
#     _RTE_=1 
#     STM32F303xC=1
#     USE_HAL_DRIVER=1
#     STM32F303xC=1
#     __EVAL=1
#     __MICROLIB=1
# )

# set(CFLAGS
#     -xc 
#     -std=c99 
#     --target=arm-arm-none-eabi 
#     -mcpu=cortex-m4 
#     -mfpu=fpv4-sp-d16 
#     -mfloat-abi=hard 
#     # -c
#     -fno-rtti 
#     -funsigned-char 
#     -fshort-enums 
#     -fshort-wchar
#     -gdwarf-3 
#     -Oz 
#     -ffunction-sections 
#     -Wno-packed 
#     -Wno-missing-variable-declarations 
#     -Wno-missing-prototypes 
#     -Wno-missing-noreturn 
#     -Wno-sign-conversion 
#     -Wno-nonportable-include-path 
#     -Wno-reserved-id-macro 
#     -Wno-unused-macros 
#     -Wno-documentation-unknown-command 
#     -Wno-documentation 
#     -Wno-license-management 
#     -Wno-parentheses-equality
# )

set(INCS 
    -I${PROJECT_SOURCE_DIR}/source/App/include
    -I${PROJECT_SOURCE_DIR}/source/Lib
    -I${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver
    -I${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver/Inc 
    -I${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver/Inc/Legacy 
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Core/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Core/Device/ST/STM32F3xx/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Device/ST/STM32F3xx/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Device/ST/STM32F3xx/Include
)

set(CDEFINES
    -DSTM32F303xC
    -DUSE_HAL_DRIVER
    -D__MICROLIB
)

# Compiler Options
set(CFLAGS
    --target=arm-arm-none-eabi
    -mcpu=cortex-m4  
    -mfpu=fpv4-sp-d16 
    -mfloat-abi=hard
    -mthumb
    -std=c11
    -Oz -g
    ${INCS}
    ${CDEFINES}
)

set(SRC
    ./Src/stm32f3xx_hal.c
    ./Src/stm32f3xx_hal_adc.c
    ./Src/stm32f3xx_hal_adc_ex.c
    ./Src/stm32f3xx_hal_can.c
    ./Src/stm32f3xx_hal_cec.c
    ./Src/stm32f3xx_hal_comp.c
    ./Src/stm32f3xx_hal_cortex.c
    ./Src/stm32f3xx_hal_crc.c
    ./Src/stm32f3xx_hal_crc_ex.c
    ./Src/stm32f3xx_hal_dac.c
    ./Src/stm32f3xx_hal_dac_ex.c
    ./Src/stm32f3xx_hal_dma.c
    ./Src/stm32f3xx_hal_exti.c
    ./Src/stm32f3xx_hal_flash.c
    ./Src/stm32f3xx_hal_flash_ex.c
    ./Src/stm32f3xx_hal_gpio.c
    ./Src/stm32f3xx_hal_hrtim.c
    ./Src/stm32f3xx_hal_i2c.c
    ./Src/stm32f3xx_hal_i2c_ex.c
    ./Src/stm32f3xx_hal_i2s.c
    ./Src/stm32f3xx_hal_i2s_ex.c
    ./Src/stm32f3xx_hal_irda.c
    ./Src/stm32f3xx_hal_iwdg.c
    ./Src/stm32f3xx_hal_msp_template.c
    ./Src/stm32f3xx_hal_nand.c
    ./Src/stm32f3xx_hal_nor.c
    ./Src/stm32f3xx_hal_opamp.c
    ./Src/stm32f3xx_hal_opamp_ex.c
    ./Src/stm32f3xx_hal_pccard.c
    ./Src/stm32f3xx_hal_pcd.c
    ./Src/stm32f3xx_hal_pcd_ex.c
    ./Src/stm32f3xx_hal_pwr.c
    ./Src/stm32f3xx_hal_pwr_ex.c
    ./Src/stm32f3xx_hal_rcc.c
    ./Src/stm32f3xx_hal_rcc_ex.c
    ./Src/stm32f3xx_hal_rtc.c
    ./Src/stm32f3xx_hal_rtc_ex.c
    ./Src/stm32f3xx_hal_sdadc.c
    ./Src/stm32f3xx_hal_smartcard.c
    ./Src/stm32f3xx_hal_smartcard_ex.c
    ./Src/stm32f3xx_hal_smbus.c
    ./Src/stm32f3xx_hal_spi.c
    ./Src/stm32f3xx_hal_spi_ex.c
    ./Src/stm32f3xx_hal_sram.c
    ./Src/stm32f3xx_hal_tim.c
    ./Src/stm32f3xx_hal_timebase_rtc_alarm_template.c
    ./Src/stm32f3xx_hal_timebase_rtc_wakeup_template.c
    ./Src/stm32f3xx_hal_timebase_tim_template.c
    ./Src/stm32f3xx_hal_tim_ex.c
    ./Src/stm32f3xx_hal_tsc.c
    ./Src/stm32f3xx_hal_uart.c
    ./Src/stm32f3xx_hal_uart_ex.c
    ./Src/stm32f3xx_hal_usart.c
    ./Src/stm32f3xx_hal_usart_ex.c
    ./Src/stm32f3xx_hal_wwdg.c
    ./Src/stm32f3xx_ll_adc.c
    ./Src/stm32f3xx_ll_comp.c
    ./Src/stm32f3xx_ll_crc.c
    ./Src/stm32f3xx_ll_dac.c
    ./Src/stm32f3xx_ll_dma.c
    ./Src/stm32f3xx_ll_exti.c
    ./Src/stm32f3xx_ll_fmc.c
    ./Src/stm32f3xx_ll_gpio.c
    ./Src/stm32f3xx_ll_hrtim.c
    ./Src/stm32f3xx_ll_i2c.c
    ./Src/stm32f3xx_ll_opamp.c
    ./Src/stm32f3xx_ll_pwr.c
    ./Src/stm32f3xx_ll_rcc.c
    ./Src/stm32f3xx_ll_rtc.c
    ./Src/stm32f3xx_ll_spi.c
    ./Src/stm32f3xx_ll_tim.c
    ./Src/stm32f3xx_ll_usart.c
    ./Src/stm32f3xx_ll_usb.c
    ./Src/stm32f3xx_ll_utils.c
)

add_library(${TARGET} STATIC ${SRC})

target_compile_options(${TARGET} PRIVATE ${CFLAGS})
# target_compile_definitions(${TARGET} PRIVATE ${DEFINITION})

# target_include_directories(${TARGET} PRIVATE ${INC})
