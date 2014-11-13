#!/bin/bash
source check-docker.sh
$DOCKER run -d -P -e "MINECRAFT_VERSION=1.8" minecraft:vanilla
