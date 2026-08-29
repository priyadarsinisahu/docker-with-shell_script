#!/bin/bash

# ----------------------------------------------------------
# Function: Restart Docker Service (5)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


# echo "----------------------------------------------------------------------"
echo -e "\n${PURPLE}======= Restarting docker... =======${NC}"
sudo systemctl restart docker


# echo "----------------------------------------------------------------------"
echo -e "\n${GREEN}Docker service restarted${NC}"


echo -e "\n${PURPLE}============== Docker Status ==============${NC}\n"
sudo systemctl status docker --no-pager
