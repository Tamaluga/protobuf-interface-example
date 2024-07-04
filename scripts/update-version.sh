#!/bin/bash

# Enable strict error handling: exit on error (-e), treat unset variables as an error (-u), and fail if any command in a pipeline fails (-o pipefail)
set -euo pipefail 

# switch to project top folder
SCRIPT_PATH=$(dirname $(readlink -f "$0"))
pushd "${SCRIPT_PATH}/.." > /dev/null

############################################################
# Main program                                             #
############################################################

readonly VERSION_FILE="version.txt"
readonly CPP_PROJECT_FILE="interface/cpp/CMakeLists.txt"
readonly C_SHARP_PROJECT_FILE="interface/c_sharp/RobotInterface.csproj"

# Get the version
VERSION=$(cat ${VERSION_FILE})

# Update C++ version
sed -i "s/\(VERSION \)[^ ]*\$/\1${VERSION}/" ${CPP_PROJECT_FILE}

# Update C# version
sed -i "s#<Version>.*</Version>#<Version>${VERSION}</Version>#" ${C_SHARP_PROJECT_FILE}

# Switch to the origin directory
popd > /dev/null