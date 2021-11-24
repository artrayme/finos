set(CONAN_REQUARES "")
set(CONAN_OPTIONS "")

if(BUILD_TESTS)
  set(CONAN_REQUARES ${CONAN_REQUARES} gtest/1.11.0)
endif()

if(CONAN_REQUARES STREQUAL "")
  return()
endif()

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/v0.16.1/conan.cmake"
       "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_configure(
  REQUIRES ${CONAN_REQUARES}
  OPTIONS ${CONAN_OPTIONS}
  GENERATORS cmake)

conan_cmake_autodetect(settings)

conan_cmake_install(
  PATH_OR_REFERENCE .
  BUILD missing
  REMOTE conancenter
  SETTINGS ${settings})

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)
