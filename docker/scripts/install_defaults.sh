#!/bin/bash

apt-get update

# Install pre-requisite packages.
apt-get install -y \
    git \
    vim \
    curl \
    nano \
    net-tools
