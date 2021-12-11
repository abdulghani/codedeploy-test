#!/bin/bash

# set permission to write
sudo chown -R ubuntu:ubuntu ~/app
cd ~/app

echo "BUILDING DOCKER IMAGE"
sudo docker build . -f ./dockerfile -t abdulghani/codedeploy-test