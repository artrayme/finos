#include <gtest/gtest.h>

extern "C" {
#include "Finos.h"
}

TEST(FinosTests, helloWorldTest) {
  EXPECT_STREQ("Hello World", helloWorld());
}
