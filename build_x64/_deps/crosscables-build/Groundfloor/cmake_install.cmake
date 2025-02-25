# Install script for directory: C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/OBSInfoWriter")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/Debug/Groundfloor.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/Release/Groundfloor.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/MinSizeRel/Groundfloor.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/RelWithDebInfo/Groundfloor.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/CMakeFiles/Groundfloor.dir/install-cxx-module-bmi-Debug.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/CMakeFiles/Groundfloor.dir/install-cxx-module-bmi-Release.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/CMakeFiles/Groundfloor.dir/install-cxx-module-bmi-MinSizeRel.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/CMakeFiles/Groundfloor.dir/install-cxx-module-bmi-RelWithDebInfo.cmake" OPTIONAL)
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/Debug/Groundfloor.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/Release/Groundfloor.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/MinSizeRel/Groundfloor.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/RelWithDebInfo/Groundfloor.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Atoms" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Callable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Freeable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Lockable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/MemFuncs.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Bookshelfs" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/AbstractSquirrel.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BAttribute.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BField.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFields.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFunctions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BNode.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecord.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecords.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BTable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BValue.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/RemoteSquirrel.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Materials" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CallbackThread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CsvSettings.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Directory.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FifoVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileWriter.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/GarbageCollector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Logger.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Resources.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/StringLookup.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Thread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/ThreadedBuffer.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Molecules" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/BaseCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Callbacks.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Property.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/String.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/StringVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Vector.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Atoms" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Callable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Freeable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Lockable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/MemFuncs.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Bookshelfs" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/AbstractSquirrel.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BAttribute.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BField.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFields.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFunctions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BNode.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecord.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecords.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BTable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BValue.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/RemoteSquirrel.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Materials" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CallbackThread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CsvSettings.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Directory.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FifoVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileWriter.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/GarbageCollector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Logger.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Resources.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/StringLookup.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Thread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/ThreadedBuffer.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Molecules" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/BaseCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Callbacks.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Property.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/String.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/StringVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Vector.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Atoms" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Callable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Freeable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Lockable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/MemFuncs.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Bookshelfs" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/AbstractSquirrel.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BAttribute.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BField.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFields.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFunctions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BNode.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecord.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecords.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BTable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BValue.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/RemoteSquirrel.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Materials" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CallbackThread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CsvSettings.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Directory.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FifoVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileWriter.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/GarbageCollector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Logger.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Resources.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/StringLookup.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Thread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/ThreadedBuffer.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Molecules" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/BaseCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Callbacks.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Property.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/String.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/StringVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Vector.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Atoms" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Callable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Freeable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/Lockable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Atoms/MemFuncs.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Bookshelfs" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/AbstractSquirrel.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BAttribute.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BField.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFields.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BFunctions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BNode.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecord.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BRecords.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BTable.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/BValue.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Bookshelfs/RemoteSquirrel.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Materials" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CallbackThread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/CsvSettings.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Directory.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FifoVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/FileWriter.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/GarbageCollector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Logger.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Resources.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/StringLookup.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/Thread.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Materials/ThreadedBuffer.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Groundfloor/Molecules" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/BaseCommunicator.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Callbacks.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Property.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/String.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/StringVector.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Groundfloor/Molecules/Vector.h"
      )
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Groundfloor/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
