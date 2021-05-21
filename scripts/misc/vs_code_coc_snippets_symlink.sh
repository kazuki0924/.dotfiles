#!/bin/bash
set -euo pipefail

# coc.nivm: symlink vscode snippets to coc

VS_CODE_SNIPPETS_DIR="$HOME/Library/Application Support/Code - Insiders/User/snippets"

COC_SNIPPETS_DIR="$HOME/.dotfiles/.config/coc/vsc-snippets"

mkdir -p "$COC_SNIPPETS_DIR"

VS_CODE_SOURCE_FILE_NAMES=(
  shellscript
)

COC_LINK_NAMES=(
  sh
)

SOURCE_FILES_COUNT=${#VS_CODE_SOURCE_FILE_NAMES[@]}
LINK_NAMES_COUNT=${#COC_LINK_NAMES[@]}

if [[ ! "$SOURCE_FILES_COUNT" = "$LINK_NAMES_COUNT" ]]; then
  echo numbr of source files and link names must match.
  exit 1
fi

for IDX in $(seq 1 "$SOURCE_FILES_COUNT"); do
  SOURCE="${VS_CODE_SOURCE_FILE_NAMES[$(("$IDX" - 1))]}"
  LINK="${COC_LINK_NAMES[$(("$IDX" - 1))]}"
  ln -sfnv "$VS_CODE_SNIPPETS_DIR/$SOURCE.json" "$COC_SNIPPETS_DIR/$LINK.json"
done