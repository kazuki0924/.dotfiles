#!/bin/bash -e

# Expected:
# homebrew to be installed
# pyenv fzf to be installed via Brewfile (or it will be installed)

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
pip install pyexiv2
pip install -U git+https://github.com/karlch/vimiv-qt/

# edir
pip install -U edir
