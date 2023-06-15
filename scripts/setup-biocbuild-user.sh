#!/usr/bin/env bash

# add biocbuild user
adduser biocbuild
echo "biocbuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
