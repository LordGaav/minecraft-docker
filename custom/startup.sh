#!/bin/sh
set -x

if [ ! -d "/minecraft" ]; then
	echo "No Minecraft folder?"
	exit 1
fi

cd /minecraft

tree -L 2

# Set startup script
STARTUP="LaunchServer.sh"
if [ ! -z "$CUSTOM_STARTUP" ]; then
	STARTUP=$CUSTOM_STARTUP
else
	echo "No startup specified, defaulting to $STARTUP"
fi

if [ ! -e .init_done ]; then
	# Set pack file
	PACK="pack.zip"
	if [ ! -z "$CUSTOM_PACK" ]; then
		PACK=$CUSTOM_PACK
	else
		echo "No pack specified, defaulting to $PACK"
	fi
	if [ ! -f "$PACK" ]; then
		echo "Pack file does not exist"
		exit 1
	fi

	case "$PACK" in
		*.gz | *.tgz | *.bz | *.tbz | *.xz | *.txz | *.tar )
			tar xvf $PACK || exit 1
			;;
		*.zip | *.ZIP )
			unzip $PACK || exit 1
			;;
		*.rar | *.RAR )
			unrar x $PACK || exit 1
			;;
		* )
			echo "Unknown archive format for $PACK" && exit 1
			;;
	esac
	rm $PACK || exit 1

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
		mv -f import/config/* config
	fi

	# Checking for mods to import
	if [ -e "import/mods" -a -d "import/mods" ]; then
		mv -f import/mods/* mods
	fi

	# Checking for world to import
	if [ -e "import/world" -a -d "import/world" ]; then
		rm -vfR world/*
		mv import/world world
	fi

	# Checking for custom scripts
	if stat -t import/*.sh >/dev/null 2>&1; then
		mv "import/*.sh" .
	fi
	chmod +x *.sh
fi

# We only want to do the steps above on first run, set a marker to avoid doing it in the future
touch .init_done

# Start Minecraft
./$STARTUP
