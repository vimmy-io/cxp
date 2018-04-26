# CXP: C++ Cross Platform

A template project for creating a cross platform C++ CMake project with one step project creation.

[![Build Status](https://travis-ci.org/crezefire/cxp.svg?branch=master)](https://travis-ci.org/crezefire/cxp) [![Build status](https://ci.appveyor.com/api/projects/status/mvqwd9fg8jh2bld8?svg=true)](https://ci.appveyor.com/project/crezefire/cxp)

Supported Platforms:
- Windows (Visual Studio)
- Linux (Makefiles, Visual Studio Code)
- Linux via Windows (Planned)

## Table of Contents
- [Overview](#overview)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Supported Features](#supported-features)
- [Under the Hood](#under-the-hood)
- [Customising CXP for Your Project](#customising-cxp-for-your-project)
- [Planned Features](https://github.com/crezefire/cxp/issues?utf8=%E2%9C%93&q=is%3Aissue%20is%3Aopen%20label%3Av2.0)
- [Submitting Issues](#submitting-issues)

## Overview
CXP allows you to get up and running quickly with a working cross platform project. Just clone / copy the repo and add your existing code files. CXP includes a basic executable, library shared / static & header only configs to easily modify and adapt to your projects requirements.

## Requirements
Common:
- [CMake](https://cmake.org/download/) >= 3.6
- bash (On Windows use MinGW installed via [Git for Windows](https://git-scm.com/downloads))

Windows:
- [Visual Studio](https://www.visualstudio.com/en-us/downloads/download-visual-studio-vs.aspx)

Linux:
- GCC or [Clang](http://llvm.org/releases/)
- [Visual Studio Code](https://code.visualstudio.com/download) (Optional, Requires GCC + GDB)
- [VSCode C++ Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) (Optional, Required with VSCode)

## Getting Started
To build the project as is run:

```shell
./create.sh
```
This script detects which OS you are running and runs the default CMake project generate command. It supports the following flags:
- `-h|--help` to print help
- `-f|--folder=<folder>` name of the folder to store build files. **Default: build**
- `-G="Generator Name"` for custom generator. **Default: "Visual Studio 15 2017 Win64" or "Unix Makefiles"**
- `-m|--make=<extra CMake params>` Eg: `-m='-DVAR_SETUP=1 -DVAR2_SETUP=0`

Linux only:
- `-b|--build=<build type>` CMake build type. **Default: Debug**
- `-c|--clang` Uses the Clang compiler instead of GCC. **Default: Don't use Clang**
- `-v|--vscode` Skip setting up VSCode configs. **Default: Setup VSCode configs**

Note: Using Clang will still show CMake as setting up GCC but it will definitely be using Clang

## Supported Features
- One step project creation
- VSCode Launch configs automatically generated
- Modular includes
- CMake boilerplate setup and included

## Under the Hood
### create.sh
This script is essentially the entry point to the project. It works as such:
  - Detect OS
  - Create build folders
  - Setup default CMake generator and build type
  - Setup VSCode configs if required

### Platform Split
Each platform has its own CMakeLists.txt ([Linux](/cmake/LinMakeLists.txt) and [Windows](cmake/WinMakeLists.txt)) that is detected and included during runtime. These files are very similar with some common patterns plus platform specific settings. These files are responsible for including other folders and directories which setup the linked libraries.

Compiler options work in a similar fashion. Based on the OS a common CMakeLists.txt includes either a [Linux](cmake/LinCompilerFlags.txt) or [Windows](cmake/WinCompilerFlags.txt) version. This allows easily maintaining common compiler flags for all your projects.

All your binaries are built to the *bin* folder in the root of the repo.

### VSCode Setup
Setting up VSCode requires a few tasks to be executed.
- Firstly, during create.sh it copies over the .[vscode](/cmake/.vscode) folder which contains preconfigured config.json's
- Three configs are copied over: launch, task and cpp properites
- These configs setup the following:
  - Build Task (Ctrl + Shift + B)
  - Clean Task
  - C++ Extension GDB launch
  - Default unchanged header include file for C++ navigation
- These configs require replacing the build folder and executable name, the build folder is sed'd during the create.sh script
- However since the ExecutableName is part of CMake, it runs the [sed process](cmake/LinMakeLists.txt#L4) using the current executable name

## Customising CXP for Your Project
This section will show you where and what to change to configure CXP to work with your project files, whether you're moving your files to CXP or starting from scratch. This section assumes you have read the [previous section](#under-the-hood).
### gitignore
Firstly, modify the [.gitignore](/.gitignore) file to your requirements. Currently, it ignores all files, except a few necessary ones but includes directories.
### Renaming Params
Next rename some variables to reflect your project name, default configs etc:
- Project Name on [Linux](/cmake/LinMakeLists.txt#L1) and [Windows](/cmake/WinMakeLists.txt#L1)
- Executable Name on [Linux](/cmake/LinMakeLists.txt#L3) and [Windows](/cmake/WinMakeLists.txt#L6)
- Default [create.sh](/create.sh#L32-L40) params

### CMake Vars to Use
- Header includes, Link directories and static/shared libs can use predefined variables in the plaform specific [Win|Lin-MakeLists.txt](/cmake/WinMakeLists.txt#L34-L44)
- [`${currsources}`](/src/CMakeLists.txt#L1) for adding sources in the current CMakeLists.txt context
- [`${source_files}`](/cmake/WinMakeLists.txt#L29) for adding sources(*.cpp) to your executable

### Adding Libraries
Libraries are setup in the [libs CMakeLists](/libs/CMakeLists.txt). By default any library header will be accessible through the included [libs folder](/libs/CMakeLists.txt#L10-L13)

To add a header only library, use the [include()](/libs/CMakeLists.txt#L3) function, which allows your headers to be included in a separate libs folder as well as have access to the CMake vars mentioned above. An example [header-only library](/libs/header-only) is provided to copy and/or modify.

To add a non-prebuilt static or shared library use [add_subdirectory()](/libs/CMakeLists.txt#L2). This creates a separate project with seperate settings if required. An example is included as [sample-lib](/libs/sample-lib) to copy and/or modify. Change the [project & library name](/libs/sample-lib/CMakeLists.txt#L1-L2) as required.

To add a prebuilt library use [linker_includes](/libs/CMakeLists.txt#L15) to allow the linker to find the folder with the libraries.

## Submitting Issues
If you have any feature requests, suggestions or bugs please submit them to the [Issues](https://github.com/crezefire/cxp/issues) page where they will be tracked and updated.

If requesting a feature remember to:
- Explain how the feature will help
- Any examples of this feature

If reporting a bug remember to:
- Clearly explain / outline the reporoduction steps
- Mention the reproduction rate
- Mention your working environment, OS, CMake version etc
- Screenshots if possible / required
