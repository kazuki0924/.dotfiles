#!/bin/bash -e
DOT_DIRNAME=".dotfiles"
if [ -n "$1" ]; then
  DOT_DIRNAME=$1
fi
DOTFILES_DIR="$HOME/$DOT_DIRNAME"
DOTFILES_BACKUP_DIR=".dotfiles_backup_$(date +"%Y_%m_%d")"

# list of directories to not be included in files for creating symbolic links
NOT_DOTDIRS=(
  .git
  .gitsecret
  scripts
  assets
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
  mkdir -pv "$DOTFILES_BACKUP_DIR"
)

to_dir_patterns() {
  local S
  for V in "$@"; do
    S+="./$V|"
  done
  S=${S%?}
  echo "$S"
}

to_dir_patterns_for_files() {
  local S
  for V in "$@"; do
    S+="./$V/|"
  done
  S=${S%?}
  echo "$S"
}

to_file_patterns() {
  local S
  for V in "$@"; do
    S+="$V|"
  done
  S=${S%?}
  echo "$S"
}

DP=$(to_dir_patterns "${NOT_DOTDIRS[@]}")
DPF=$(to_dir_patterns_for_files "${NOT_DOTDIRS[@]}")
FP=$(to_file_patterns "${NOT_DOTFILES[@]}")
P="$DPF|$FP"

cd "$DOTFILES_DIR"

DIRS=$(find . -type d | grep -E -v "^($DP)")
FILES=$(find . -type f | grep -E -v "$P")

# mkdir for creating symbolic links
(
  cd
  for DIR in $DIRS; do
    [[ "$DIR" == "." ]] && continue
    echo creating directory "$DIR"...
    mkdir -p "$DIR"
  done
)

# backup files and create symbolic links
(
  cd
  for FILE in $FILES; do
    if [ -f "$FILE" ]; then
      echo moving existing files to backup...
      mv "$FILE" "$DOTFILES_BACKUP_DIR"
    fi
    DOTFILE=$HOME/$DOT_DIRNAME/${FILE:2}
    echo creating symlink...
    ln -sfnv "$DOTFILE" "$FILE"
  done
)
