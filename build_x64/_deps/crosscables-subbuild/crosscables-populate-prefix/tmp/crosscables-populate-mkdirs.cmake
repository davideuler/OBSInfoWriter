# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src")
  file(MAKE_DIRECTORY "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src")
endif()
file(MAKE_DIRECTORY
  "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build"
  "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-subbuild/crosscables-populate-prefix"
  "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-subbuild/crosscables-populate-prefix/tmp"
  "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-subbuild/crosscables-populate-prefix/src/crosscables-populate-stamp"
  "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-subbuild/crosscables-populate-prefix/src"
  "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-subbuild/crosscables-populate-prefix/src/crosscables-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-subbuild/crosscables-populate-prefix/src/crosscables-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-subbuild/crosscables-populate-prefix/src/crosscables-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
