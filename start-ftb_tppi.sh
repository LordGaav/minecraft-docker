#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=TPPI" -e "FTB_VERSION=1.1.2" minecraft:ftb