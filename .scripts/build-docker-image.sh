#!/bin/bash

# NEED TO BE SUPPLIED WITH
# env:
#   DEPLOYMENT_BUCKET
#   DEPLOYMENT_SECRET_ID

IMAGE_NAME="abdulghani/codedeploy-test"
IMAGE_FILE="docker_image.tar"

echo "BUILDING DOCKER IMAGE..."
docker build . -f ./dockerfile -t $IMAGE_NAME

echo "ARCHIVING DOCKER IMAGE..."
docker save -o ./$IMAGE_FILE $IMAGE_NAME

echo "DONE"