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
        $<BUILD_INTERFACE:${engine_BINARY_DIR}/include>
        $<BUILD_INTERFACE:${engine_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_link_libraries(engine
    PRIVATE
        cxp::compile-options-private
    PUBLIC
        cxp::compile-options-public
)

install(
    TARGETS
        engine
    EXPORT
        EngineTargets
    LIBRARY DESTINATION
        lib
    ARCHIVE DESTINATION
        lib
    RUNTIME DESTINATION
        bin
    INCLUDES DESTINATION
        include
    PUBLIC_HEADER DESTINATION
        include
)

install(
    DIRECTORY
        include/
    DESTINATION
        include
)

install(
    EXPORT
        EngineTargets
    FILE
        EngineTargets.cmake
    NAMESPACE
        cxp::
    DESTINATION
        lib/cmake/engine
)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
    "EngineConfigVersion.cmake"
    VERSION
        ${engine_VERSION}
    COMPATIBILITY
        SameMajorVersion
)

install(
    FILES
        "EngineConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/EngineConfigVersion.cmake"
    DESTINATION
        lib/cmake/engine
)

export(
    PACKAGE
        engine
)
