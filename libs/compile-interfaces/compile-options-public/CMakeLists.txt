project(cxp-compile-options-public
    VERSION 0.0
    LANGUAGES CXX
)

add_library(cxp-compile-options-public
    INTERFACE
)

add_library(cxp::compile-options-public
    ALIAS
        cxp-compile-options-public
)

if (MSVC)
    target_compile_options(cxp-compile-options-public
        INTERFACE
            /Oi         # Enable intrinsic functions
            /std:c++17  # Enable C++ 17 features
    )
elseif (UNIX)
    target_compile_options(cxp-compile-options-public
        INTERFACE
            -std=c++17
    )
endif()

install(
    TARGETS
        cxp-compile-options-public
    EXPORT
        CxpCompileOptionsPublicTargets
)

install(
    EXPORT
        CxpCompileOptionsPublicTargets
    FILE
        CxpCompileOptionsPublicTargets.cmake
    NAMESPACE
        cxp::
    DESTINATION
        lib/cmake/CxpCompileOptionsPublicTargets
)
