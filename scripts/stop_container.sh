#!/bin/bash
echo "hello"
containerid=$(docker ps -q) 
docker rm -f $containerid
