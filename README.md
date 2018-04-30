# CXP: C++ Cross Platform

A template project for creating a cross platform C++ CMake project using _modern_ CMake syntax and transitive dependencies.

## Getting Started
- Run `get_latest_deps.sh` to pull down 3rd party dependencies from Github. Use `[-s|--ssh]` to use ssh.
- `mkdir build && cd build`
- `cmake -G "Your Favourite Build Type" ../` Supported options are (OFF by default): `-D<OPTION>=ON`
  - PROJECT_ENABLE_BENCHMARKING - Creates sample Google Benchmark project
  - PROJECT_ENABLE_TESTING - Creats sample Google Test project
  - PROJECT_USE_LIBCXX - Sets `-stdlib=libc++` for Clang only

## Customising CXP for Your Project
This section will show you where and what to change to configure CXP to work with your project files, whether you're moving your files to CXP or starting from scratch.

### gitignore
Firstly, modify the [.gitignore](/.gitignore) file to your requirements. Currently, it ignores all files, except a few necessary ones but includes directories.

### Renaming Params
Next rename some variables to reflect your project name, default configs etc:
- [Library dependencies](/get_latest_deps.sh#L64) that get pulled into `libs/external`
- Root Project Name in the [main CMakeLists.txt](/CMakeLists.txt#L3)
- Root project [options](/CMakeLists.txt#L12-L14)
- The [libraries](/libs/CMakeLists.txt) and [executables](src/CMakeLists.txt) that are being built

## Project Structure

```
libs
  - CMakeLists.txt      // File for controlling libs
  - external            // All external dependencies go here
  - compile-interfaces  // Compile options using INTERFACE libraries
  - engine              // Each lib is modular and can be included
    - include           // as and when required
    - src
  - engine-utils        // INTERFACE header only, depends on engine
    - include
  - engine-ui           // STATIC lib depends on engine-utils
    - include
    - src
src                   // Main folder for executables
  - benchmarks        // Google benchmark executable project
  - tests             // Goolgle test executable project
  - engine-ui-exec    // Depends on engine-ui, everything else
    - include         // included automatically
    - src
```
