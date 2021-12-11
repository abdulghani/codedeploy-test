#!/bin/bash

echo ""
cd ~/app

sudo docker --version
sudo docker load -i ./docker_image.tar
sudo docker-compose -f ./docker-compose.yml up -d --force-recreate