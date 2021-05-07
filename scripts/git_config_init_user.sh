#!/bin/bash

echo global user.name:
read USER_NAME
echo global user.emal:
read USER_EMAL

tee -a ~/.gitconfig.user << END
[user]
    name = $USER_NAME
    email = $USER_EMAL
END
