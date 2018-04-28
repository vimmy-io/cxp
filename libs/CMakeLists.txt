# External libraries
if (PROJECT_ENABLE_BENCHMARKING)
    set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_GTEST_TESTS OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_EXCEPTIONS OFF CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_LTO ON CACHE BOOL "" FORCE)
    set(BENCHMARK_ENABLE_INSTALL OFF CACHE BOOL "" FORCE)

    # set_option(BENCHMARK_USE_LIBCXX "Build and test using libc++ as the standard library." OFF)
    
    add_subdirectory(external/google/benchmark/ external/google/benchmark)

    add_library(cxp::ext_google_benchmark
        ALIAS
            benchmark
    )
endif()

if (PROJECT_ENABLE_TESTING)
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
endif()

# Internal libraries
add_subdirectory(compile-options-private/)
add_subdirectory(compile-options-public/)
add_subdirectory(engine/)
add_subdirectory(engine-utils/)
add_subdirectory(engine-ui/)

