#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=Horizons" -e "FTB_VERSION=2.1.1" minecraft:ftb
