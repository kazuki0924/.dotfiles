#!/bin/bash -e

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
  for DIR in "${DIRS[@]}"; do
    [ ! -d "$HOME/$DIR" ] && mkdir -pv "$HOME/$DIR"
    echo created "$DIR" directory
  done
)

# Command Line Tools
xcode-select --install
