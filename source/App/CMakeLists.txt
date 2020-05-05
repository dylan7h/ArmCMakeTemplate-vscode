set(TARGET TestApp)

set(INCS 
    -I${CMAKE_CURRENT_SOURCE_DIR}/include
    -I${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver
    -I${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver/Inc 
    -I${PROJECT_SOURCE_DIR}/source/Lib/STM32F3xx_HAL_Driver/Inc/Legacy 
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Core/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Core/Device/ST/STM32F3xx/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Device/ST/STM32F3xx/Include
    -I${PROJECT_SOURCE_DIR}/source/Lib/CMSIS/Device/ST/STM32F3xx/Include
)

set(ADEFINES
    --pd "__MICROLIB SETA 1" 
)

set(CDEFINES
    -DSTM32F303xC=1
    -DUSE_HAL_DRIVER=1
    -D__MICROLIB=1
)

# Assembler Options
set(ASFLAGS
    --cpu Cortex-M4.fp.sp
    -g
    ${ADEFINES}
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

# Linker Options
set(LDFLAGS
    --datacompressor off 
    --entry Reset_Handler 
    --strict 
    --library_type=microlib
    --map 
    --symbols 
    --info=sizes,totals,unused,veneers
    --callgraph 
    --summary_stderr
    --load_addr_map_info 
    --startup main 
    --show_parent_lib 
    --show_full_path
    --scatter "${PROJECT_SOURCE_DIR}/source/App/MDK_Project.sct"
    --list ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.map
)

set(SRC
    startup_stm32f303xc.s
    source/gpio.c
    source/stm32f3xx_hal_msp.c
    source/stm32f3xx_it.c
    source/system_stm32f3xx.c
    source/usart.c
    main.c
)

add_executable(${TARGET}
    ${SRC}
)
set_target_properties(${TARGET} PROPERTIES SUFFIX ".axf")

target_link_options(${TARGET} PRIVATE
    ${LDFLAGS}
)

target_link_libraries(${TARGET} PRIVATE
    ${PROJECT_SOURCE_DIR}/bin/Lib/libSTM32F3xx_HAL_Driver.a
)

target_compile_options(${TARGET} PRIVATE
    $<$<COMPILE_LANGUAGE:C>:${CFLAGS}>
    $<$<COMPILE_LANGUAGE:ASM>:${ASFLAGS}>
) 

add_custom_target(${TARGET}.bin ALL 
    DEPENDS ${TARGET}
)
add_custom_command(TARGET ${TARGET}.bin
    POST_BUILD
    # fromelf to bin
    COMMAND fromelf ARGS --bin --output ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.bin ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.axf
    COMMENT "hexifying and adding softdevice to ${TARGET}"
    VERBATIM
)

add_custom_target(${TARGET}.hex ALL 
    DEPENDS ${TARGET}
)
add_custom_command(TARGET ${TARGET}.hex
    POST_BUILD
    # fromelf to hex
    COMMAND fromelf ARGS --vhx --64x1 --output ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.hex ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.axf
    COMMENT "hexifying and adding softdevice to ${TARGET}"
    VERBATIM
)

add_custom_target(${TARGET}.asm ALL 
    DEPENDS ${TARGET}
)
add_custom_command(TARGET ${TARGET}.asm
    POST_BUILD
    # fromelf to asm
    COMMAND fromelf ARGS --text -c --output ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.asm ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.axf
    COMMENT "hexifying and adding softdevice to ${TARGET}"
    VERBATIM
)

set(CLEAN_FILES
    ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.asm
    ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.hex
    ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.bin
    ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.htm
    ${PROJECT_SOURCE_DIR}/bin/App/${TARGET}.map
)

set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${CLEAN_FILES}")
