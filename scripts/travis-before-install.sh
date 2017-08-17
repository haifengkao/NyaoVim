#!/bin/bash

set -e

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    sudo apt-get -qq update
    sudo apt-get install -y software-properties-common python-software-properties
    sudo apt-get install -y neovim
    export DISPLAY=:99.0
    sh -e /etc/init.d/xvfb start
    sleep 3
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    brew update
    brew install neovim
else
    echo "Unknown platform: ${TRAVIS_OS_NAME}"
    exit 1
fi
