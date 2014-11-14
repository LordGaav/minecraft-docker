#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=CrashLanding" -e "FTB_VERSION=1.1.2.1" minecraft:ftb
