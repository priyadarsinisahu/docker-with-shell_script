#!/bin/bash

# ----------------------------------------------------------
# Function: Check whether Docker is installed (1)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


if command -v docker &>/dev/null;
then
    echo -e "\n*************************************************************************"
    echo -e "${GREEN}Docker is installed.${NC}"
    echo "*************************************************************************"
    docker --version
    echo -e "*************************************************************************\n"
else
    echo -e "${RED}Docker is not installed.${NC}"
    exit 1
fi
