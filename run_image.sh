#!/bin/bash
# HOW TO USE
#   ./run_image.sh <docker_image_name> <container_name> <host_port>

IMAGE_NAME=$1
CONTAINER_NAME=$2
HOST_PORT=$3

WORKDIR=$(pwd)
DEFAUL_HOST_PORT="9090"
LATEST_EDIA_DOCKER_IMAGE="fvialibre/edia:latest"
HOST_CONFIG_DIR="host_config"
HOST_LOGS_DIR="host_logs"
HOST_DATA_DIR="host_data"


if [[ $IMAGE_NAME == "" ]];
then
    echo "Error: You must insert the <docker_image_name> as the first parameter of the command line!
    
    USE:
    $ ./run_image.sh <docker_image_name> <container_name> <host_port>
    "
    exit 1
fi 

if [[ $CONTAINER_NAME == "" ]];
then
    echo "Error: You must insert the <container_name> to generate as the second parameter of the command line!
    
    USE:
    $ ./run_image.sh <docker_image_name> <container_name> <host_port>
    "
    exit 1
fi

if [[ $HOST_PORT == "" ]];
then
    echo "* Setting '$DEFAUL_HOST_PORT' as default <host_port> ..."
    HOST_PORT=$DEFAUL_HOST_PORT
fi


echo "* Checking locally existence of '$IMAGE_NAME' docker image ..."
if [[ "$(sudo docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; 
then
    echo "Error: The '$IMAGE_NAME' image does'n exists!. 
    
    - Build your own image running:
        $ ./build_image.sh <docker_image_name>
    - Or download the latest EDIA image from docker hub: 
        $ sudo docker pull $LATEST_EDIA_DOCKER_IMAGE
    "
    exit 1
fi

echo "* Stopping and removing any other container named '$CONTAINER_NAME' ..."
sudo docker stop $CONTAINER_NAME > /dev/null 2>&1
sudo docker rm $CONTAINER_NAME > /dev/null 2>&1

echo "* Checking existence of necessary directories ..."
if [ ! -d "$WORKDIR/$HOST_LOGS_DIR" ] | [ ! -d "$WORKDIR/$HOST_CONFIG_DIR" ] | [ ! -d "$WORKDIR/$HOST_DATA_DIR" ];
then
	echo "Error: The necessary directories does'n exists. First execute ./setup.sh"
    exit 1
fi

echo "* Creating container '$CONTAINER_NAME' ..."
sudo docker create \
  --name $CONTAINER_NAME \
  -p $HOST_PORT:8080  \
  -v $WORKDIR/$HOST_CONFIG_DIR:/edia/config  \
  -v $WORKDIR/$HOST_LOGS_DIR:/edia/logs \
  -v $WORKDIR/$HOST_DATA_DIR:/edia/data_custom \
  $IMAGE_NAME > /dev/null 2>&1


echo "* Initializing container ..."
sudo docker start $CONTAINER_NAME > /dev/null 2>&1

echo "The container has been created successfully. The tool will be available in a few minutes at http://localhost:$HOST_PORT"
