#!/bin/bash
source check-docker.sh
$DOCKER run -d -P -e "MINECRAFT_VERSION=1.7" minecraft:vanilla
