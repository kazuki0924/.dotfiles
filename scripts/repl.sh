#!/usr/local/bin/bash
set -euo pipefail

__ffd() {
  DIR="${1-$(pwd)}"
  DIR_KEYWORD="${2-}"
  FILE_KEYWORD="${3-}"

  if [[ -n $FILE_KEYWORD ]]; then
    echo "$FILE_KEYWORD"
  else
    echo "else"
  fi
}

__ffd "" ""
