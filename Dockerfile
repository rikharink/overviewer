FROM ubuntu:latest
ARG MINECRAFT_VERSION
LABEL minecraft.version=$MINECRAFT_REV
LABEL overviewer.version="latest"
RUN apt-get update && \
    apt-get install -y gnupg1 apt-transport-https ca-certificates curl
RUN echo 'deb https://overviewer.org/debian ./' >> /etc/apt/sources.list && \
    curl https://overviewer.org/debian/overviewer.gpg.asc > /tmp/overviewer.gpg.asc && apt-key add /tmp/overviewer.gpg.asc && \
    apt-get update && apt-get -y install minecraft-overviewer
RUN mkdir -p ~/.minecraft/versions/$MINECRAFT_VERSION && \
    curl --location https://overviewer.org/textures/$MINECRAFT_VERSION --output ~/.minecraft/versions/$MINECRAFT_VERSION/$MINECRAFT_VERSION.jar