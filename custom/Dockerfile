FROM ubuntu:16.04
MAINTAINER Nick Douma <n.douma@nekoconeko.nl>

EXPOSE 25565

# make sure the package repository is up to date
RUN apt-get update

RUN mkdir /minecraft

# install packages
RUN apt-get update && \
    apt-get install -qq -y coreutils default-jre-headless tree tar gzip unzip unrar-free xz-utils bzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# startup command
ADD startup.sh /startup.sh
ADD import /minecraft/import
CMD /startup.sh
