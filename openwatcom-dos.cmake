# Toolchain description file for the CC65 compiler suite

include_guard()

set(CMAKE_SYSTEM_NAME msdos)
set(CMAKE_SYSTEM_VERSION 1)

set(CMAKE_CROSSCOMPILING TRUE)

# Shared libraries are not supported at all
set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS FALSE)

set(CMAKE_SYSTEM_PROCESSOR "i386")

if (CMAKE_TOOLCHAIN_FILE)
endif()

set(CMAKE_C_COMPILER_FORCED TRUE CACHE BOOL "")

set(WATCOM_BIN_PATH "c:/watcom/binnt64")

set(CMAKE_C_COMPILER "${WATCOM_BIN_PATH}/wcc386.exe" CACHE FILEPATH "OpenWatcom i386 compiler")
set(CMAKE_LINKER "${WATCOM_BIN_PATH}/wcl386.exe" CACHE FILEPATH "OpenWatcom linker")
# dummy
set(CMAKE_AR "${CMAKE_C_COMPILER}" CACHE FILEPATH "")
set(CMAKE_C_COMPILER_AR "${CMAKE_AR}" CACHE FILEPATH "")

set(CMAKE_C_COMPILER_ID_RUN TRUE)
set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_C_COMPILER_ID openwatcom_i386)
set(CMAKE_C_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_C_STANDARD_COMPUTED_DEFAULT 89)

set(CMAKE_CXX_COMPILER_ID_RUN FALSE)
set(CMAKE_CXX_COMPILER_FORCED FALSE)
set(CMAKE_CXX_COMPILER_WORKS FALSE)
set(CMAKE_CXX_COMPILER_ID openwatcom_i386)
set(CMAKE_CXX_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT "")

# optimizations:
# -od: no optimizations
# -ox: average space-time optimizations
# -os: space optimizations
# -ot: time optimizations
# -otexan: fasted possible code

# debug symbols:
# -d1: line number info
# -d2: full debugging info
# -d3: full debugging info plus unused types

# target cpu:
# -3r 80386 register-based calling
# -3s 80386 stack-based calling
# -4r 80486 register-based calling
# -4s 80486 stack-based calling
# -5r Pentium register-based calling
# -5s Pentium stack-based calling
# -6r Pentium pro register-based calling
# -6s Pentium pro stack-based calling

# Errors/warnings:
# -w4: Warning level 4
# -we: Treat warnings as errors
# -e25 Stop after 25 errors (?)

# Misc:
# -zq: Quiet operation (?)

set(OPENWATCOM_C_FLAGS "-i=C:\\WATCOM\\h -w4 -e25 -zq -4r -bt=dos -fo=.obj -mf")
string(APPEND CMAKE_C_FLAGS_DEBUG_INIT " ${OPENWATCOM_C_FLAGS} -d2 -od")
string(APPEND CMAKE_C_FLAGS_MINSIZEREL_INIT " ${OPENWATCOM_C_FLAGS} -os -dNDEBUG")
string(APPEND CMAKE_C_FLAGS_RELEASE_INIT " ${OPENWATCOM_C_FLAGS} -ox -dNDEBUG")
string(APPEND CMAKE_C_FLAGS_RELWITHDEBINFO_INIT " ${OPENWATCOM_C_FLAGS} -ox -d2 -dNDEBUG")

# -k128k: 128k Stack size
# -mf: Memory model (f?)

set(OPENWATCOM_LINK_FLAGS "-k128k -l=dos4g -mf")
string(APPEND CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT " ${OPENWATCOM_LINK_FLAGS} -d2 ")
string(APPEND CMAKE_EXE_LINKER_FLAGS_MINSIZEREL_INIT " ${OPENWATCOM_LINK_FLAGS} -d0 -os ")
string(APPEND CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT " ${OPENWATCOM_LINK_FLAGS} -d0 -ox ")
string(APPEND CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO_INIT " -d2 -ox ")

set(CMAKE_EXECUTABLE_SUFFIX "")

set(CMAKE_SKIP_COMPATIBILITY_TESTS 1)
set(CMAKE_SIZEOF_CHAR 1)
set(CMAKE_SIZEOF_UNSIGNED_SHORT 2)
set(CMAKE_SIZEOF_SHORT 2)
set(CMAKE_SIZEOF_INT 4)
set(CMAKE_SIZEOF_UNSIGNED_LONG 4)
set(CMAKE_SIZEOF_UNSIGNED_INT 4)
set(CMAKE_SIZEOF_LONG 4)
set(CMAKE_SIZEOF_VOID_P 4)
set(CMAKE_SIZEOF_FLOAT 4)
set(CMAKE_SIZEOF_DOUBLE 8)
set(CMAKE_C_SIZEOF_DATA_PTR 4)
set(CMAKE_HAVE_LIMITS_H 1)
set(CMAKE_HAVE_UNISTD_H 1)
set(CMAKE_HAVE_PTHREAD_H 0)
set(CMAKE_HAVE_SYS_PRCTL_H 0)
set(CMAKE_WORDS_BIGENDIAN 0)
set(CMAKE_DL_LIBS)

set(OPENWATCOM_DOS4GW_PATH "C:\\WATCOM\\binw\\dos4gw.exe")

set(CMAKE_C_COMPILE_OBJECT
  "<CMAKE_C_COMPILER> <INCLUDES> <DEFINES> <FLAGS> <SOURCE> -fo=<OBJECT>")

# <TARGET>\\..\\ is a massive hack... It's to get the parent directory of the output filename. It works...
set(CMAKE_C_LINK_EXECUTABLE
  "<CMAKE_LINKER> <LINK_FLAGS> <LINK_LIBRARIES> -fe=<TARGET> <OBJECTS> && copy ${OPENWATCOM_DOS4GW_PATH} <TARGET>\\..\\")
