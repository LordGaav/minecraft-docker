FROM ubuntu:latest
MAINTAINER Nick Douma <n.douma@nekoconeko.nl>

EXPOSE 25565

# make sure the package repository is up to date
RUN apt-get update

# install packages
RUN apt-get install -qq -y coreutils tmux vim dnsutils default-jre-headless curl tree psmisc

RUN mkdir /minecraft

# install extra tools
RUN apt-get install -qq -y gzip unzip unrar-free xz-utils bzip2

# startup command
ADD startup.sh /startup.sh
ADD import /minecraft/import
CMD /startup.sh
