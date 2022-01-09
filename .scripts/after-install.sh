#!/bin/bash

DOCKER_IMAGE=$(aws secretsmanager get-secret-value --secret-id fe-deployed-image | jq -r '.SecretString')
DWN_DOCKER_IMAGE="downloaded_docker_image.tar"

echo "DOWNLOADING DOCKER IMAGE ($DOCKER_IMAGE)..."
aws s3 cp $DOCKER_IMAGE ~/$DWN_DOCKER_IMAGE

echo "LOADING DOCKER IMAGE..."
docker load -i ~/$DWN_DOCKER_IMAGE

echo "CLEANUP DOWNLOADED DOCKER IMAGE..."
rm -rf ~/$DWN_DOCKER_IMAGE

# # PRINT DOCKER JOIN TOKEN
# echo "$(docker swarm join-token manager | grep -i -Po '(?!\s+)docker swarm join --token .*(?!\s+$)')"

# # CHECK IF NODE IS MANAGER
# if [ $(docker node inspect self | jq -r ".[0].ManagerStatus.Leader") = 'true' ]; then
#     echo "it's true"
# else
#     echo "it's false"
# fi

# # GET NODE ID (SWARM)
# docker node ls | grep -Po "^.*(?=\s+\*\s+)"

# setup
# - docker swarm init
# - docker swarm register

# codedeploy worker
# - register to network (beforeInstall)
# - drain tasks (applicationStop)
# - update/load image (afterInstall)
# - set node to active (applicationStart)

# codedeploy manager
# - restart service w/docker-compose file (applicationStart)