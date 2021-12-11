#!/bin/bash

echo "DEPLOYING, CONNECTING TO ($REMOTE_USER) AT ($REMOTE_HOST)"
# ASSUMING SSH KEY ALREADY INPUT

# scp "$(pwd)/docker-compose.yml" "$REMOTE_USER@$REMOTE_HOST:~/app/docker-compose.yml"

# echo "UPLOADING DOCKER IMAGE..."
# scp "$(pwd)/docker_image.tar" "$REMOTE_USER@$REMOTE_HOST:~/app/docker_image.tar"
ssh "$REMOTE_USER@$REMOTE_HOST" "bash -s" < "$(pwd)/.scripts/deploy-remote-command.sh"