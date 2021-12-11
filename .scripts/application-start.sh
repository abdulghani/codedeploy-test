#!/bin/bash

cd ~/app

sudo docker-compose -f ./docker-compose.yml up -d --force-recreate