#!/bin/bash

# set permission to write
sudo chown -R ubuntu:ubuntu ~/app
[ -d ~/app ] && rm -rf ~/app
sudo docker system prune --force