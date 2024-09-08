#!/bin/bash
set -xe

# Check Node.js version
node_version=$(node -v)
echo "Using Node.js version: $node_version"

# Optionally enforce a specific Node.js version (e.g., 16.x.x)
if [[ $node_version != v20* ]]; then
    echo "Please use Node.js v20.x.x"
    exit 1
fi

# Set CI environment variable
export CI=true

# Install dependencies using npm ci for faster and more reliable installs in CI environments
npm ci

# Run the build script as defined in package.json
npm run build
