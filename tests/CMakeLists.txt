file(
  GLOB_RECURSE
  SOURCES
  CONFIGURE_DEPENDS
  "src/*.cpp")

add_executable(${PROJECT_NAME}_tests ${SOURCES})

target_link_libraries(${PROJECT_NAME}_tests PRIVATE ${PROJECT_NAME} CONAN_PKG::gtest)

gtest_discover_tests(${PROJECT_NAME}_tests)
