#!/bin/bash
source check-docker.sh
(cd vanilla && $DOCKER build -t minecraft:vanilla .)
