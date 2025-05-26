#!/bin/bash

echo "Starting WSL Ubuntu cleanup..."

# Clean apt cache
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

# Clean user and system temporary files
echo "Removing temp files..."
rm -rf /tmp/*
rm -rf ~/.cache/*
rm -rf ~/.thumbnails/*
rm -rf ~/.local/share/Trash/*

# Optionally clean log files
echo "Clearing log files..."
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;

echo "WSL cleanup complete!"
