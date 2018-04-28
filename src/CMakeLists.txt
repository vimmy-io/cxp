add_subdirectory(engine-ui-exec/)

if (PROJECT_ENABLE_BENCHMARKING)
    add_subdirectory(benchmarks)
endif()

if (PROJECT_ENABLE_TESTING)
    add_subdirectory(tests)
endif()
