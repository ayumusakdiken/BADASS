#!/bin/bash

echo "Starting Vagrant VM..."
if ! vagrant up &>/dev/null; then
    echo "Error while starting VM"
    exit 1
fi

echo "Vagrant VM started successfully."

echo "Waiting for Vagrant to be ready..."
while true; do
    vagrant ssh -c "exit" &>/dev/null
    if [ $? -eq 0 ]; then
        break
    fi
    sleep 5
done

echo "Copying ./BGP folder to VM..."
if ! vagrant scp ./BGP/ default:/home/vagrant/BGP -r &>/dev/null; then
    echo "Error while uploading BGP folder"
    exit 1
fi

echo "Files copied to VM successfully."
