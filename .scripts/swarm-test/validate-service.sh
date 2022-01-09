#!/bin/bash

STACK_NAME="swarm-test"
IS_SWARM_LEADER=$(docker node inspect self | jq -r ".[0].ManagerStatus.Leader")

# CHECK IF STACK IS EXIST
if [ $IS_SWARM_LEADER = true ]; then
    IS_EXIST=$(docker stack ls | grep -i -Po "^$STACK_NAME(?=\s+)")

    if [ $IS_EXIST = $STACK_NAME ]; then
        exit 0;
    else
        exit 1;
    fi
fi