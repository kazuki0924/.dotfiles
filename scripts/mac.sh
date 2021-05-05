#!/bin/bash

# show hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE

# create directories
DIRS=(
  Repositories
  Screenshots
  Miscellaneous
  Documents/{Personal,Work}
)

(
  cd
  for dir in "${DIRS[@]}"; do
    [ ! -d "$HOME/$dir" ] && mkdir -pv "$HOME/$dir"
    echo created $dir directory
  done
)

# Command Line Tools
xcode-select --install

