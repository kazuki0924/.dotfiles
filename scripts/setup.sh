#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_BACKUP_DIR=".dotfiles_backup_$(date +"%Y_%m_%d")"

# list of directories to not be included in files for creating symbolic links
NOT_DOTDIRS=(
  .git
  .gitsecret
  scripts
)

# list of files to not be included in files for creating symbolic links
NOT_DOTFILES=(
  Makefile
  .gitignore
)

# create .dotfiles_backup in homedir
(
  cd
  mkdir -p $DOTFILES_BACKUP_DIR
)

to_dir_patterns() {
  local s
  for v in "$@"; do
    s+="./$v/|"
  done
  s=${s%?}
  echo $s
}

to_file_patterns() {
  local s
  for v in "$@"; do
    s+="$v|"
  done
  s=${s%?}
  echo $s
}

dp=$(to_dir_patterns "${NOT_DOTDIRS[@]}")
fp=$(to_file_patterns "${NOT_DOTFILES[@]}")
p="$dp|$fp"

cd $DOTFILES_DIR
files=$(find . -type f | egrep -v "$p")

# for debugging
# for file in $files; do
#   echo "$file"
# done

# backup files and create symbolic links
(
  cd
  for file in $files; do
    if [ -f $file ]; then
      mv -v $file $DOTFILES_BACKUP_DIR
      dotfile=$HOME/.dotfiles/${file:2}
      ln -sfnv $dotfile $file
    fi
  done
)
