#!/bin/bash

DOCKER=""
hash "docker.io" 2>/dev/null && DOCKER="docker.io"
hash "docker" 2>/dev/null && DOCKER="docker"
if [ -z "$DOCKER" ]; then
	echo "Docker was not found."
	exit 1
fi

if [ "$(id -u)" -ne "0" ]; then
	DOCKER="sudo $DOCKER"
fi
