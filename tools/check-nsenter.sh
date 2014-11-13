#!/bin/bash

NSENTER=""
hash "nsenter" 2>/dev/null && NSENTER="nsenter" 
if [ -z "$NSENTER" ]; then
	echo "nsenter is missing, install it or use ./tools/install-nsenter.sh"
	exit 1
fi

if [ "$(id -u)" -ne "0" ]; then
	NSENTER="sudo $NSENTER"
fi
