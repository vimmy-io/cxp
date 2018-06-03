add_subdirectory(engine-ui-exec/)
set_property(TARGET engine-ui-exec PROPERTY FOLDER "src")

if (PROJECT_ENABLE_BENCHMARKING)
    add_subdirectory(benchmarks)
    set_property(TARGET cxp-benchmarks PROPERTY FOLDER "benchmarks")
endif()

if (PROJECT_ENABLE_TESTING)
    add_subdirectory(tests)
    set_property(TARGET cxp-tests PROPERTY FOLDER "tests")
endif()
