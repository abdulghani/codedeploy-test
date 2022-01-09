#!/bin/bash

# CLEANUP
[ -d ~/project ] && sudo rm -rf ~/project || echo "FOLDER NOT EXIST"

docker system prune --force