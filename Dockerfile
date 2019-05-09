FROM kanocomputing/mercury-builder

# APT Dependencies to build and test Mercury
ENV APT_DEPENDENCIES="build-essential cmake lcov python-pip"

# PIP Dependencies to build Mercury
ENV PIP_DEPENDENCIES="conan"

# Install build dependencies
RUN apt-get update && \
    apt-get install -y $APT_DEPENDENCIES

RUN pip install $PIP_DEPENDENCIES
