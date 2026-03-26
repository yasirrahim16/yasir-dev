#!/bin/bash

echo "Starting Yasir Setup..."

# Update system
pkg update -y && pkg upgrade -y

# Basic packages
pkg install -y git curl wget nano python

# Useful tools
pkg install -y nmap

# Python tools
pip install requests

# Create folders
mkdir ~/projects
mkdir ~/tools

echo "Setup Completed Successfully!"
