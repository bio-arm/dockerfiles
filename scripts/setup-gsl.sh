#!/usr/bin/env bash

# install GSL (GNU Scientific Library)
cd $HOME/Downloads
export GSL_VERSION=2.7.1
wget https://ftp.gnu.org/gnu/gsl/gsl-${GSL_VERSION}.tar.gz
tar zxvf gsl-${GSL_VERSION}.tar.gz
cd gsl-${GSL_VERSION}
./configure
make -j
sudo make install
