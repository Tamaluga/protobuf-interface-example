cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(
    "protobuf-interface-example"
    VERSION 1.9.0
    LANGUAGES CXX)

# Global CMake Variabls
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Project/Library Names
set(LIBRARY_ROBOT_INTERFACE "lib_robot_interface")

# Get protobuf
find_package(Protobuf REQUIRED)
if ( Protobuf_FOUND )
    message( STATUS "Protobuf version : ${Protobuf_VERSION}" )
    message( STATUS "Protobuf include path : ${Protobuf_INCLUDE_DIRS}" )
    message( STATUS "Protobuf libraries : ${Protobuf_LIBRARIES}" )
endif()

# Configure the version header file
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/RobotInterfaceVersion.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/RobotInterfaceVersion.h
)

# Sources and headers
set(TARGET_INCLUDE_DIR
    ${CMAKE_CURRENT_SOURCE_DIR}
)
set(TARGET_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/RobotInterfaceVersion.h
    ${CMAKE_CURRENT_SOURCE_DIR}/RobotInterface.pb.h
    ${CMAKE_CURRENT_SOURCE_DIR}/RobotInterface.pb.cc
)

# Create library
add_library_any(${LIBRARY_ROBOT_INTERFACE} STATIC ${TARGET_SOURCES})
target_include_directories(${LIBRARY_ROBOT_INTERFACE} PUBLIC ${TARGET_INCLUDE_DIR})
target_link_libraries(${LIBRARY_ROBOT_INTERFACE} PUBLIC ${Protobuf_LIBRARIES})