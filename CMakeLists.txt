cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(gtest-demo CXX)

# place binaries and libraries according to GNU standards
include(GNUInstallDirs)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})

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

# we use this to get code coverage
if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
endif()

add_subdirectory(src)

enable_testing()
add_subdirectory(test)
