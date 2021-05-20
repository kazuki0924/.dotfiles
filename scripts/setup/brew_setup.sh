#!/bin/bash

# install homebrew

if ! which brew &>/dev/null; then
  sudo -v
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi


if which brew &>/dev/null; then
  brew doctor
  brew update --verbose
fi
