#!/bin/bash
set -xe

# Define the destination directory
DESTINATION_DIR="/usr/local/codedeployresources"

# Delete the old directory if it exists
if [ -d $DESTINATION_DIR ]; then
    echo "Removing old directory: $DESTINATION_DIR"
    rm -rf $DESTINATION_DIR
fi

# Create a new directory
echo "Creating new directory: $DESTINATION_DIR"
mkdir -vp $DESTINATION_DIR
