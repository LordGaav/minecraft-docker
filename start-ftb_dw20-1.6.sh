#!/bin/bash
source tools/check-docker.sh
$DOCKER run -dit -P -e "FTB_PACK=Direwolf20_1_6_4" -e "FTB_VERSION=1.0.23" lordgaav/minecraft-docker:ftb
