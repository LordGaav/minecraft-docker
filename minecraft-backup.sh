#!/bin/bash
source tools/check-docker.sh

if [ $# -ne 2 ]; then
	echo "Provide the name or ID of the Docker as the first argument and the target directory as the second argument"
	exit 1
fi

if [ ! -d "$2" -o ! -w "$2" ]; then
	echo "The target directory does not exist or is not writable"
	exit 1
fi

TMPDIR=$(mktemp -d)
if [ -z "$TMPDIR" ]; then
	echo "Failed to create tempdir"
	exit 1
fi

TIMESTAMP=$(date "+%Y-%m-%dT%H-%M-%S%z")
BACKUPNAME="minecraft_$1_$TIMESTAMP.tar.xz"

echo -n "Entering tmpdir: "
pushd $TMPDIR
$DOCKER export "$1" | tar xf - minecraft || exit 1
tar Jcvf "$BACKUPNAME" minecraft
popd
echo "Moving backup to destination"
mv "$TMPDIR/$BACKUPNAME" "$2"
rm -fR "$TMPDIR"
echo "Backup done"
