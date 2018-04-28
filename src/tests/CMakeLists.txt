project(tests
    VERSION 0.0
    LANGUAGES CXX
)

add_executable(tests
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

add_executable(cxp::tests
    ALIAS
        tests
)

target_link_libraries(tests
    INTERFACE
        cxp::compile-options-private
    PRIVATE
        gtest_main
)
