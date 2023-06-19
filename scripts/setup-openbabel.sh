#!/usr/bin/env bash

# install OpenBabel
cd $HOME/Downloads
export OPEN_BABEL_VERSION=3.1.1
export OPEN_BABEL_VERSION_DASHED=$(echo $OPEN_BABEL_VERSION | sed 's/\./-/g')
wget https://github.com/openbabel/openbabel/releases/download/openbabel-${OPEN_BABEL_VERSION_DASHED}/openbabel-${OPEN_BABEL_VERSION}-source.tar.bz2
tar jxvf openbabel-${OPEN_BABEL_VERSION}-source.tar.bz2
cd openbabel-${OPEN_BABEL_VERSION}
mkdir build && cd build
cmake ..
make -j1
cmake --install . --prefix ${HOME}/openbabel-${OPEN_BABEL_VERSION}
