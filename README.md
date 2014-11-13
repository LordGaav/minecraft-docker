Minecraft Docker Images
-----------------------

Easy to use Minecraft Docker images.

Prerequisites
-------------

* Docker (at least version 1.0)
* nsenter (either install from package or use tools/install-nsenter.sh)

Usage
-----
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

To stop a container
* Run `docker ps` and lookup the ID or Name of the running Docker instance
* Run `./kill-java.sh <id-or-name>`
* Check if the Docker has stopped using `docker ps`

To view the logs of (running) container
* Run `docker ps` and lookup the ID or Name of the Docker instance
* Run `./minecraft-logs.sh <id-or-name>` or `docker logs -f <id-or-name>`

TODO
----
Make a Docker image for FTB / Modded Minecraft servers.
