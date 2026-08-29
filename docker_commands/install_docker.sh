#!/bin/bash

# ----------------------------------------------------------
# Function: Install Docker (2)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'



# sudo -v

echo -e "\n${PURPLE}======= update linux package =======${NC}"
sudo apt-get update


echo -e "\n${PURPLE}======= Installing docker... =======${NC}"
sudo apt-get install -y docker.io


echo -e "\n${PURPLE}======= Starting docker... =======${NC}"
# sudo systemctl enable docker
sudo systemctl start docker


# echo "*************************************************************************"
echo -e "\n${GREEN}Docker installation completed${NC}"


echo -e "\n*************************************************************************"
docker --version
echo "*************************************************************************"
