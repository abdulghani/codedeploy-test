#!/bin/bash

echo ""
echo "DEPLOYING"

eval "$(ssh-agent)"
ssh-add ~/.ssh/stage_key

scp "$(pwd)/docker-compose.yml" "$REMOTE_USER@$REMOTE_HOST:~/app/docker-compose.yml"
scp "$(pwd)/docker_image.tar" "$REMOTE_USER@$REMOTE_HOST:~/app/docker_image.tar"
ssh "$REMOTE_USER@$REMOTE_HOST" "bash -s" < "$(pwd)/.scripts/deploy-remote-command.sh"