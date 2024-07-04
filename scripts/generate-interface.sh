#!/bin/bash

# Enable strict error handling: exit on error (-e), treat unset variables as an error (-u), and fail if any command in a pipeline fails (-o pipefail)
set -euo pipefail 

# switch to project top folder
SCRIPT_PATH=$(dirname $(readlink -f "$0"))
pushd "${SCRIPT_PATH}/.." > /dev/null

############################################################
# Main program                                             #
############################################################

# Constants
readonly INTERFACE_FOLDER="interface"
readonly INTERFACE_FOLDER_C="${INTERFACE_FOLDER}/cpp"
readonly INTERFACE_FOLDER_C_SHARP="${INTERFACE_FOLDER}/c_sharp"

# Create directories
mkdir -p ${INTERFACE_FOLDER_C} ${INTERFACE_FOLDER_C_SHARP}

# Generate proto interface
protoc --proto_path=${INTERFACE_FOLDER} --cpp_out=${INTERFACE_FOLDER_C} RobotInterface.proto 
protoc --proto_path=${INTERFACE_FOLDER} --csharp_out=${INTERFACE_FOLDER_C_SHARP} RobotInterface.proto 

# Update the version
# ./scripts/update-version.sh

# Switch to the origin directory
popd > /dev/null
