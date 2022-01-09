#!/bin/bash

STACK_NAME="swarm-test"

# UPDATE NODE TO ACTIVE
NODE_ID=$(docker node ls | grep -Po "^.*(?=\s+\*\s+)")
docker node update --availability active $NODE_ID

# RESTART SERVICE IF NODE IS MANAGER
IS_SWARM_LEADER=$(docker node inspect self | jq -r ".[0].ManagerStatus.Leader")

if [ $IS_SWARM_LEADER = 'true' ]; then
    cd ~/project
    docker stack rm "$STACK_NAME"
    docker stack deploy --compose-file ./docker-compose.yml "$STACK_NAME"
fi