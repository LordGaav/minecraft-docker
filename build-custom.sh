#!/bin/bash
source tools/check-docker.sh
(cd custom && $DOCKER build -t lordgaav/minecraft-docker:custom -f Dockerfile .)
