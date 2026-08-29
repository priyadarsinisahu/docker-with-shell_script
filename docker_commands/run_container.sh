#!/bin/bash

# ----------------------------------------------------------
# Function: Run container (11)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


read -p "Enter image name: " IMAGE
read -p "Enter container name: " CONTAINER

if [ -z "$IMAGE" ] || [ -z "$CONTAINER" ];
then
	echo -e "${PURPLE}Image name and container name are required${NC}"
	exit 1
fi	

docker run -d --name "$CONTAINER" "$IMAGE"

echo -e "${GREEN}Container started successfully${NC}"
