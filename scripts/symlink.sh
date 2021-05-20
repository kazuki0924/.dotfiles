#!/bin/bash

# Symbolic links:
# - creates directory and the symbolic links to the host dynamically
# - backup existing file

# Requirements:
# fd

REQUIREMENTS=(
  fd
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

DOT_DIRNAME="${1-".dotfiles"}"

DOTFILES_DIR="$HOME/$DOT_DIRNAME"
DOTFILES_BACKUP_DIR=".dotfiles_backup_$(date +"%Y_%m_%d_%H%M%S")"

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
)

# create .dotfiles_backup in homedir
(
  cd || exit
  mkdir -p "$DOTFILES_BACKUP_DIR"
)

cd "$DOTFILES_DIR" || exit

FIND_DIRS_COMMAND="fd -t d -H"
FIND_FILES_COMMAND="fd -t f -H"

for NOT_DOTDIR in "${NOT_DOTDIRS[@]}"; do
  FIND_DIRS_COMMAND+=" -E $NOT_DOTDIR"
  FIND_FILES_COMMAND+=" -E $NOT_DOTDIR"
done

for NOT_DOTFILE in "${NOT_DOTFILES[@]}"; do
  FIND_FILES_COMMAND+=" -E $NOT_DOTFILE"
done

mapfile -t DIRS < <(eval "$FIND_DIRS_COMMAND")
mapfile -t FILES < <(eval "$FIND_FILES_COMMAND")

# mkdir for creating symbolic links

(
  cd || exit
  for DIR in "${DIRS[@]}"; do
    echo creating directory "$DIR"...
    mkdir -p "$HOME/$DIR"
  done
)

# backup files and create symbolic links
(
  cd || exit
  for FILE in "${FILES[@]}"; do
    if [[ -f "$FILE" ]]; then
      echo moving existing files to backup:
      mv "$HOME/$FILE" "$DOTFILES_BACKUP_DIR"
    fi
    DOTFILE="$DOTFILES_DIR/$FILE"
    echo creating symlink:
    ln -sfnv "$DOTFILE" "$FILE"
  done
)
