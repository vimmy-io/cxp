project(cxp-tests
    VERSION 0.0
    LANGUAGES CXX
)

add_executable(cxp-tests
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

add_executable(cxp::tests
    ALIAS
        cxp-tests
)

target_link_libraries(cxp-tests
    INTERFACE
        cxp::compile-options-private
    PRIVATE
        cxp::ext_google_test
)
