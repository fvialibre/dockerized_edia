#!/bin/bash
# HOW TO USE
#   ./build_image.sh <docker_image_name>

IMAGE_NAME=$1
APP_PATH=$(pwd)/app

if [[ $IMAGE_NAME == "" ]];
then
    echo "Error: You must insert an <docker_image_name> to generate the docker image, as the first command line parameter!

    USE:
    $ ./build_image.sh <docker_image_name>
    "

    exit 1
fi

echo "* Checking existence of '$IMAGE_NAME' docker image ..."
if [[ "$(sudo docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; 
then
    sudo docker build -t $IMAGE_NAME -f $APP_PATH/Dockerfile $APP_PATH
    echo "Image '$IMAGE_NAME' successfully created!"
else
    echo "The image '$IMAGE_NAME' already exists!"
fi