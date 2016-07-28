#!/bin/sh
set -x

cd /minecraft || ( echo "No Minecraft folder?" && exit 1 )

tree

if [ ! -e .init_done ]; then
	# Check if we have a minecraft_server.jar, otherwise download it
	if [ ! -e minecraft_server.jar ]; then
		VERSION=1.8
		if [ ! -z "$MINECRAFT_VERSION" ]; then
			VERSION=$MINECRAFT_VERSION
		else
			echo "No version specified, defaulting to $VERSION"
		fi
		curl -o /minecraft/minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/$VERSION/minecraft_server.$VERSION.jar || exit 1
	fi

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

	# Checking for world to import
	if [ -e "import/world" -a -d "import/world" ]; then
		rm -vfR world/*
		mv "import/world" world
	fi
fi

# We only want to do the steps above on first run, set a marker to avoid doing it in the future
touch .init_done

# Start Minecraft
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
