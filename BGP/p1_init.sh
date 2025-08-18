#!/bin/bash

echo "Updating package list..."
if apt update >/dev/null 2>&1; then
    echo "✓ Package list updated successfully"
else
    echo "✗ Failed to update package list"
    apt update
    exit 1
fi

echo "Installing Docker..."
if apt install -y docker.io >/dev/null 2>&1; then
    echo "✓ Docker installed successfully"
else
    echo "✗ Failed to install Docker"
    apt install -y docker.io
    exit 1
fi

echo "Starting Docker service..."
if systemctl start docker >/dev/null 2>&1; then
    echo "✓ Docker service started"
else
    echo "✗ Failed to start Docker service"
    systemctl status docker
    exit 1
fi

if systemctl enable docker >/dev/null 2>&1; then
    echo "✓ Docker service enabled"
else
    echo "✗ Failed to enable Docker service"
    systemctl status docker
fi

echo "Installing gns3..."
if apt install -y 
 gns3-gui >/dev/null 2>&1; then
    echo "✓ GNS3 installed successfully"
else
    echo "✗ Failed to install gns3"
    exit 1
fi

echo "Installing npm..."
if apt install -y git nodejs npm >/dev/null 2>&1; then
    echo "✓ npm installed successfully"
else
    echo "✗ Failed to install npm"
    exit 1
fi

echo "Installing GNS3 Web-UI..."
if git clone https://github.com/GNS3/gns3-web-ui.git  > /dev/null 2>&1; then
    echo "✓ GNS3 Web-UI installed successfully"
    cd gns3-web-ui
    exho "Installing GNS3 Web-UI dependencies..."
    npm install
    npm start
    echo "✓ GNS3 Web-UI dependencies installed successfully"
    echo "http://localhost:3080"
else
    echo "✗ Failed to install GNS3 Web-UI"
    exit 1
fi

echo ""
echo "🎉 init.sh script completed successfully!"