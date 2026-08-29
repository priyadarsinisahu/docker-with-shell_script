#!/bin/bash

# ----------------------------------------------------------
# Function: Stop Docker Service (4)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


# echo -e "----------------------------------------------------------------------\n"
echo -e "\n${PURPLE}======= Stopping docker... =======${NC}\n"
sudo systemctl stop docker


# echo "----------------------------------------------------------------------"
echo -e "\n${YELLOW}Docker service stopped${NC}"


echo -e "\n${PURPLE}============== Docker Status ==============${NC}\n"
sudo systemctl status docker --no-pager
