#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=Monster" -e "FTB_VERSION=1.1.1" minecraft:ftb
