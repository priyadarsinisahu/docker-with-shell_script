#!/bin/bash

# ----------------------------------------------------------
# Function: Start Docker Service (3)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


# echo "-------------------------------------------------------------------------"
echo -e "\n${PURPLE}======= Starting docker... =======${NC}"
sudo systemctl start docker


echo -e "\n${GREEN}Docker service started${NC}"


echo -e "\n${PURPLE}============== Docker Status ==============${NC}\n"
sudo systemctl status docker --no-pager
