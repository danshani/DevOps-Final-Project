#!/bin/bash
set -e

# Ensure Docker is installed (it should already be, from EC2 setup)
if ! command -v docker >/dev/null 2>&1; then
  dnf install -y docker
fi

# Ensure Docker is enabled and running
systemctl enable --now docker
