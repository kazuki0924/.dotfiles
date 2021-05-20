#!/bin/bash
set -euo pipefail

# repl for testing bash scripts

read -p "Continue? [Yn]" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  exit 1
fi

DOT_DIRNAME="${1-.dotfiles}"
