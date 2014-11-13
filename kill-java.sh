#!/bin/bash
source tools/check-docker.sh
source tools/check-nsenter.sh

if [ $# -ne 1 ]; then
	echo "Provide the name or ID of the Docker as the first argument"
	exit 1
fi

PID=$($DOCKER inspect --format {{.State.Pid}} $1)
if [ $PID -eq 0 ]; then
	echo "No PID found, is the Docker running?"
	exit 1
fi

echo "Entering namespace of Docker with PID $PID and sending TERM to Java"
$NSENTER --target $PID --mount --uts --ipc --net --pid killall java

