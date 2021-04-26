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
  .DS_Store
  README.md
  Makefile
  .gitignore
)

# create .dotfiles_backup in homedir
(
  cd
  mkdir -pv $DOTFILES_BACKUP_DIR
)

to_dir_patterns() {
  local s
  for v in "$@"; do
    s+="./$v|"
  done
  s=${s%?}
  echo $s
}

to_dir_patterns_for_files() {
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
dpf=$(to_dir_patterns_for_files "${NOT_DOTDIRS[@]}")
fp=$(to_file_patterns "${NOT_DOTFILES[@]}")
p="$dpf|$fp"

cd $DOTFILES_DIR

dirs=$(find . -type d | egrep -v "^($dp)")
files=$(find . -type f | egrep -v "$p")

# mkdir for creating symbolic links
(
  cd
  for dir in $dirs; do
    [[ "$dir" == "." ]] && continue
    echo creating directory $dir...
    mkdir -p $dir
  done
)

# backup files and create symbolic links
(
  cd
  for file in $files; do
    if [ -f $file ]; then
      echo moving existing files to backup...
      mv $file $DOTFILES_BACKUP_DIR
    fi
    dotfile=$HOME/.dotfiles/${file:2}
    echo creating symlink...
    ln -sfnv $dotfile $file
  done
)
