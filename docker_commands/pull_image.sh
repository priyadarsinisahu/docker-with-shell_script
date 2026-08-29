#!/bin/bash

# ----------------------------------------------------------
# Function: Pull Docker image (9)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


read -p "Enter image name: " IMAGE

if [ -z "$IMAGE" ];
then
	echo -e "${RED}Image name cannot be empty${NC}"
	exit 1
fi

echo -e "\n${PURPLE}======= pulling docker image... =======${NC}"
docker pull "$IMAGE"



<<comment
read -->  takes input from the user
-p   -->  displays a prompt before taking input
-z   -->  is the string length zero?
comment
