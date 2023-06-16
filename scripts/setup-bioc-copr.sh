#!/usr/bin/env bash

wget https://eur.openeuler.openatom.cn/coprs/yikun/bioconductor/repo/openeuler-22.03_LTS_SP1 -O /etc/yum.repos.d/bioconductor.repo
dnf update
dnf install -y udunits2-devel gsl-devel
