#!/bin/bash

STACK_NAME="swarm-test"

# UPDATE NODE TO ACTIVE
NODE_ID=$(docker node ls | grep -Po "^.*(?=\s+\*\s+)")
docker node update --availability active "$NODE_ID"

# RESTART SERVICE IF NODE IS MANAGER
IS_SWARM_LEADER=$(docker node inspect self | jq -r ".[0].ManagerStatus.Leader")

# RECURSIVE FUNCTION
IS_RESTARTED=false
create_stack() {
    sleep 3 && 
    docker stack deploy --compose-file ./docker-compose.yml "$STACK_NAME" && IS_RESTARTED=true || IS_RESTARTED=false

    if [ $IS_RESTARTED = false ]; then
        create_stack
    fi
}

# RECREATE STACK IF NODE IS MANAGER
if [ $IS_SWARM_LEADER = true ]; then
    cd ~/project
    docker stack rm "$STACK_NAME"
    create_stack
fi