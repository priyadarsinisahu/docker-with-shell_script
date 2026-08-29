#!/bin/bash

# ----------------------------------------------------------
# Function: Execute command inside container (18)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


echo -e "\n${SKY}All containers${NC}"
docker ps -a


read -p "Enter container name/ID to execute command inside: " CONTAINER

docker exec -it "$CONTAINER" /bin/bash

# type 'exit' to come out of the inside container
