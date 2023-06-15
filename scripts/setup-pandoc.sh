#!/usr/bin/env bash

ARCH=$(uname -m)
if [ $ARCH == "x86_64" ]; then
    PANDOC_ARCH="amd64"
elif [ $ARCH == "aarch64" ]; then
    PANDOC_ARCH="arm64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# install Pandoc
cd $HOME/Downloads
export PANDOC_VERSION=3.1.2
wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-$PANDOC_ARCH.tar.gz
tar zxvf pandoc-${PANDOC_VERSION}-linux-$PANDOC_ARCH.tar.gz
ln -s pandoc-${PANDOC_VERSION}/bin/pandoc $HOME/bin/pandoc
