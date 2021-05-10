#!/bin/bash

# Required:
# fzf to be installed

# goenv
which goenv >/dev/null 2>&1 || brew install goenv --HEAD
which fzf >/dev/null 2>&1 || brew install fzf
brew upgrade goenv --fetch-HEAD

echo Choose which version of go to install globally
VERSION=$(goenv install --list | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
goenv install $VERSION
goenv global $VERSION

echo goenv versions
goenv versions

# # install Go packages
env GO111MODULE=on >/dev/null 2>&1

# # slit
go get -u github.com/tigrawap/slit/cmd/slit

# # pistol
go get -u github.com/doronbehar/pistol/cmd/pistol
