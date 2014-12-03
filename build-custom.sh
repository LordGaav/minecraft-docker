#!/bin/bash
source tools/check-docker.sh
(cd custom && $DOCKER build -t minecraft:custom .)
