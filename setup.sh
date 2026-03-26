#!/bin/bash

clear
echo "=================================="
echo "     YASIR RAHIM TOOL"
echo "=================================="
echo ""
echo "[1] Setup Install"
echo "[2] Run Nmap Scan"
echo "[3] Exit"
echo ""

read -p "Choose option: " choice

if [ $choice -eq 1 ]; then
    echo "Starting Setup..."
    
    pkg update -y && pkg upgrade -y
    pkg install -y git curl wget nano python
    pkg install -y nmap
    pip install requests
    
    mkdir -p ~/projects
    mkdir -p ~/tools
    
    echo "Setup Completed Successfully!"

elif [ $choice -eq 2 ]; then
    read -p "Enter target: " target
    nmap $target

elif [ $choice -eq 3 ]; then
    exit

else
    echo "Invalid option"
fi
