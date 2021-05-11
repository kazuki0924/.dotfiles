#!/bin/bash

# Expected:
# homebrew to be installed
# goenv fzf to be installed via Brewfile (or it will be installed)

# goenv
which fzf &>/dev/null || brew install fzf
which goenv &>/dev/null || brew install goenv --HEAD
brew upgrade goenv --fetch-HEAD

echo Choose which version of go to install globally
# fuzzy find versions filtering out only the numbered ones in reverse order
VERSION=$(goenv install --list | awk '$0 !~ /[a-z]/' | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
goenv install $VERSION
goenv global $VERSION

echo ""
echo goenv versions;

goenv versions

# install w/ go get 
env GO111MODULE=on >/dev/null 2>&1

echo ""
echo installing go packages...

# slit
go get -u github.com/tigrawap/slit/cmd/slit

# pistol
go get -u github.com/doronbehar/pistol/cmd/pistol
