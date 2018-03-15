# the following code to fetch googletest
# is inspired by and adapted after https://crascit.com/2015/07/25/cmake-gtest/
# download and unpack googletest at configure time

macro(fetch_googletest)
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
        ${PROJECT_SOURCE_DIR}/googletest-src
        ${PROJECT_BINARY_DIR}/googletest-build
        )
endmacro()
