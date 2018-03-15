add_library(example "")

#TODO
# configure_file(
#     "${PROJECT_SOURCE_DIR}/cmake/config.h.in"
#     "${PROJECT_BINARY_DIR}/config.h"
#     )

target_sources(
    example
    PRIVATE
      example.cpp
      ${PROJECT_SOURCE_DIR}/include/example.h
    )

target_include_directories(
    example
    PUBLIC
      $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>/include
      $<INSTALL_INTERFACE:include>
    )

install(TARGETS example
    EXPORT ExampleTargets
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(
    FILES
      ${PROJECT_SOURCE_DIR}/include/example.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${PROJECT_BINARY_DIR}/ExampleConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)
install(
    EXPORT ExampleTargets
    NAMESPACE Example::
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/Example"
)
install(
    FILES
      "${PROJECT_SOURCE_DIR}/cmake/ExampleConfig.cmake"
      "${PROJECT_BINARY_DIR}/ExampleConfigVersion.cmake"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/Example"
)
