#!/bin/bash

# create symlink
ln -s "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code" "/usr/local/bin/code-insiders"

# install extensions
# TODO: fix
while read line
do
  code-insiders --force --install-extension $line
done < $HOME/.dotfiles/.config/vs-code/vsc-extensions.txt
