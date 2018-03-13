cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(gtest-demo CXX)

# the following code to fetch googletest
# is inspired by and adapted after https://crascit.com/2015/07/25/cmake-gtest/
# download and unpack googletest at configure time
configure_file(googletest-download.cmake googletest-download/CMakeLists.txt)
execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY
        ${CMAKE_BINARY_DIR}/googletest-download
    )
execute_process(
    COMMAND
        "${CMAKE_COMMAND}" --build .
    WORKING_DIRECTORY
        ${CMAKE_BINARY_DIR}/googletest-download
    )
# adds the targers: gtest, gtest_main, gmock, gmock_main
add_subdirectory(
    ${PROJECT_BINARY_DIR}/googletest-src
    ${PROJECT_BINARY_DIR}/googletest-build
    )

if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    set(CMAKE_CXX_FLAGS         "-Wextra -Wno-unknown-pragmas -Wno-sign-compare -Woverloaded-virtual -Wwrite-strings -Wno-unused")
    set(CMAKE_CXX_FLAGS_DEBUG   "-O0 -g3")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
endif()

add_subdirectory(src)

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
