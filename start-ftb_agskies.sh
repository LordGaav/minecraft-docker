#!/bin/bash
source tools/check-docker.sh
$DOCKER run  -dit -P -e "FTB_PACK=AgrarianSkiesHQ" -e "FTB_VERSION=3.1.2" lordgaav/minecraft-docker:ftb
