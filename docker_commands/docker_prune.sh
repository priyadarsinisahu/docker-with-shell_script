#!/bin/bash

# ----------------------------------------------------------
# Function: Docker system prune (23)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


echo -e "\n${RED}WARNING: This will remove unused Docker resources${NC}\n"

read -p "Are you sure? (yes/no): " ANSWER

if [ "$ANSWER" = "yes" ];
then
	docker system prune -f
	
	echo -e "$\n${GREEN}Docker cleanup completed${NC}"
	echo "-----------------------------------------------"
else
	echo -e "$\n${YELLOW}Cleanup cancelled${NC}"
	exit 1
fi
