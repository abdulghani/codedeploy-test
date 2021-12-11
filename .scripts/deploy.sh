#!/bin/bash

echo "DEPLOYING"
# ASSUMING SSH KEY ALREADY INPUT

scp "$(pwd)/docker_image.tar" "$REMOTE_USER@$REMOTE_HOST:~/app/docker_image.tar"
scp "$(pwd)/docker-compose.yml" "$REMOTE_USER@$REMOTE_HOST:~/app/docker-compose.yml"
ssh "$REMOTE_USER@$REMOTE_HOST" "bash -s" < "$(pwd)/.scripts/deploy-remote-command.sh"