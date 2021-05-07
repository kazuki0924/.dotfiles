#!/bin/bash

echo global user.name:
read USER_NAME
echo global user.emal:
read USER_EMAL

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAL"
