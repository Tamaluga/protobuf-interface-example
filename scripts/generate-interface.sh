#!/bin/bash

# Enable strict error handling: exit on error (-e), treat unset variables as an error (-u), and fail if any command in a pipeline fails (-o pipefail)
set -euo pipefail 

# Constants
readonly INTERFACE_FOLDER="interface"
readonly INTERFACE_FOLDER_C="${INTERFACE_FOLDER}/c"
readonly INTERFACE_FOLDER_C_SHARP="${INTERFACE_FOLDER}/c_sharp"

# Create directories
mkdir -p ${INTERFACE_FOLDER_C} ${INTERFACE_FOLDER_C_SHARP}

# Generate proto interface
protoc --proto_path=${INTERFACE_FOLDER} --cpp_out=${INTERFACE_FOLDER_C} --csharp_out=${INTERFACE_FOLDER_C_SHARP} Robot.proto 