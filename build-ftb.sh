#!/bin/bash
source tools/check-docker.sh
(cd ftb && $DOCKER build -t minecraft:ftb .)
