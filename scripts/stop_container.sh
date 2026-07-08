#!/bin/bash
# Stop and remove the old container if it exists.
# "|| true" so the very first deployment (no container yet) does not fail.
docker rm -f flask-app 2>/dev/null || true
