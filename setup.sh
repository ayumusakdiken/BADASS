#!/bin/bash

echo "Starting Vagrant VM..."
if ! vagrant up &> /dev/null; then
    echo "Error while starting VM:"
    echo "Failed to start Vagrant VM"
    exit 1
fi
echo "Vagrant VM started successfully."

echo "Waiting for Vagrant to be ready..."
while true; do
    if vagrant ssh -c "exit" &> /dev/null; then
        break
    fi
    sleep 5
done

echo "Copying ./BGP folder to VM..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if ! vagrant upload "$SCRIPT_DIR/BGP" /home/vagrant/BGP &> /dev/null; then
    echo "Error while uploading BGP folder:"
    echo "Failed to upload BGP folder to VM"
    exit 1
fi
echo "Files copied to VM successfully."

if ! vagrant ssh -c "bash /home/vagrant/BGP/p1_init.sh"; then
    echo "Error while executing init script:"
    echo "Failed to execute initialization script"
    exit 1
fi

echo "GNS3 initialization script executed successfully."