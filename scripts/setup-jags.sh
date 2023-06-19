#!/usr/bin/env bash

# install JAGS (Just Another Gibbs Sampler)
cd $HOME/Downloads
export JAGS_VERSION=4.3.2
cp /tmp/JAGS-${JAGS_VERSION}.tar.gz .
tar zxvf JAGS-${JAGS_VERSION}.tar.gz
cd  JAGS-${JAGS_VERSION}
./configure
make -j1
sudo make install
