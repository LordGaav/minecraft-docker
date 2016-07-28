#!/bin/bash
source tools/check-docker.sh
$DOCKER run -dit -P -e "FTB_PACK=Direwolf20_1_5_2" -e "FTB_VERSION=1.1.3" minecraft:ftb
