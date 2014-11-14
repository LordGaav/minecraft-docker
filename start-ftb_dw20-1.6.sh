#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=Direwolf20_1_6_4" -e "FTB_VERSION=1.0.23" minecraft:ftb
