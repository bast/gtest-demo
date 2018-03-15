add_executable(
    unit_tests
    example_add.cpp
    example_subtract.cpp
    )

set_target_properties(
    unit_tests PROPERTIES
    DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX}
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
    ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}/unit_tests
  )
