#!/bin/bash

# ----------------------------------------------------------
# Function: Uninstall Docker (24)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


echo -e "\n${RED}WAARNING: Docker will be removed from system.${NC}\n"

read -p "Are you sure? (yes/no): " ANSWER

if [ "$ANSWER" = "yes" ];
then
	echo -e "\n${PURPLE}Stopping Docker service.....${NC}"
	sudo systemctl stop docker
	
	echo -e "\n${PURPLE}Uninstalling Docker package.....${NC}"
	sudo apt-get remove -y docker.io
	
	echo -e "\n${GREEN}Docker uninstalled successfully${NC}"
	echo "-----------------------------------------"
else
	echo -e "\n${YELLOW}Uninsatll cancelled${NC}"
fi
