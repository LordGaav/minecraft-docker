FROM alpine:3.4
MAINTAINER Nick Douma <n.douma@nekoconeko.nl>

EXPOSE 25565

RUN mkdir /minecraft

# install packages
RUN apk add --no-cache openjdk8-jre tree curl libxml2-utils unzip bash coreutils

# Remove wget symlink to BusyBox so the FTB install script uses curl
RUN rm /usr/bin/wget

RUN curl -o /tmp/modpacks.xml http://ftb.cursecdn.com/FTB2/static/modpacks.xml
RUN curl -o /tmp/thirdparty.xml http://ftb.cursecdn.com/FTB2/static/thirdparty.xml

# startup command
ADD startup.sh /startup.sh
ADD parse-xml.sh /parse-xml.sh
ADD import /minecraft/import
CMD ["/bin/bash", "/startup.sh"]
