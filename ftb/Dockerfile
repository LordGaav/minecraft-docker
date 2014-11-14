FROM ubuntu:latest
MAINTAINER Nick Douma <n.douma@nekoconeko.nl>

EXPOSE 25565

# make sure the package repository is up to date
RUN apt-get update

# install packages
RUN apt-get install -qq -y coreutils tmux vim dnsutils default-jre-headless curl tree psmisc libxml2-utils unzip

RUN mkdir /minecraft
RUN curl -o /tmp/modpacks.xml http://ftb.cursecdn.com/FTB2/static/modpacks.xml
RUN curl -o /tmp/thirdparty.xml http://ftb.cursecdn.com/FTB2/static/thirdparty.xml

# startup command
ADD startup.sh /startup.sh
ADD parse-xml.sh /parse-xml.sh
ADD import /minecraft/import
CMD /startup.sh
