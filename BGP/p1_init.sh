#!/bin/bash

echo "Updating package list..."
if sudo apt update >/dev/null 2>&1; then
    echo "✓ Package list updated successfully"
else
    echo "✗ Failed to update package list"
    sudo apt update
    exit 1
fi

echo "Installing Docker..."
if sudo apt install -y docker.io >/dev/null 2>&1; then
    echo "✓ Docker installed successfully"
else
    echo "✗ Failed to install Docker"
    sudo apt install -y docker.io
    exit 1
fi

echo "Starting Docker service..."
if sudo systemctl start docker >/dev/null 2>&1; then
    echo "✓ Docker service started"
else
    echo "✗ Failed to start Docker service"
    sudo systemctl status docker
    exit 1
fi

if sudo systemctl enable docker >/dev/null 2>&1; then
    echo "✓ Docker service enabled"
else
    echo "✗ Failed to enable Docker service"
    sudo systemctl status docker
fi

echo "Installing pip3..."
if sudo apt install -y python3-pip net-tools >/dev/null 2>&1; then
    echo "✓ pip3 installed successfully"
else
    echo "✗ Failed to install pip3"
    exit 1
fi

echo "Installing gns3-server..."
if sudo pip3 install gns3-server --break-system-packages >/dev/null 2>&1; then
    echo "✓ gns3-server installed successfully"
    export PATH=$HOME/.local/bin:$PATH
    nohup sudo gns3server >/dev/null 2>&1 &
    echo "GNS3 server is running in the background"
else
    echo "✗ Failed to install gns3-server"
    exit 1
fi

IP_ADDR=$(sudo ifconfig | grep -w "inet" | grep "192.168" | awk '{print $2}')
echo ""
echo -e "\e[1;32mhttp://$IP_ADDR:3080\e[0m"
echo ""
echo "🎉 init.sh script completed successfully!"