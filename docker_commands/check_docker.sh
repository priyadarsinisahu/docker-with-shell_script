# ----------------------------------------------------------
# Function: Check whether Docker is installed
# ----------------------------------------------------------


#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if command -v docker &>/dev/null;
then
    echo -e "${GREEN}Docker is installed.${NC}"
    docker --version
else
    echo -e "${RED}Docker is not installed.${NC}"
    exit 1
fi
