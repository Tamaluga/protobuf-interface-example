#!/bin/bash

# Enable strict error handling: exit on error (-e), treat unset variables as an error (-u), and fail if any command in a pipeline fails (-o pipefail)
set -euo pipefail 

# switch to project top folder
SCRIPT_PATH=$(dirname $(readlink -f "$0"))
pushd "${SCRIPT_PATH}/.." > /dev/null

############################################################
# Main program                                             #
############################################################

# Define script variables
EXIT_CODE=0

# Regenerate the interface files
./scripts/generate-interface.sh

# Check if there is a diff
GIT_DIFF=$(git diff HEAD)
if [ ! -z "${GIT_DIFF}" ]; then echo ${GIT_DIFF} && EXIT_CODE=1; fi

# Switch to the origin directory
popd > /dev/null

exit ${EXIT_CODE}