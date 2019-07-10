project(engine-ui-exec
    VERSION 0.0
    LANGUAGES CXX
)

add_executable(engine-ui-exec
    ${CMAKE_CURRENT_SOURCE_DIR}/src/exec.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
)

add_executable(cxp::engine-ui-exec
    ALIAS
        engine-ui-exec
)

target_include_directories(engine-ui-exec
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(engine-ui-exec
    PUBLIC
        cxp::engine-ui
    PRIVATE
        cxp::compile-options-private
        cxp::engine-build
)
