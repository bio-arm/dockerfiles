#!/usr/bin/env bash

sudo mkdir -p /etc/profile.d/
cat <<EOT | sudo tee /etc/profile.d/bioc.sh
export RETICULATE_PYTHON="/usr/bin/python3"
export LIBSBML_CFLAGS=$(pkg-config --cflags /home/biocbuild/libsbml/lib/pkgconfig/libsbml.pc)
export LIBSBML_LIBS=$(pkg-config --libs /home/biocbuild/libsbml/lib/pkgconfig/libsbml.pc)
export UDUNITS2_INCLUDE="/home/biocbuild/libudunits-2/include"
export UDUNITS2_LIBS="/home/biocbuild/libudunits-2/lib"
export OPEN_BABEL_HOME="/home/biocbuild/openbabel-${OPEN_BABEL_VERSION}"
export OPEN_BABEL_INCDIR=$OPEN_BABEL_HOME/include/openbabel3
export OPEN_BABEL_LIBDIR=$OPEN_BABEL_HOME/lib
export OPEN_BABEL_DATADIR=$OPEN_BABEL_HOME/share/openbabel/3.1.0
export OPENBABEL_CFLAGS="-I$OPEN_BABEL_INCDIR -L$OPEN_BABEL_LIBDIR"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64:$UDUNITS2_LIBS:/home/biocbuild/libsbml/lib:$OPEN_BABEL_HOME/lib
export PATH=/home/biocbuild/bin:$PATH:/usr/lib64/openmpi/bin:/home/biocbuild/libudunits-2/bin:/home/biocbuild/.dotnet:$OPEN_BABEL_HOME/bin
# use 24 hour time format
export LC_TIME="en_GB"
EOT

