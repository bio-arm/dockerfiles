#!/usr/bin/env bash

# install GDal (Geospatial Data Abstraction Library)
cd $HOME/Downloads
export GDAL_VERSION=3.7.0
wget https://github.com/OSGeo/gdal/releases/download/v${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz
tar zxvf gdal-${GDAL_VERSION}.tar.gz
cd gdal-${GDAL_VERSION}
mkdir build && cd build
cmake ..
make -j
sudo make install
