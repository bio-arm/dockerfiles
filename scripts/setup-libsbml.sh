#!/usr/bin/env bash

# install libSBML 
cd ${HOME}/Downloads
git clone https://github.com/sbmlteam/libsbml.git
cd libsbml
#export LIBSBML_VERSION=5.20.0
#wget https://github.com/sbmlteam/libsbml/archive/refs/tags/v${LIBSBML_VERSION}.tar.gz
#tar zxvf v${LIBSBML_VERSION}.tar.gz
#cd libsbml-${LIBSBML_VERSION}
./configure --prefix=$HOME/libsbml
make -j1
make install
