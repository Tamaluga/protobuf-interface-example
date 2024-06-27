# Sources and headers
set(TARGET_INCLUDE_DIR
    .
)
set(TARGET_SOURCES
    ./Robot.pb.h
    ./Robot.pb.cc
)

# Create target
add_library_any(${LIBRARY_ROBOT_INTERFACE} STATIC ${TARGET_SOURCES})
target_include_directories(${LIBRARY_ROBOT_INTERFACE} PUBLIC ${TARGET_INCLUDE_DIR})
target_link_libraries(${LIBRARY_ROBOT_INTERFACE} PUBLIC ${Protobuf_LIBRARIES})