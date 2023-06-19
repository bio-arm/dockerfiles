#!/usr/bin/env bash


# install R
mkdir ${HOME}/R && cd ${HOME}/R
export R_VERSION=4.3.0
wget https://cran.r-project.org/src/base/R-4/R-${R_VERSION}.tar.gz
tar zxvf R-${R_VERSION}.tar.gz
cd R-${R_VERSION}
./configure --enable-memory-profiling --enable-R-shlib --with-blas --with-lapack  --with-tcl-config=/usr/lib64/tclConfig.sh --with-tk-config=/usr/lib64/tkConfig.sh
make -j1
mkdir site-library
cd etc/
${HOME}/BBS/utils/R-fix-flags.sh


# create a wrapper for R command
cat <<EOT > $HOME/bin/R
#!/usr/bin/env bash

R_ENVIRON_USER=${HOME}/BBS/3.18/Renviron.bioc $HOME/R/R-4.3.0/bin/R $@
EOT
chmod +x $HOME/bin/R
