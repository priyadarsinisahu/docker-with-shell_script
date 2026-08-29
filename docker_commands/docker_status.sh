#!/bin/bash

# ----------------------------------------------------------
# Function: Docker status (6)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


if sudo systemctl is-active --quiet docker;
then
	echo -e "\n${GREEN}Docker is running${NC}\n"
else
	echo -e "\n${RED}Docker is not running${NC}\n"
	
#	echo -e "\n${PURPLE}======= Starting docker... =======${NC}"
#	sudo systemctl start docker
#	
#	echo -e "\n${PURPLE}============== Docker running status ==============${NC}\n"
#	sudo systemctl is-active docker
fi
