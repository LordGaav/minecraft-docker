#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=Unleashed" -e "FTB_VERSION=1.1.7" minecraft:ftb
