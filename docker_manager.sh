#!/bin/bash

# ==========================================================
# Docker Management Script
# Purpose: Practice Docker + Shell Scripting
# ==========================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
SKY='\033[1;36m'
NC='\033[0m'


# ----------------------------------------------------------
# Function: Check whether Docker is installed (1)
# ----------------------------------------------------------

check_docker() {

    if command -v docker &>/dev/null; then
        echo -e "${GREEN}Docker is installed${NC}"
        docker --version
    else
        echo -e "${RED}Docker is not installed${NC}"
        return 1
    fi   
}


# ----------------------------------------------------------
# Function: Install Docker (2)
# ----------------------------------------------------------

install_docker() {

    echo "Installing Docker..."

    sudo apt-get update

    sudo apt-get install -y docker.io

    sudo systemctl enable docker
    sudo systemctl start docker

    echo -e "${GREEN}Docker installation completed${NC}"

    docker --version
}


# ----------------------------------------------------------
# Function: Start Docker service (3)
# ----------------------------------------------------------

start_docker() {

    sudo systemctl start docker

    echo -e "${GREEN}Docker service started${NC}"

    sudo systemctl status docker --no-pager
}


# ----------------------------------------------------------
# Function: Stop Docker service (4)
# ----------------------------------------------------------

stop_docker() {

    sudo systemctl stop docker

    echo -e "${YELLOW}Docker service stopped${NC}"
}


# ----------------------------------------------------------
# Function: Restart Docker service (5)
# ----------------------------------------------------------

restart_docker() {

    sudo systemctl restart docker

    echo -e "${GREEN}Docker service restarted${NC}"
}


# ----------------------------------------------------------
# Function: Docker status (6)
# ----------------------------------------------------------

docker_status() {

    if sudo systemctl is-active --quiet docker; then
        echo -e "${GREEN}Docker is running${NC}"
    else
        echo -e "${RED}Docker is not running${NC}"
    fi
}


# ----------------------------------------------------------
# Function: Pull Docker image (9)
# ----------------------------------------------------------

pull_image() {

    read -p "Enter image name: " IMAGE

    if [ -z "$IMAGE" ]; then
        echo "Image name cannot be empty"
        return 1
    fi

    docker pull "$IMAGE"
}


# ----------------------------------------------------------
# Function: List Docker images (10)
# ----------------------------------------------------------

list_images() {

    echo "Docker Images:"
    docker images
}


# ----------------------------------------------------------
# Function: Run container (11)
# ----------------------------------------------------------

run_container() {

    read -p "Enter image name: " IMAGE
    read -p "Enter container name: " CONTAINER

    if [ -z "$IMAGE" ] || [ -z "$CONTAINER" ]; then
        echo "Image and container name are required"
        return 1
    fi

    docker run -d \
        --name "$CONTAINER" \
        "$IMAGE"

    echo -e "${GREEN}Container started successfully${NC}"
}


# ----------------------------------------------------------
# Function: List running containers (12)
# ----------------------------------------------------------

list_running_containers() {

    echo "Running containers:"
    docker ps
}


# ----------------------------------------------------------
# Function: List all containers (13)
# ----------------------------------------------------------

list_all_containers() {

    echo "All containers:"
    docker ps -a
}


# ----------------------------------------------------------
# Function: Stop container (14)
# ----------------------------------------------------------

stop_container() {

    read -p "Enter container name/ID: " CONTAINER

    docker stop "$CONTAINER"

    echo -e "${YELLOW}Container stopped${NC}"
}


# ----------------------------------------------------------
# Function: Start container (15)
# ----------------------------------------------------------

start_container() {

    read -p "Enter container name/ID: " CONTAINER

    docker start "$CONTAINER"

    echo -e "${GREEN}Container started${NC}"
}


# ----------------------------------------------------------
# Function: Restart container (16)
# ----------------------------------------------------------

restart_container() {

    read -p "Enter container name/ID: " CONTAINER

    docker restart "$CONTAINER"

    echo -e "${GREEN}Container restarted${NC}"
}


# ----------------------------------------------------------
# Function: Container logs (17)
# ----------------------------------------------------------

container_logs() {

    read -p "Enter container name/ID: " CONTAINER

    docker logs "$CONTAINER"
}


# ----------------------------------------------------------
# Function: Execute command inside container (18)
# ----------------------------------------------------------

exec_container() {

    read -p "Enter container name/ID: " CONTAINER

    docker exec -it "$CONTAINER" /bin/bash
}


# ----------------------------------------------------------
# Function: Remove container (19)
# ----------------------------------------------------------

remove_container() {

    read -p "Enter container name/ID: " CONTAINER

    docker rm "$CONTAINER"

    echo -e "${GREEN}Container removed${NC}"
}


# ----------------------------------------------------------
# Function: Force remove container (20)
# ----------------------------------------------------------

force_remove_container() {

    read -p "Enter container name/ID: " CONTAINER

    docker rm -f "$CONTAINER"

    echo -e "${GREEN}Container forcefully removed${NC}"
}


# ----------------------------------------------------------
# Function: Remove image (21)
# ----------------------------------------------------------

remove_image() {

    read -p "Enter image name/ID: " IMAGE

    docker rmi "$IMAGE"

    echo -e "${GREEN}Image removed${NC}"
}


# ----------------------------------------------------------
# Function: Docker disk usage (22)
# ----------------------------------------------------------

docker_disk_usage() {

    docker system df
}


# ----------------------------------------------------------
# Function: Docker system prune (23)
# ----------------------------------------------------------

docker_prune() {

    echo "WARNING: This will remove unused Docker resources."

    read -p "Are you sure? (yes/no): " ANSWER

    if [ "$ANSWER" = "yes" ]; then

        docker system prune -f

        echo -e "${GREEN}Docker cleanup completed${NC}"

    else

        echo "Cleanup cancelled"

    fi
}


# ----------------------------------------------------------
# Function: Docker version (7)
# ----------------------------------------------------------

docker_version() {

    docker version
}


# ----------------------------------------------------------
# Function: Docker info (8)
# ----------------------------------------------------------

docker_info() {

    docker info
}


# ----------------------------------------------------------
# Function: Uninstall Docker (24)
# ----------------------------------------------------------

uninstall_docker() {

    echo -e "${RED}WARNING: Docker will be removed from the system.${NC}"

    read -p "Are you sure? (yes/no): " ANSWER

    if [ "$ANSWER" = "yes" ]; then

        sudo systemctl stop docker

        sudo apt-get remove -y docker.io

        echo "Docker uninstalled"

    else

        echo "Uninstall cancelled"
    fi
}


# ==========================================================
# Main Menu
# ==========================================================

while true
do

    echo
    echo "=========================================="
    echo "        DOCKER MANAGEMENT TOOL"
    echo "=========================================="

    echo "1.  Check Docker installation"
    echo "2.  Install Docker"
    echo "3.  Start Docker"
    echo "4.  Stop Docker"
    echo "5.  Restart Docker"
    echo "6.  Docker Status"
    echo "7.  Docker Version"
    echo "8.  Docker Info"
    echo "9.  Pull Image"
    echo "10. List Images"
    echo "11. Run Container"
    echo "12. List Running Containers"
    echo "13. List All Containers"
    echo "14. Stop Container"
    echo "15. Start Container"
    echo "16. Restart Container"
    echo "17. Container Logs"
    echo "18. Execute Command in Container"
    echo "19. Remove Container"
    echo "20. Force Remove Container"
    echo "21. Remove Image"
    echo "22. Docker Disk Usage"
    echo "23. Docker System Prune"
    echo "24. Uninstall Docker"
    echo "25. Exit"

    echo "=========================================="

    read -p "Enter your choice: " CHOICE

    case "$CHOICE" in

        1)
            check_docker
            ;;

        2)
            install_docker
            ;;

        3)
            start_docker
            ;;

        4)
            stop_docker
            ;;

        5)
            restart_docker
            ;;

        6)
            docker_status
            ;;

        7)
            docker_version
            ;;

        8)
            docker_info
            ;;

        9)
            pull_image
            ;;

        10)
            list_images
            ;;

        11)
            run_container
            ;;

        12)
            list_running_containers
            ;;

        13)
            list_all_containers
            ;;

        14)
            stop_container
            ;;

        15)
            start_container
            ;;

        16)
            restart_container
            ;;

        17)
            container_logs
            ;;

        18)
            exec_container
            ;;

        19)
            remove_container
            ;;

        20)
            force_remove_container
            ;;

        21)
            remove_image
            ;;

        22)
            docker_disk_usage
            ;;

        23)
            docker_prune
            ;;

        24)
            uninstall_docker
            ;;

        25)
            echo "Exiting..."
            exit 0
            ;;

        *)
            echo -e "${RED}Invalid option${NC}"
            ;;

    esac

done
