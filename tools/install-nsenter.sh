#!/bin/bash
source check-docker.sh
$DOCKER run -v /usr/local/bin:/target jpetazzo/nsenter
