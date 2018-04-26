#Frequently Asked Questions
To ask a question please submit an issue or message.

##Why do the CMake files in the cmake folder have non-standard file names?
The only other option would be to put the files in different folder such as `cmake/compiler-flags/linux/CMakeLists.txt`. This is a little harder to keep track of especially since a CMake directory tree can get quite deep. So using non-standard CMakeLists names sacrifices default extension detection by IDEs for easier management.

##Why does the create.sh script use `=` instead of spaces for arguments?
Because MinGW (Git) on Windows wasn't liking it.
