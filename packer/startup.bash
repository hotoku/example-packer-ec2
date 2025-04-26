#!/bin/bash -ex

echo "Starting Packer build process..."

apt install -y zsh direnv fzf jq unzip sqlite3 cmake \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl \
    llvm libncursesw5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev
    