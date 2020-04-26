set(AXF_TARGET TestApp1)
set(MAIN_TARGET Main)

set(DEFINITION
    __UVISION_VERSION="529" 
    _RTE_=1 
    STM32F303xC=1
    USE_HAL_DRIVER=1
    STM32F303xC=1
    __EVAL=1
    __MICROLIB=1
)

set(CFLAGS
    -xc 
    -std=c99 
    --target=arm-arm-none-eabi 
    -mcpu=cortex-m4 
    -mfpu=fpv4-sp-d16 
    -mfloat-abi=hard 
    -c
    -fno-rtti 
    -funsigned-char 
    -fshort-enums 
    -fshort-wchar
    -gdwarf-3 
    -Oz 
    -ffunction-sections 
    -Wno-packed 
    -Wno-missing-variable-declarations 
    -Wno-missing-prototypes 
    -Wno-missing-noreturn 
    -Wno-sign-conversion 
    -Wno-nonportable-include-path 
    -Wno-reserved-id-macro 
    -Wno-unused-macros 
    -Wno-documentation-unknown-command 
    -Wno-documentation 
    -Wno-license-management 
    -Wno-parentheses-equality
)

set(DEFINITION
    __UVISION_VERSION="529" 
    _RTE_
    STM32F303xC
    USE_HAL_DRIVER
    STM32F303xC
    __EVAL
    __MICROLIB
)

set(AFLAGS
    --cpu Cortex-M4.fp.sp 
    --pd "__EVAL SETA 1" 
    -g 
    --pd "__MICROLIB SETA 1"
    --pd "__UVISION_VERSION SETA 529"
    --pd "_RTE_ SETA 1"
    --pd "STM32F303xC SETA 1"
    -c
)

set(LDFLAGS
    --cpu=Cortex-M4.fp.sp
    --library_type=microlib 
    --strict 
    --scatter "./MDK_Project.sct"
    --summary_stderr 
    --info summarysizes 
    --map 
    --load_addr_map_info 
    --xref 
    --callgraph 
    --symbols
    --info sizes 
    --info totals 
    --info unused 
    --info veneers
    --list "MDK_Project.map"
    -o MDK_Project.axf
)

set(INC 
    ./include
    ${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver
    ${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver/Inc 
    ${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver/Inc/Legacy 
    ${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Include
    ${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Core/Include
    ${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Core/Device/ST/STM32F3xx/Include
    ${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Device/ST/STM32F3xx/Include
    ${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Device/ST/STM32F3xx/Include
)

set(SRC
    ./source/gpio.c
    ./source/stm32f3xx_hal_msp.c
    ./source/stm32f3xx_it.c
    ./source/system_stm32f3xx.c
    ./source/usart.c
    ./main.c
)

add_library(${MAIN_TARGET} ${SRC})

target_include_directories(${MAIN_TARGET} PRIVATE ${INC})
target_compile_definitions(${MAIN_TARGET} PRIVATE ${DEFINITION})
target_compile_options(${MAIN_TARGET} PRIVATE 
    $<$<COMPILE_LANGUAGE:C>:${CFLAGS}>
    $<$<COMPILE_LANGUAGE:ASM>:${AFLAGS}>
)


add_custom_target(${AXF_TARGET} ALL
    DEPENDS ${MAIN_TARGET} 
    COMMAND ${CMAKE_LINKER} --startup ./startup_stm32f303xc.s --libpath ${PROJECT_SOURCE_DIR}/bin/Lib/libMain.a --libpath ${PROJECT_SOURCE_DIR}/bin/Lib/libSTM32F3xx_HAL_Driver.a ${LDFLAGS}
)


# target_link_directories(${TARGET} PRIVATE ${PROJECT_SOURCE_DIR}/source/Lib/Debug)
# target_link_libraries(${TARGET} STM32F3xx_HAL_Driver)
