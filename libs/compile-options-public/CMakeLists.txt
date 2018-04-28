project(compile-options-public
    VERSION 0.0
    LANGUAGES CXX
)

add_library(compile-options-public
    INTERFACE
)

add_library(cxp::compile-options-public
    ALIAS
        compile-options-public
)

if (MSVC)
target_compile_options(compile-options-public
    INTERFACE
        /Oi         # Enable intrinsic functions
        /std:c++17  # Enable C++ 17 features
)
endif()
