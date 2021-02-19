add_library(example)

target_sources(example
  PRIVATE
    example.cpp
  PUBLIC
    example.h
  )

target_include_directories(example
  PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
  )
