#!/bin/bash

# Required:
# Nerd Font installed

# install nnn
git clone https://github.com/jarun/nnn $HOME/.oss
cd $HOME/.oss/nnn
make O_NERD=1 
trash-put /usr/local/bin/nnn
cp nnn /usr/local/bin

# install nnnhttps://github.com/jarun/nnn plugins:
curl -sL https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | bash
