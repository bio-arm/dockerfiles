#!/usr/bin/env bash

# install UDUNITS (Unidata Units)
cd $HOME/Downloads
git clone https://github.com/Unidata/UDUNITS-2.git
cd UDUNITS-2
mkdir build && cd build
sudo dnf install -y expat-devel flex bison
cmake ..
make -j
cmake --install . --prefix $HOME/libudunits-2/
