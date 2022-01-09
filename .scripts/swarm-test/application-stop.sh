#!/bin/bash

# ApplicationStop LIFECYCLE

# DOCKER SWARM REGISTER
# CHECK IF NODE IS A MANAGER
IS_SWARM_LEADER=$(docker node inspect self | jq -r ".[0].ManagerStatus.Leader")
SECRETS_ID="swarm-test-join-manager"

# DRAIN TASKS FROM NODE
NODE_ID=$(docker node ls | grep -Po "^.*(?=\s+\*\s+)")
docker node update --availability drain "$NODE_ID" || echo "NODE IS NOT CONNECTED"

# JOIN OR UPDATE JOIN KEY
if [ $IS_SWARM_LEADER = true ]; then
    # update secrets manager join command
    JOIN_COMMAND=$(docker swarm join-token worker | grep -i -Po '(?!\s+)docker swarm join --token .*(?!\s+$)')
    aws secretsmanager update-secret --secret-id "$SECRETS_ID" --secret-string "$JOIN_COMMAND"
else
    # join swarm cluster
    JOIN_COMMAND=$(aws secretsmanager get-secret-value --secret-id "$SECRETS_ID" | jq -r '.SecretString')
    eval "$JOIN_COMMAND"

    echo "JOIN COMMAND ($JOIN_COMMAND)"

    exit 1
fi
