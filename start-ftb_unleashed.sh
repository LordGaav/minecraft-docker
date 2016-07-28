#!/bin/bash
source tools/check-docker.sh
$DOCKER run -dit -P -e "FTB_PACK=Unleashed" -e "FTB_VERSION=1.1.7" lordgaav/minecraft-docker:ftb
