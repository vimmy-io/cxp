add_subdirectory(engine-ui-exec/)
set_property(TARGET engine-ui-exec PROPERTY FOLDER "src")

if (PROJECT_ENABLE_BENCHMARKING)
    add_subdirectory(benchmarks)
    set_property(TARGET benchmarks PROPERTY FOLDER "src")
endif()

if (PROJECT_ENABLE_TESTING)
    add_subdirectory(tests)
    set_property(TARGET tests PROPERTY FOLDER "src")
endif()
