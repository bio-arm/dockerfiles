#!/usr/bin/env bash

# install .NET
cd $HOME/Downloads
wget https://dot.net/v1/dotnet-install.sh
bash ./dotnet-install.sh --channel "6.0" --install-dir "$HOME/.dotnet"
