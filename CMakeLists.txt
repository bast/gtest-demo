cmake_minimum_required(VERSION 3.9)

find_program(CCACHE_EXECUTABLE "ccache" HINTS /usr/local/bin /opt/local/bin)
if(CCACHE_EXECUTABLE AND NOT CMAKE_TOOLCHAIN_FILE)
    message(STATUS "use ccache")
    set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE_EXECUTABLE})
endif()

project(gtest-demo
    VERSION 1.1.0
    DESCRIPTION "cmake example package indended as a sample only"
    LANGUAGES CXX
    )

# BUILD_SHARED_LIBS is a standard CMake variable, but we declare it here to
# make it prominent in the GUI.
option(BUILD_SHARED_LIBS "Build shared libraries(DLLs)." OFF)

option(BUILD_TESTS "Build our Example's own tests." ON)


# place binaries and libraries according to GNU standards
include(GNUInstallDirs)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})

# we use this to get code coverage
if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
endif()

# set debug postfix a la gtest
set(CMAKE_DEBUG_POSTFIX "d")

add_subdirectory(src)

include(cmake/googletest.cmake)
fetch_googletest(
    ${PROJECT_SOURCE_DIR}/cmake
    ${PROJECT_BINARY_DIR}/googletest
    )
# change the gtest default setting to our need! CK
set(BUILD_GTEST      ON CACHE BOOL "override default" FORCE)
set(BUILD_GMOCK     OFF CACHE BOOL "override default" FORCE)
set(INSTALL_GMOCK   OFF CACHE BOOL "override default" FORCE)
set(INSTALL_GTEST   OFF CACHE BOOL "override default" FORCE)

enable_testing()
add_subdirectory(test)
