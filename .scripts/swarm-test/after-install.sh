#!/bin/bash

# AfterInstall LIFECYCLE
WORKDIR="~/project"

# UPDATE/LOAD IMAGE
cd $WORKDIR # GO TO WORKDIR

docker system prune --force

docker load -i ./docker_image.tar

