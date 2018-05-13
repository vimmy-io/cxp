# Frequently Asked Questions
To ask a question please submit an issue.

## Why not use the `CMAKE_CXX_STANDARD` flag?

This flag and it's version is dependent on the CMake version, so if you're using CMake 3.4 and want to just be able to use C++17 you'll have to update to 3.7 just to use that flag, instead of adding it as a compiler flag without an upgrade.

## Why not use `ExternalProject_Add` for pulling in external repos?

Although the `get_latest_deps.sh` script is not exactly cross platform, it should run on Linux and MacOS and Windows via git bash (at least). But the main reason I'm using something like this is a personal preference. I think it's better for separation of concerns. The build system should just use whatever is there and shouldn't care how it got there. The getting things into place should be the job of the package manager, the build system should just be able to find external dependencies and fail as early as possible otherwise. `ExternalProject_Add` on the other hand, is run when you're actually building the project. So if you fail to pull a repo, it should happen as soon as possible, not at the very last minute when building.

## What's with those compiler flags?

I'm not advocating the use of any of those flags, you can change them however you like. The main purpose was also to show the differences between `PUBLIC` and `PRIVATE` flags and how to seperate them nicely using `INTERFACE` libraries.
