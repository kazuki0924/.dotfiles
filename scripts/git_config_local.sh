#!/bin/bash

echo local user.name:
read USER_NAME
echo local user.emal:
read USER_EMAL

git config --local user.name "$USER_NAME"
git config --local user.email "$USER_EMAL"
