cmake_minimum_required(VERSION 3.6)

project(MainProjectName
    VERSION 0.0
    LANGUAGES CXX
)

option(PROJECT_ENABLE_BENCHMARKING "Build and link google-benchmark lib and executable" OFF)
option(PROJECT_ENABLE_TESTING "Build and link google-test lib and executable" OFF)

add_subdirectory(libs)
add_subdirectory(src)
