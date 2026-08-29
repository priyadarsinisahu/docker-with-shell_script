#!/bin/bash

# ----------------------------------------------------------
# Function: Docker info (8)
# ----------------------------------------------------------


set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


echo -e "\n${SKY}Docker info: ${NC}"
docker info
