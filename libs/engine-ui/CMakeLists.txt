project(engine-ui
    VERSION 0.0
    LANGUAGES CXX
)

add_library(engine-ui
    STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src/ui.cpp
)

add_library(cxp::engine-ui
    ALIAS engine-ui
)

target_include_directories(engine-ui
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(engine-ui
    PUBLIC
    cxp::engine-utils
)
