#!/bin/bash
source tools/check-docker.sh
$DOCKER run -d -P -e "FTB_PACK=Unhinged" -e "FTB_VERSION=1.1.0" minecraft:ftb
