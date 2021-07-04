#!/bin/bash

apt-get update

# Install pre-requisite packages.
apt-get install -y \
    dialog \
    apt-utils \
    git \
    curl \
    nano \
    net-tools
