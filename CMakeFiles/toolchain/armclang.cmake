SET(CMAKE_SYSTEM_NAME  Generic)
SET(CMAKE_SYSTEM_PROCESSOR cortex-m4)

SET(tools "C:/Keil_v5/ARM/ARMCLANG")

SET(CMAKE_ASM_COMPILER "${tools}/bin/armasm.exe")
SET(CMAKE_C_COMPILER "${tools}/bin/armclang.exe")
SET(CMAKE_CXX_COMPILER "${tools}/bin/armclang.exe")

SET(CMAKE_AR "${tools}/bin/armar.exe")
SET(CMAKE_CXX_COMPILER_AR "${tools}/bin/armar.exe")
SET(CMAKE_C_COMPILER_AR "${tools}/bin/armar.exe")
SET(CMAKE_LINKER "${tools}/bin/armlink.exe")
SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
SET(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
# set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "--via ")
SET(CMAKE_C_OUTPUT_EXTENSION .o)
SET(CMAKE_CXX_OUTPUT_EXTENSION .o)
SET(CMAKE_ASM_OUTPUT_EXTENSION .o)
# When library defined as STATIC, this line is needed to describe how the .a file must be
# create. Some changes to the line may be needed.
SET(CMAKE_C_CREATE_STATIC_LIBRARY "${tools}/bin/armar.exe --create <TARGET> <LINK_FLAGS> <OBJECTS>" )

# Where is the target environment
SET(CMAKE_FIND_ROOT_PATH "${tools}")

# Search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# For libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
