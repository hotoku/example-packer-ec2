#!/bin/bash -ex

echo "Starting Packer build process..."

apt-get update
apt-get install -y zsh jq unzip sqlite3 cmake \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev \
    llvm direnv fzf

curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
sudo apt-get install -y nodejs
npm install -g yo generator-napi-module
