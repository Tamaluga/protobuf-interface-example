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
readonly C_SHARP_PROJECT_FILE="interface/c_sharp/RobotControlInterface.csproj"
EXIT_CODE=0

# Get the versions
VERSION=$(cat ${VERSION_FILE})
CPP_VERSION=$(sed -n 's/^[[:space:]]*VERSION \([^[:space:]]*\)[[:space:]]*$/\1/p' ${CPP_PROJECT_FILE})
C_SHARP_VERSION=$(sed -n 's:.*<Version>\(.*\)</Version>.*:\1:p' ${C_SHARP_PROJECT_FILE})

# Check if the versions are up to date
if [ "$VERSION" != "$CPP_VERSION" ] || [ "$VERSION" != "$C_SHARP_VERSION" ]; then
    EXIT_CODE=1
fi

# Check if the version is not existing already
TAGS=$(git tag)
if echo "${TAGS}" | grep -q "^${VERSION}$"; then
    echo "The tag '$VERSION' already exists."
    EXIT_CODE=1
fi

# Switch to the origin directory
popd > /dev/null

exit ${EXIT_CODE}