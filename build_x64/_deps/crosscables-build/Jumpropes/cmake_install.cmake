# Install script for directory: C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/Debug/Jumpropes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/Release/Jumpropes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/MinSizeRel/Jumpropes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/RelWithDebInfo/Jumpropes.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/CMakeFiles/Jumpropes.dir/install-cxx-module-bmi-Debug.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/CMakeFiles/Jumpropes.dir/install-cxx-module-bmi-Release.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/CMakeFiles/Jumpropes.dir/install-cxx-module-bmi-MinSizeRel.cmake" OPTIONAL)
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    include("C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/CMakeFiles/Jumpropes.dir/install-cxx-module-bmi-RelWithDebInfo.cmake" OPTIONAL)
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/Debug/Jumpropes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/Release/Jumpropes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/MinSizeRel/Jumpropes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/RelWithDebInfo/Jumpropes.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/BaseSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ClientSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/LookupCache.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/NetAddress.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ServerSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedSender.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedServer.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/URI.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes/Common" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpClient.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpDownloader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/BaseSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ClientSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/LookupCache.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/NetAddress.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ServerSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedSender.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedServer.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/URI.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes/Common" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpClient.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpDownloader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/BaseSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ClientSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/LookupCache.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/NetAddress.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ServerSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedSender.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedServer.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/URI.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes/Common" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpClient.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpDownloader.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/BaseSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ClientSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Defines.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Functions.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Initialize.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/LookupCache.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/NetAddress.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ServerSocket.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedSender.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/ThreadedServer.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/URI.h"
      )
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Jumpropes/Common" TYPE FILE FILES
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpClient.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpConnection.h"
      "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-src/Jumpropes/Common/HttpDownloader.h"
      )
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/Administrator/Documents/obs-studio/plugins/OBSInfoWriter/build_x64/_deps/crosscables-build/Jumpropes/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
