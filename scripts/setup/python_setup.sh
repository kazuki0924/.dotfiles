#!/bin/bash

# Requirements:
# homebrew pyenv fzf

# pyenv
which fzf &>/dev/null || brew install fzf
which pyenv &>/dev/null || brew install pyenv --HEAD
brew upgrade pyenv --fetch-HEAD

echo Choose which version of python to install globally
# fuzzy find versions filtering out only the numbered ones in reverse order
VERSION=$(pyenv install --list | awk '$0 !~ /[a-z]/' | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
pyenv install "$VERSION"
pyenv global "$VERSION"

echo ""
echo pyenv versions

pyenv versions

# install w/ pip install

echo ""
echo installing with pip...
echo ""

# vimiv
pip install -U --user pyexiv2
pip install -U --user git+https://github.com/karlch/vimiv-qt/

# edir
pip install -U --user edir

# pynvim
python3 -m pip install -U --user pynvim

# vint
pip install -U --user vim-vint
