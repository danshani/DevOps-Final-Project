#!/bin/bash
set -e

IMAGE="dansn/final-python:latest"
NAME="flask-app"

# Safety: remove any container with the same name before starting
docker rm -f "$NAME" 2>/dev/null || true

# Pull the latest image that Part B pushed to Docker Hub
docker pull "$IMAGE"

# Run the container. Host port 80 -> container port 5000,
# so the app is reachable at http://<EC2-public-IP>/ (no port needed).
docker run -d --name "$NAME" --restart unless-stopped -p 80:5000 "$IMAGE"
