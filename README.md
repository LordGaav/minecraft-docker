Minecraft Docker Images
-----------------------

Easy to use Minecraft Docker images.

Prerequisites
-------------

* Docker (at least version 1.0)
* nsenter (either install from package or use tools/install-nsenter.sh)

Usage (vanilla)
---------------
To build a clean image
* Checkout code
* Run `./build-vanilla.sh`

To build an image from existing world files and properties
* Checkout code
* Place the files that you want to import in `vanilla/import`
 * The world files MUST be in a subfolder named *world*.
* Run `./build-vanilla.sh`

To start an image as a container
* Run `./start-vanilla_1.7.sh` or `./start-vanilla_1.8.sh`

Usage (FTB)
-----------
To build a clean image
* Checkout code
* Run `./build-ftb.sh`

To build an image from existing world files and properties
* Checkout code
* Place the files that you want to import in `ftb/import`
 * The world files MUST be in a subfolder named *world*.
 * Configs may be placed in a subfolder named *config*.
 * Mods may be placed in a subfolder named *mods*.
* Run `./build-ftb.sh`

To start an image as a container
* Run any of the `./start-ftb_XXX.sh` files.

Usage (custom pack / ATLauncher)
--------------------------------
To build a clean image
* Checkout code
* Run `./build-custom.sh`

To build an image from existing world files and properties
* Checkout code
* Place the files that you want to import in `custom/import`
 * The world files MUST be in a subfolder named *world*.
 * Configs may be placed in a subfolder named *config*.
 * Mods may be placed in a subfolder named *mods*.
* Run `./build-custom.sh`

To start an image as a container
* The Docker expects the pack to be available in /minecraft, so you'll have to mount a volume containing the pack to use.
* By default, the Docker will check for a file named `pack.zip`, which it will unzip and then start `LaunchServer.sh`.
 * You can override this by passing a `CUSTOM_PACK` and/or `CUSTOM_STARTUP` variable to the Docker.
* Example command line: `docker run -d -P -e "CUSTOM_PACK=pack.tar.xz" -e "CUSTOM_STARTUP=start.sh" -v "/path/on/host:/minecraft" minecraft:custom`.

Usage (all)
-----------
To stop a container
* Run `docker ps` and lookup the ID or Name of the running Docker instance
* Run `./kill-java.sh <id-or-name>`
* Check if the Docker has stopped using `docker ps`

To view the logs of (running) container
* Run `docker ps` and lookup the ID or Name of the Docker instance
* Run `./minecraft-logs.sh <id-or-name>` or `docker logs -f <id-or-name>`

To backup a Minecraft container
* Run `docker ps` and lookup the ID or Name of the Docker instance
* Run `./minecraft-backup.sh <id-or-name> <destination-dir>`

To enter a Minecraft container
* Run `docker ps` and lookup the ID or Name of the Docker instance
* Run `./enter-container.sh <id-or-name> <destination-dir>`
