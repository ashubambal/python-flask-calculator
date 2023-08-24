#!/bin/bash
set -e

# Pull the Docker image from Docker Hub 
docker pull softconsist/calculator-application:latest

# Run the Docker image as a container y
docker run -d -p 5000:5000 softconsist/calculator-application:latest
