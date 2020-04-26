# ToolChain Root Path
SET(tools                   "C:/msys64/mingw32")

# Set C/C++ Compiler
SET(CMAKE_C_COMPILER        "${tools}/bin/gcc.exe")
SET(CMAKE_CXX_COMPILER      "${tools}/bin/g++.exe")

# Set AR( Archive )
SET(CMAKE_AR                "${tools}/bin/ar.exe")
SET(CMAKE_CXX_COMPILER_AR   "${tools}/bin/ar.exe")
SET(CMAKE_C_COMPILER_AR     "${tools}/bin/ar.exe")

# 오브젝트 파일의 심볼을 출력한다.
SET(CMAKE_NM                "${tools}/bin/nm.exe")

# 오브젝트 파일을 복사한다.(ex: elf-->bin)
SET(CMAKE_OBJCOPY           "${tools}/bin/objcopy.exe")

# 오브젝트 파일에 대한 정보를 출력한다.
SET(CMAKE_OBJDUMP           "${tools}/bin/objdump.exe")

# 아카이브(압축)를 위한 색인을 만든다.
SET(CMAKE_RANLIB           "${tools}/bin/ranlib.exe")
SET(CMAKE_RC_COMPILER      "${tools}/bin/windres.exe")

# 오브젝트 파일로부터 심볼을 제거한다.
SET(CMAKE_STRIP             "${tools}/bin/strip.exe")

# ELF 파일의 내용을 출력한다.
SET(CMAKE_READELF           "${tools}/bin/readelf.exe")

# Set Linker
SET(CMAKE_LINKER            "${tools}/bin/ld.exe")
SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> -o <TARGET> <LINK_LIBRARIES> <OBJECTS>")

set(CMAKE_C_RESPONSE_FILE_LINK_FLAG     "--via ")
SET(CMAKE_C_OUTPUT_EXTENSION            .o)
SET(CMAKE_CXX_OUTPUT_EXTENSION          .o)
SET(CMAKE_ASM_OUTPUT_EXTENSION          .o)

# When library defined as STATIC, this line is needed to describe how the .a file must be
# create. Some changes to the line may be needed.
SET(CMAKE_C_CREATE_STATIC_LIBRARY       "${tools}/bin/ar.exe -r -s --create <TARGET> <LINK_FLAGS> <OBJECTS>" )

# Where is the target environment
SET(CMAKE_FIND_ROOT_PATH                "${tools}")

# Search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM   NEVER)

# For libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY   ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE   ONLY)

