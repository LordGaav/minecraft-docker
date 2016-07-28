#!/bin/bash
source tools/check-docker.sh
$DOCKER run -dit -P -e "FTB_PACK=direwolf20_17" -e "FTB_VERSION=1.0.2" lordgaav/minecraft-docker:ftb
