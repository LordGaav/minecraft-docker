#!/bin/bash
source tools/check-docker.sh

if [ $# -ne 1 ]; then
	echo "Provide the name or ID of the Docker as the first argument"
	exit 1
fi

$DOCKER logs -f $1

