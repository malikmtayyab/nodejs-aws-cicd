#!/bin/bash
set -xe

# Define the S3 bucket and destination directory
S3_BUCKET_NAME="node-cicd-practice-webappdeploymentbucket-zwtwprfly8ch"
DESTINATION_DIR="/usr/local/codedeployresources"

# Create the destination directory if it doesn't exist
mkdir -p $DESTINATION_DIR

# Copy application files from S3 bucket to the destination directory
aws s3 cp s3://$S3_BUCKET_NAME/ $DESTINATION_DIR --recursive

# Navigate to the application directory
cd $DESTINATION_DIR

# Install Node.js dependencies
npm install

# Ensure the correct ownership and permissions
# Replace 'node' with the actual user and group if necessary
chown -R node:node $DESTINATION_DIR
