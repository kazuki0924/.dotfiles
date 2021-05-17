#!/bin/bash -e

echo global user.name:
read -r USER_NAME
echo global user.emal:
read -r USER_EMAL

tee -a ~/.gitconfig.user <<END
[user]
    name = $USER_NAME
    email = $USER_EMAL
END
