cmake_minimum_required(
    VERSION 3.00                            # CMake Minimum Required Version Number
)

project(
    CMakeBuildTemplate                      # Project Name
    LANGUAGES               C               # Project Language
    VERSION                 1.2.0.5         # Version Number
)
configure_file( 
    ${PROJECT_SOURCE_DIR}/CMakeFiles/version.ini    # Base Configuration Infomation File
    ${PROJECT_SOURCE_DIR}/source/version.h          # Target Infomation Header File Path
)

#include(CTest)
#enable_testing()

# set build result location
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/Lib/Debug CACHE STRING "*.lib, *.a")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/Lib/Debug CACHE STRING "*.dll.a, *.so.a")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/App/Debug CACHE STRING "*.dll *.so *.exe *.out")

# Set Global Build Option
# add_compile_options(-std=c99)                   # ANSI C Version
# add_compile_options(-pedantic-errors -W -Wall)  # Warning & Error Check
# add_compile_options(-g -O0 --debug)             # Debug Mode

# add_compile_definitions(_DEBUG DEBUG)           # Macro Symbol Definition

# set sub build directories
add_subdirectory(${PROJECT_SOURCE_DIR}/source/Lib)
add_subdirectory(${PROJECT_SOURCE_DIR}/source/App)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
#include(CPack)
