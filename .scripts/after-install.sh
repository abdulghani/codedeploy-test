#!/bin/bash

# set permission to write
sudo chown -R ubuntu:ubuntu ~/app
cd ~/app

sudo docker build . -f ./dockerfile -t abdulghani/codedeploy-test