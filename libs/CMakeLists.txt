# External libraries
if (PROJECT_ENABLE_BENCHMARKING AND NOT TARGET benchmark)
    set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_GTEST_TESTS OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_EXCEPTIONS OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_LTO ON CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_INSTALL OFF CACHE BOOL "" FORCE)

    if (PROJECT_USE_LIBCXX)
        set_option(BENCHMARK_USE_LIBCXX "Build and test using libc++ as the standard library." OFF)
    endif()
    
    add_subdirectory(external/google/benchmark/ external/google/benchmark)

    add_library(cxp::ext_google_benchmark
        ALIAS
            benchmark
    )

    set_property(TARGET benchmark PROPERTY FOLDER "external-libs")
endif()

if (PROJECT_ENABLE_TESTING AND NOT TARGET gtest_main)
    set(BUILD_GMOCK OFF CACHE BOOL "" FORCE)
    set(BUILD_GTEST ON CACHE BOOL "" FORCE)
    set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
    set(INSTALL_GMOCK OFF CACHE BOOL "" FORCE)
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

    add_subdirectory(external/google/googletest/ external/google/googletest)

    add_library(cxp::ext_google_test
        ALIAS
            gtest_main
    )

    set_property(TARGET gtest_main PROPERTY FOLDER "external-libs")
    set_property(TARGET gtest PROPERTY FOLDER "external-libs")
endif()

# Internal libraries
add_subdirectory(compile-interfaces/compile-options-private/)
add_subdirectory(compile-interfaces/compile-options-public/)

add_subdirectory(engine/)
set_property(TARGET engine PROPERTY FOLDER "libs")

add_subdirectory(engine-utils/)

add_subdirectory(engine-ui/)
set_property(TARGET engine-ui PROPERTY FOLDER "libs")
