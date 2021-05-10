#!/bin/bash

# create directories
DIRS=(
  Repositories
  Screenshots
  Miscellaneous
  Documents/{Personal,Work}
  .oss
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

