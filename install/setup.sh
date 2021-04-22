#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_BACKUP_DIR=".dotfiles_backup_$(date +"%Y_%m_%d_%I_%M")"

# list of directories to not be included in files for creating symbolic links
NOT_DOTDIRS=(
  .git
  install
)

# create .dotfiles_backup in homedir
(
  cd
  mkdir -p $DOTFILES_BACKUP_DIR
)

to_dotfile_patterns() {
  local s="^("
  for v in "$@"; do
    s+="./$v/|"
  done
  s=${s%?}
  s+=")"
  echo $s
}

cd $DOTFILES_DIR
files=$(find . -type f | egrep -v "$(to_dotfile_patterns "${NOT_DOTDIRS[@]}")")

# backup files
(
  cd
  for file in $files; do
    if [ -f $file ]; then
      mv -v $file $DOTFILES_BACKUP_DIR
    fi
  done
)

# create symbolic links
(
  cd
  for file in $files; do
    if [ ! -f $file ]; then
      dotfile=.dotfiles/${file:2}
      ln -sfnv $dotfile $file
    fi
  done
)
