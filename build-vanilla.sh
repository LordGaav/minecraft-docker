#!/bin/bash
source tools/check-docker.sh
(cd vanilla && $DOCKER build -t lordgaav/minecraft-docker:vanilla .)
