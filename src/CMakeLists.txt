file(
  GLOB_RECURSE
  SOURCES
  CONFIGURE_DEPENDS
  "finos/*.h"
  "finos/*.c")

add_library(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC finos)
