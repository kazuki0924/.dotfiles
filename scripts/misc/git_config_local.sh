#!/bin/bash -e

echo local user.name:
read -r USER_NAME
echo local user.emal:
read -r USER_EMAL

git config --local user.name "$USER_NAME"
git config --local user.email "$USER_EMAL"
