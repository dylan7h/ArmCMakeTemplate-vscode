set(TARGET CustomStdlib)

add_library(${TARGET} SHARED source/CustomStdlib.c)

target_include_directories(${TARGET} PUBLIC include)
