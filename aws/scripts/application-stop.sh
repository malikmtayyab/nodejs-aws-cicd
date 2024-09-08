#!/bin/bash
set -xe

# Define the application name or script you want to stop
APP_NAME="node-cicd-practice"  # Replace with the name you gave the PM2 app or script

# Stop the application using PM2 if it's running
if command -v pm2 &> /dev/null; then
    if pm2 describe $APP_NAME > /dev/null; then
        echo "Stopping application with PM2..."
        pm2 stop $APP_NAME
    else
        echo "PM2: No running application found."
    fi
else
    echo "PM2 is not installed, cannot stop application."
fi
