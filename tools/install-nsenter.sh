#!/bin/bash
source tools/check-docker.sh
$DOCKER run -v /usr/local/bin:/target jpetazzo/nsenter
