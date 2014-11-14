#!/bin/bash
set -x

cd /minecraft || ( echo "No Minecraft folder?" && exit 1 )

source /parse-xml.sh

tree

if [ ! -e .init_done ]; then
	# Download the appropriate FTB pack
	PACK="direwolf20_17"
	VERSION="1.0.1"

	if [ ! -z "$FTB_PACK" ]; then
		PACK=$FTB_PACK
	else
		echo "No pack specified, defaulting to $PACK"
	fi
	if [ ! -z "$FTB_VERSION" ]; then
		VERSION=$FTB_VERSION
	else
		echo "No version specified, defaulting to $VERSION"
	fi

	DATA=""
	PACKINDEX="/tmp/modpacks.xml /tmp/thirdparty.xml"
	for xml in $PACKINDEX; do
		DATA=$(paste -d":" \
			<(getxml $xml '/modpacks/modpack[@serverPack!=""]/@dir') \
			<(getxml $xml '/modpacks/modpack[@serverPack!=""]/@version') \
			<(getxml $xml '/modpacks/modpack[@serverPack!=""]/@serverPack') \
			<(getxml $xml '/modpacks/modpack[@serverPack!=""]/@repoVersion') \
			| egrep --color=never "^$FTB_PACK:$FTB_VERSION" | head -n1 \
		)

		if [ ! -z "$DATA" ]; then
			echo "Found pack in $xml"
			break
		fi
	done

	if [ -z "$DATA" ]; then
		echo "Pack not found!"
		exit 1
	fi

	PACK=$(echo -n "$DATA" | cut -d":" -f3)
	VERSION=$(echo -n "$DATA" | cut -d":" -f4 | sed 's/\./_/g')
	DIR=$(echo -n "$DATA" | cut -d":" -f1)
	URL="http://ftb.cursecdn.com/FTB2/modpacks/$DIR/$VERSION/$PACK"

	curl -o /minecraft/pack.zip "$URL" || exit 1
	unzip pack.zip || exit 1
	rm pack.zip || exit 1
	chmod +x *.sh

	# Acknowledge EULA
	echo "eula=true" > eula.txt

	# Checking for old style files to import
	OLD_FILES="ops.txt white-list.txt"
	for file in $OLD_FILES; do
		if [ -e "import/$file" -a ! -e "$file" ]; then
			mv "import/$file" $file
		else
			touch $file
		fi
	done

	# Checking for new style files to import
	NEW_FILES="banned-players.json banned-ips.json ops.json whitelist.json server.properties"
	for file in $NEW_FILES; do
		if [ -e "import/$file" -a ! -e "$file" ]; then
			mv "import/$file" $file
		else
			touch $file
		fi
	done

	# Checking for configs to import
	if [ -e "import/config" -a -d "import/config" ]; then
		mv -f "import/config/*" config
	fi

	# Checking for mods to import
	if [ -e "import/mods" -a -d "import/mods" ]; then
		mv -f "import/mods/*" mods
	fi

	# Checking for world to import
	if [ -e "import/world" -a -d "import/world" ]; then
		rm -vfR world/*
		mv "import/world" world
	fi

fi

# We only want to do the steps above on first run, set a marker to avoid doing it in the future
touch .init_done

# Start Minecraft
./ServerStart.sh
