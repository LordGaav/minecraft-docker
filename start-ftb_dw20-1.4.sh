#!/bin/bash
source tools/check-docker.sh
$DOCKER run -dit -P -e "FTB_PACK=Direwolf20" -e "FTB_VERSION=5.3.2" lordgaav/minecraft-docker:ftb
