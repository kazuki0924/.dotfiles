#!/bin/bash -e

# create symlink
ln -s "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code" "/usr/local/bin/code-insiders"
ln -s "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code" "/usr/local/bin/code"

# install extensions
# TODO: fix
while read -r line; do
  code-insiders --force --install-extension "$line"
done <"$HOME"/.dotfiles/.config/vs-code/vsc-extensions.txt
