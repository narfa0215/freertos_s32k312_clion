# -----------------------------------------------------------------------------
#  Cmake Compiler File for Linaro gcc arm compiler
#  File Name       :  gcc_arm_eabi_toolchain.cmake
#  Compier Version :  6.3.1
#  Author          :  Tomato  
#  Instructions    :  Initial file.             2020/12/19                 V0.1
# 
# -----------------------------------------------------------------------------

# user config -----------------------------------------------------------------
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

set(TOOLCHAIN_PREFIX arm-none-eabi-)
# arm-none-eabi-gcc should be added to system path
# if(MINGW OR CYGWIN OR WIN32)
#     set(UTIL_SEARCH_CMD where)
# elseif(UNIX OR APPLE)
#     set(UTIL_SEARCH_CMD which)
# endif()
# Get toolchain folder
# execute_process(
#   COMMAND ${UTIL_SEARCH_CMD} ${TOOLCHAIN_PREFIX}gcc
#   OUTPUT_VARIABLE BINUTILS_PATH
#   OUTPUT_STRIP_TRAILING_WHITESPACE
# )
# get_filename_component(ARM_TOOLCHAIN_DIR ${BINUTILS_PATH} DIRECTORY)

set(ARM_TOOLCHAIN_DIR C:/NXP/S32DS.3.5/S32DS/build_tools/gcc_v10.2/gcc-10.2-arm32-eabi/bin)
set(GCC_LIB_PATH C:/NXP/S32DS.3.5/S32DS/build_tools/gcc_v10.2/gcc-10.2-arm32-eabi/arm-none-eabi/lib)

# system config ,do not change or change it carefully--------------------------
# Without that flag CMake is not able to pass test compilation check
set(CMAKE_TRY_COMPILE_TARGET_TYPE   STATIC_LIBRARY)

# which compilers to use
set(CMAKE_AR                        ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}ar.exe)

set(CMAKE_ASM_COMPILER              ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}gcc.exe)
set(CMAKE_C_COMPILER                ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}gcc.exe)
set(CMAKE_CXX_COMPILER              ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}g++.exe)
set(CMAKE_OBJCOPY                   ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}objcopy.exe CACHE INTERNAL "objcopy tool")
set(CMAKE_GSIZE_UTIL                ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}size.exe CACHE INTERNAL "size tool")

set(CMAKE_GSREC_TOOL                ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}objcopy.exe)
set(CMAKE_GSIZE_TOOL                ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}size.exe)

# set(CMAKE_C_FLAGS_DEBUG             "-g -O0" CACHE INTERNAL "")
# set(CMAKE_C_FLAGS_RELEASE           "-Os" CACHE INTERNAL "")
# set(CMAKE_CXX_FLAGS_DEBUG           "${CMAKE_C_FLAGS_DEBUG}" CACHE INTERNAL "")
# set(CMAKE_CXX_FLAGS_RELEASE         "${CMAKE_C_FLAGS_RELEASE}" CACHE INTERNAL "")

# setting compiler input parameter
# $<$<CONFIG:normal>:-Ospeed> generator expression only used in high version cmake
# https://cmake.org/cmake/help/latest/manual/cmake-generator-expressions.7.html

set(C_OPTIONS "-mcpu=cortex-m7 -mthumb -mlittle-endian -mfloat-abi=hard -mfpu=fpv5-sp-d16 --sysroot=${GCC_LIB_PATH} -Wall -ggdb3 -funsigned-char -fomit-frame-pointer -pedantic -Wextra -fno-short-enums -funsigned-bitfields -fno-common -Wunused -Wstrict-prototypes -Wsign-compare -Werror=implicit-function-declaration -Wundef -Wdouble-promotion")
set(ASM_OPTIONS ${C_OPTIONS})
set(CXX_OPTIONS ${C_OPTIONS})

set(LD_OPTIONS "-nostartfiles --entry=Reset_Handler -ggdb3 -mcpu=cortex-m7 -mthumb -mlittle-endian -mfloat-abi=hard -mfpu=fpv5-sp-d16 -specs=nano.specs -specs=nosys.specs --sysroot=${GCC_LIB_PATH} -Wl,-Map,${target_name}.map -lc -lm -lgcc")

# judge whether debug
if(CMAKE_DEBUG)
    string(APPEND C_OPTIONS " -O2")
else()
    # string(APPEND C_OPTIONS " -MD")
endif()

set(CMAKE_C_FLAGS ${C_OPTIONS})
set(CMAKE_CXX_FLAGS ${CXX_OPTIONS})
set(CMAKE_ASM_FLAGS ${ASM_OPTIONS})

# use cmakelist file: target_link_options to set ld options
set(CMAKE_EXE_LINKER_FLAGS ${LD_OPTIONS})
set(CMAKE_TRY_COMPILE_PLATFORM_VARIABLES CMAKE_C_FLAGS CMAKE_CXX_FLAGS CMAKE_ASM_FLAGS)

# --------- Userdef linker -------
# set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)