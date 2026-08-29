#!/bin/bash

# ----------------------------------------------------------
# Function: Remove container (19)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


echo -e "${SKY}All containers${NC}"
docker ps -a


read -p "Enter container name/ID: " CONTAINER

docker rm "$CONTAINER"

echo -e "${PURPLE}Container removed${NC}"
