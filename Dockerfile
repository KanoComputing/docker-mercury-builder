#
#  Dockerfile to build a Debian Buster box to build / test Kano Mercury software
#

FROM debian:buster

# APT Dependencies to build and test Mercury
ENV APT_DEPENDENCIES="git-core build-essential cmake lcov python-pip"

# PIP Dependencies to build Mercury
ENV PIP_DEPENDENCIES="conan"

# Install build dependencies
RUN apt-get update && \
    apt-get install -y $APT_DEPENDENCIES

RUN pip install $PIP_DEPENDENCIES

RUN useradd -ms /bin/bash mercury
ENV HOME /home/mercury
USER mercury
WORKDIR $HOME
RUN git clone https://github.com/KanoComputing/mercury.git
