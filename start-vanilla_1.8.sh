#!/bin/bash
source tools/check-docker.sh
$DOCKER run -dit -P -e "MINECRAFT_VERSION=1.8" lordgaav/minecraft-docker:vanilla
