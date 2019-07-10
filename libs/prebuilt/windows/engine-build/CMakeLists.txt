project(engine-build
    VERSION 0.0
    LANGUAGES CXX
)

add_library(engine-build
    INTERFACE
)

add_library(cxp::engine-build
    ALIAS
        engine-build
)

target_include_directories(engine-build
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

## Link prebuilt binary

add_library(prebuilt-engine-build
    STATIC # SHARED for dynamic
    IMPORTED
)

set_property(
    TARGET
        prebuilt-engine-build
    PROPERTY
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_SOURCE_DIR}/libs/Debug/engine-build.lib"
)

set_property(
    TARGET
        prebuilt-engine-build
    PROPERTY
        IMPORTED_LOCATION_MINSIZEREL
            "${CMAKE_CURRENT_SOURCE_DIR}/libs/MinSizeRel/engine-build.lib"
)

set_property(
    TARGET
        prebuilt-engine-build
    PROPERTY
        IMPORTED_LOCATION_RELWITHDEBINFO
            "${CMAKE_CURRENT_SOURCE_DIR}/libs/RelWithDebInfo/engine-build.lib"
)

set_property(
    TARGET
        prebuilt-engine-build
    PROPERTY
        IMPORTED_LOCATION_RELEASE
            "${CMAKE_CURRENT_SOURCE_DIR}/libs/Release/engine-build.lib"
)

target_link_libraries(engine-build
    INTERFACE
        prebuilt-engine-build
)

