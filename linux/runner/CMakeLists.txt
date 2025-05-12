cmake_minimum_required(VERSION 3.13)
project(runner LANGUAGES CXX)

# Define the appliclinicion target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the appliclinicion should be added here.
add_executable(${BINARY_NAME}
  "main.cc"
  "my_appliclinicion.cc"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
)

# Apply the standard set of build settings. This can be removed for appliclinicions
# that need different build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions for the appliclinicion ID.
add_definitions(-DAPPLIclinicION_ID="${APPLIclinicION_ID}")

# Add dependency libraries. Add any appliclinicion-specific dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter)
target_link_libraries(${BINARY_NAME} PRIVATE PkgConfig::GTK)

target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")
