#!/bin/bash

# ----------------------------------------------------------
# Function: Docker disk usage (22)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


echo -e "${SKY}------------------${NC}"
echo -e "${SKY}Docker disk usage: ${NC}"
echo -e "${SKY}------------------${NC}"

docker system df
