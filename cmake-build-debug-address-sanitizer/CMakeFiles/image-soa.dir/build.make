# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/jorgeygari/CMake/bin/cmake

# The command to remove a file.
RM = /home/jorgeygari/CMake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/Usuario/CLionProjects/ca_p1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/Usuario/CLionProjects/ca_p1/cmake-build-debug-address-sanitizer

# Include any dependencies generated for this target.
include CMakeFiles/image-soa.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/image-soa.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/image-soa.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/image-soa.dir/flags.make

CMakeFiles/image-soa.dir/main.cpp.o: CMakeFiles/image-soa.dir/flags.make
CMakeFiles/image-soa.dir/main.cpp.o: /mnt/c/Users/Usuario/CLionProjects/ca_p1/main.cpp
CMakeFiles/image-soa.dir/main.cpp.o: CMakeFiles/image-soa.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/Usuario/CLionProjects/ca_p1/cmake-build-debug-address-sanitizer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/image-soa.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image-soa.dir/main.cpp.o -MF CMakeFiles/image-soa.dir/main.cpp.o.d -o CMakeFiles/image-soa.dir/main.cpp.o -c /mnt/c/Users/Usuario/CLionProjects/ca_p1/main.cpp

CMakeFiles/image-soa.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image-soa.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/Usuario/CLionProjects/ca_p1/main.cpp > CMakeFiles/image-soa.dir/main.cpp.i

CMakeFiles/image-soa.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image-soa.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/Usuario/CLionProjects/ca_p1/main.cpp -o CMakeFiles/image-soa.dir/main.cpp.s

# Object files for target image-soa
image__soa_OBJECTS = \
"CMakeFiles/image-soa.dir/main.cpp.o"

# External object files for target image-soa
image__soa_EXTERNAL_OBJECTS =

image-soa: CMakeFiles/image-soa.dir/main.cpp.o
image-soa: CMakeFiles/image-soa.dir/build.make
image-soa: libsoa.a
image-soa: CMakeFiles/image-soa.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/Usuario/CLionProjects/ca_p1/cmake-build-debug-address-sanitizer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable image-soa"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/image-soa.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/image-soa.dir/build: image-soa
.PHONY : CMakeFiles/image-soa.dir/build

CMakeFiles/image-soa.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/image-soa.dir/cmake_clean.cmake
.PHONY : CMakeFiles/image-soa.dir/clean

CMakeFiles/image-soa.dir/depend:
	cd /mnt/c/Users/Usuario/CLionProjects/ca_p1/cmake-build-debug-address-sanitizer && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/Usuario/CLionProjects/ca_p1 /mnt/c/Users/Usuario/CLionProjects/ca_p1 /mnt/c/Users/Usuario/CLionProjects/ca_p1/cmake-build-debug-address-sanitizer /mnt/c/Users/Usuario/CLionProjects/ca_p1/cmake-build-debug-address-sanitizer /mnt/c/Users/Usuario/CLionProjects/ca_p1/cmake-build-debug-address-sanitizer/CMakeFiles/image-soa.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/image-soa.dir/depend

