#!/usr/local/bin/bash
set -euo pipefail

function __dircopy {
  DIR="${2-"$(pwd)"}"

  function __home {
    echo -n "\"$DIR\"" | sed "s|$HOME|\$HOME|" | pbcopy
  }

  case ${1-""} in

  --tilde | -t)
    echo -n "$DIR" | sed "s|$HOME|~|" | pbcopy
    ;;

  --full-path | -f)
    echo -n "$DIR" | pbcopy
    ;;

  --home | -h | "")
    __home
    ;;

  *)
    __home
    ;;
  esac
}

function __fuzzy_find_dir {
  if [[ "$1" ]]; then
    echo -n "$(fd -t d "$1" | head -1)"
  fi
}
