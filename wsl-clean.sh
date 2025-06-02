#!/bin/bash

# wsl-clean.sh: Script to clean up WSL Ubuntu environment with colored output

# Exit on error
set -e

# Define ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting WSL Ubuntu cleanup...${NC}"

# Clear package cache
echo -e "${YELLOW}Cleaning APT cache...${NC}"
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove -y

# Remove orphaned packages
echo -e "${YELLOW}Removing orphaned packages...${NC}"
sudo apt-get autoremove --purge -y

# Clear temporary files
echo -e "${YELLOW}Clearing temporary files...${NC}"
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

# Clear system logs older than 7 days
echo -e "${YELLOW}Clearing old system logs...${NC}"
sudo find /var/log -type f -name "*.log" -mtime +7 -delete
sudo find /var/log -type f -name "*.gz" -delete

# Clear user cache
echo -e "${YELLOW}Clearing user cache...${NC}"
rm -rf ~/.cache/*

# Clear Docker data (if Docker is installed)
if command -v docker &>/dev/null; then
  echo -e "${YELLOW}Cleaning Docker data...${NC}"
  docker system prune -f --volumes
fi

# Display disk space before and after
echo -e "${YELLOW}Disk space before cleanup:${NC}"
df -h /
echo -e "${YELLOW}Running cleanup...${NC}"
sync
echo -e "${YELLOW}Disk space after cleanup:${NC}"
df -h /

echo -e "${GREEN}WSL Ubuntu cleanup completed!${NC}"
