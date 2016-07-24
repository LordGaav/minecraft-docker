FROM ubuntu:16.04
MAINTAINER Nick Douma <n.douma@nekoconeko.nl>

EXPOSE 25565

RUN mkdir /minecraft

# install packages
RUN apt-get update && \
    apt-get install -qq -y coreutils tmux vim-tiny dnsutils default-jre-headless curl tree psmisc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# startup command
ADD startup.sh /startup.sh
ADD import /minecraft/import
CMD /startup.sh
