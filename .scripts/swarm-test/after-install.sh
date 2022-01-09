#!/bin/bash

# AfterInstall LIFECYCLE

# UPDATE/LOAD IMAGE
cd ~/project

docker system prune --force

docker load -i ./docker_image.tar

