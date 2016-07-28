#!/bin/bash
source tools/check-docker.sh
$DOCKER run -dit -P -e "FTB_PACK=Monster" -e "FTB_VERSION=1.1.1" lordgaav/minecraft-docker:ftb
