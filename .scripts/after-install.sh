#!/bin/bash

DOCKER_IMAGE=$(aws secretsmanager get-secret-value --secret-id fe-stage-deploy-image | jq -r '.SecretString')
DWN_DOCKER_IMAGE="downloaded_docker_image.tar"

echo "DOWNLOADING DOCKER IMAGE ($DOCKER_IMAGE)..."
aws s3 cp $DOCKER_IMAGE ~/app/$DWN_DOCKER_IMAGE

echo "LOADING DOCKER IMAGE..."
docker load -i ~/app/$DWN_DOCKER_IMAGE
