cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(
    "protobuf-interface-example"
    VERSION 1.0.0
    LANGUAGES CXX)

# Global CMake Variabls
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Project/Library Names
set(LIBRARY_ROBOT_INTERFACE "lib_robot_interface")

# Protobuf
find_package(Protobuf REQUIRED)
if ( Protobuf_FOUND )
    message( STATUS "Protobuf version : ${Protobuf_VERSION}" )
    message( STATUS "Protobuf include path : ${Protobuf_INCLUDE_DIRS}" )
    message( STATUS "Protobuf libraries : ${Protobuf_LIBRARIES}" )
endif()

# Subdirectories
add_subdirectory(interface/cpp)