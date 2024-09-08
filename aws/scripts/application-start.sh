#!/bin/bash
set -xe

# Define the application directory and start script
APPLICATION_DIR="/usr/local/codedeployresources"  # Update if necessary
START_SCRIPT="index.js"  # Replace with your actual start script (e.g., index.js, app.js)

# Navigate to the application directory
cd $APPLICATION_DIR

# Ensure the correct version of Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install it."
    exit 1
fi

# Start the Node.js application using PM2 if available, otherwise fallback to npm or node
if command -v pm2 &> /dev/null; then
    # Check if the application is already running
    if pm2 describe $START_SCRIPT > /dev/null; then
        echo "Application already running, restarting..."
        pm2 restart $START_SCRIPT
    else
        echo "Starting application with PM2..."
        pm2 start $START_SCRIPT --name "node-cicd-practice"
    fi
else
    # Start the application with npm or node
    if [ -f "package.json" ]; then
        npm start
    else
        node $START_SCRIPT
    fi
fi
