project(engine
    VERSION 0.0
    LANGUAGES CXX
)

add_library(engine
    STATIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src/engine.cpp
)

add_library(cxp::engine
    ALIAS
        engine
)

target_include_directories(engine
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(engine
    PRIVATE
        cxp::compile-options-private
    PUBLIC
        cxp::compile-options-public
)
