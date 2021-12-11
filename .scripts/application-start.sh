#!/bin/bash

# set permission to write
sudo chown -R ubuntu:ubuntu ~/app
cd ~/app

echo "STARTING UP DOCKER COMPOSE"
sudo docker-compose -f ./docker-compose.yml up -d --force-recreate