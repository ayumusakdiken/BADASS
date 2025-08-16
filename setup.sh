#!/bin/bash

vagrant up

while ! vagrant ssh -c "exit" 2>/dev/null; do
  echo "Waiting for Vagrant to be ready..."
  sleep 5
done

SERVER_IP=$(vagrant ssh -c "hostname -I | awk '{print \$2}'" 2>/dev/null | tr -d '\r')

echo "Detected VM IP: $SERVER_IP"

scp -r ./BGP vagrant@$SERVER_IP:/home/vagrant/BGP
echo "Files copied to VM successfully."
