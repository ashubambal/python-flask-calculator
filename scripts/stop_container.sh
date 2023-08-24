#!/bin/bash

# Get IDs of all running containers  
container_ids=$(docker ps -q)

# Loop through each container ID and remove it
for container_id in $container_ids; do
    docker rm -f $container_id
done
