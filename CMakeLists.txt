cmake_minimum_required(VERSION 3.6)

project(MainProjectName
    VERSION 0.0
    LANGUAGES CXX
)

if (NOT EXISTS ${PROJECT_SOURCE_DIR}/libs/external)
    message(FATAL_ERROR "Please run get_latests_deps.sh before building cmake")
endif()

option(PROJECT_ENABLE_BENCHMARKING "Build and link google-benchmark lib and executable" ON)
option(PROJECT_ENABLE_TESTING "Build and link google-test lib and executable" ON)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_subdirectory(libs)
add_subdirectory(src)
