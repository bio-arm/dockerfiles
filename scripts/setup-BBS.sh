#!/usr/bin/env bash

# clone BBS
git clone https://github.com/martin-g/BBS ${HOME}/BBS
cd ${HOME}/BBS
git switch kunpeng2

# install dependencies for BBS
cd ${HOME}/BBS/openEuler-files/22.03

# install OS dependencies
sudo bash dnf_bioc.sh
sudo bash dnf_cran.sh
sudo bash dnf_extra_fonts.sh
sudo bash dnf_nice_to_have.sh
sudo bash dnf_optional_compile_R.sh
sudo bash dnf_required_build.sh
sudo bash dnf_required_compile_R.sh
sudo bash dnf_vignettes_reference_manuals.sh

# install Python dependencies
sudo -H pip3 install -r pip_bbs.txt
sudo -H pip3 install -r pip_pkgs.txt
sudo -H pip3 install -r pip_spb.txt
