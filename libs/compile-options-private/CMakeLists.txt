project(compile-options-private
    VERSION 0.0
    LANGUAGES CXX
)

add_library(compile-options-private
    INTERFACE
)

add_library(cxp::compile-options-private
    ALIAS
        compile-options-private
)

if (MSVC)
target_compile_options(compile-options-private
    INTERFACE
        /GR-    # Disable RTTI
        #/EH-    # Disable exception handling
        /MP     # Multi-process compilation
        /Za     # Disable language extensions
        /WX     # Warnings as errors
        /FA     # Generate asm
        /Fa${PROJECT_BINARY_DIR}/asm-output/        # Assembly location
        $<$<CONFIG:Debug>:/ZI>     # Edit and continue
        $<$<CONFIG:Release>:/GS->     # No Buffer Security Checks
)
endif()
