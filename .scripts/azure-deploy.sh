#!/bin/bash

### SETUP
ROOT_PROJECT="$(pwd)"
echo "RUNNING AZURE RELEASE"
echo "WORKDIR ($ROOT_PROJECT)"

echo "ECHO ENV VARIABLE ($TEMP_VARIABLE) ($GITHUB_SHA)"

### RUNNING SCRIPTS
echo "BUILD DOCKER IMAGE"
sudo docker build . -f ./dockerfile -t abdulghani/codedeploy-test

echo "STARTING DOCKER"
sudo docker-compose -f ./docker-compose.yml up -d --force-recreate

echo "CLEANING UP DOCKER"
sudo docker system prune --force

echo "CLEANING UP SOURCE FILES"
cd "$ROOT_PROJECT"; cd ..; rm -rf ./*
ls -a