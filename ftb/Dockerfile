FROM ubuntu:16.04
MAINTAINER Nick Douma <n.douma@nekoconeko.nl>

EXPOSE 25565

RUN mkdir /minecraft

# install packages
RUN apt-get update && \
    apt-get install -qq -y coreutils tmux vim-tiny dnsutils default-jre-headless curl tree psmisc libxml2-utils unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o /tmp/modpacks.xml http://ftb.cursecdn.com/FTB2/static/modpacks.xml
RUN curl -o /tmp/thirdparty.xml http://ftb.cursecdn.com/FTB2/static/thirdparty.xml

# startup command
ADD startup.sh /startup.sh
ADD parse-xml.sh /parse-xml.sh
ADD import /minecraft/import
CMD /startup.sh
