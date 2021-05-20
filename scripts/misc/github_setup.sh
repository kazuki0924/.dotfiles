#!/bin/bash
set -euo pipefail

# GitHub:
# - creates ssh keys if they don't exist
# - login
# - tests ssh connection

# Requirements:
# gh

# install requirements with homebrew if not already installed
which gh &>/dev/null || brew install gh

DIR="$HOME/.ssh"

[[ ! -d "$DIR" ]] && mkdir "$DIR"

if [[ ! -f "$DIR/id_rsa" ]]; then
	ssh-keygen -t rsa
fi

gh auth login

ssh -T git@github.com
