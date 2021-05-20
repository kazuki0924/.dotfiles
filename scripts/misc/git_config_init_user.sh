#!/bin/bash
set -euo pipefail

# git: create .gitconfig.user for .gitconfig to read

# Requirements:
# git trash-cli

FILE="$HOME/.gitconfig.user"
[[ -f "$FILE" ]] && trash-put "$FILE"

echo global user.name:
read -r USER_NAME
echo global user.emal:
read -r USER_EMAL

tee -a "$FILE" <<END
[user]
    name = $USER_NAME
    email = $USER_EMAL
END
