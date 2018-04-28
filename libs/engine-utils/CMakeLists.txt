project(engine-utils
    VERSION 0.0
    LANGUAGES CXX
)

add_library(engine-utils
    INTERFACE
)

add_library(cxp::engine-utils
    ALIAS
        engine-utils
)

target_include_directories(engine-utils
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(engine-utils
    INTERFACE
        cxp::engine
)