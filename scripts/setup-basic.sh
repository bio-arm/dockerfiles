#!/usr/bin/env bash

# install basic dependencies
dnf install -y vim git wget tar sudo make gcc-c++ gcc-gfortran readline-devel zlib-devel bzip2-devel xz-devel pcre2-devel libcurl-devel libXt-devel latex2html texlive-inconsolata  texinfo firefox java-17-openjdk rsync lapack-devel libxml2-devel autoconf automake  python3-pip cmake proj-devel shadow

# for some reason on aarch64 the permissions are `---s--x--x` instead of `-rwsr-xr-x`
chmod 4755 /usr/bin/sudo

# set hostname
echo "kunpeng2-docker" > /etc/hostname
