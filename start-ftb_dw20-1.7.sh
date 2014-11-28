#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=direwolf20_17" -e "FTB_VERSION=1.0.2" minecraft:ftb
