cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(
  finos
  LANGUAGES C CXX
  VERSION 0.1)

option(BUILD_TESTS "Enable Test Builds" ON)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include(cmake/Conan.cmake)
include(cmake/Coverage.cmake)
include(cmake/Sanitizers.cmake)

add_subdirectory(src)

if(BUILD_TESTS)
  include(GoogleTest)
  enable_testing()
  add_subdirectory(tests)
endif()
