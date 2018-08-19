FROM ubuntu:16.04

# Needed to be able to install resolvconf without complaints about /etc/resolv.conf not being accessible
# See: https://github.com/moby/moby/issues/1297#issuecomment-115458690
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get update \
    && apt-get install -y \
       chromium-browser \
       dmidecode \
       kmod \
       libcanberra-gtk3-module \
       libgtk2.0-0 \
       lsb-core \
       lsof \
       minicom \
       resolvconf \
       software-properties-common \
       build-essential \
       cmake \
       git \
       sudo \
       tzdata \
       udev \
       unzip \
       usbutils \
       vim \
       x11-utils \
       xterm \
       wget \
    && apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/*

# Set up time and locale
# /etc/localtime is replaced by an actual file instead of symbolic link,
# otherwise DriveInstall can end up trying to copy the same file to itself
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    rm /etc/localtime && \
    cp /usr/share/zoneinfo/Etc/UTC /etc/localtime
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# You can set these when building the image, with the `--build-args` flag
ARG HOST_UID=1000
ARG HOST_GID=1000

ENV HOST_UID ${HOST_UID}
ENV HOST_GID ${HOST_GID}

RUN useradd --create-home --uid ${HOST_UID} --groups sudo --shell /bin/bash developer \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer


ENV HOME /home/developer

USER developer
WORKDIR /home/developer

CMD bash