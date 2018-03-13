cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(gtest-demo CXX)

if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    set(CMAKE_CXX_FLAGS         "-Wextra -Wno-unknown-pragmas -Wno-sign-compare -Woverloaded-virtual -Wwrite-strings -Wno-unused")
    set(CMAKE_CXX_FLAGS_DEBUG   "-O0 -g3")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
endif()

include_directories(
    ${PROJECT_SOURCE_DIR}/src
    )

add_library(
    example
    src/example.cpp
    )

set(GOOGLETEST_ROOT external/googletest/googletest CACHE STRING "Google Test source root")

add_subdirectory(${PROJECT_SOURCE_DIR}/${GOOGLETEST_ROOT})

add_executable(
    unit_tests
    test/example_add.cpp
    test/example_subtract.cpp
    )

target_link_libraries(
    unit_tests
    gtest_main
    example
    )

enable_testing()

add_test(
  NAME
    unit
  COMMAND
    ${PROJECT_BINARY_DIR}/unit_tests
  )
