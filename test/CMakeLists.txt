add_executable(
    unit_tests
    example_add.cpp
    example_subtract.cpp
    )

target_link_libraries(
    unit_tests
    gtest_main
    example
    )

add_test(
  NAME
    unit
  COMMAND
    ${PROJECT_BINARY_DIR}/unit_tests
  )
