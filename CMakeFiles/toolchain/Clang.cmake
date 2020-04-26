SET(tools "C:/msys64/mingw32")

SET(CMAKE_C_COMPILER "${tools}/bin/clang.exe")
SET(CMAKE_CXX_COMPILER "${tools}/bin/clang++.exe")

SET(CMAKE_AR "${tools}/bin/llvm-ar.exe")
SET(CMAKE_CXX_COMPILER_AR "${tools}/bin/llvm-ar.exe")
SET(CMAKE_C_COMPILER_AR "${tools}/bin/llvm-ar.exe")
SET(CMAKE_LINKER "${tools}/bin/llvm-ld.exe")
SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> -o <TARGET> <LINK_LIBRARIES> <OBJECTS>")
set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "--via ")
SET(CMAKE_C_OUTPUT_EXTENSION .o)
SET(CMAKE_CXX_OUTPUT_EXTENSION .o)
SET(CMAKE_ASM_OUTPUT_EXTENSION .o)
# When library defined as STATIC, this line is needed to describe how the .a file must be
# create. Some changes to the line may be needed.
SET(CMAKE_C_CREATE_STATIC_LIBRARY "${tools}/bin/llvm-ar.exe -r -s --create <TARGET> <LINK_FLAGS> <OBJECTS>" )

# Where is the target environment
SET(CMAKE_FIND_ROOT_PATH "${tools}")
# Search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# For libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

