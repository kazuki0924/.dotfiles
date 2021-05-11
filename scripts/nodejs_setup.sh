#!/bin/bash

# Expected:
# homebrew to be installed
# fnm fzf to be installed via Brewfile (or it will be installed)

# fnm
which fzf &>/dev/null || brew install fzf
which fnm &>/dev/null || brew install fnm --HEAD
brew upgrade fnm --fetch-HEAD

# fnm completions for zsh
fnm completions --shell zsh | tee > "$HOME/.dotfiles/.config/zsh/completions/_fnm"
(
  cd $HOME/.dotfiles
  make symlink &>/dev/null
)

echo Choose which version of Node.js to install globally
# fuzzy find versions filtering out only the numbered ones in reverse order
VERSION="v$(fnm ls-remote | cut -c 2- | awk '$0 !~ /[a-z]/' | sort -rn -k 1 -t "." | fzf --layout=reverse --height=20%)"
fnm install $VERSION
fnm default $VERSION

echo ""
echo fnm current;

fnm current

# install w/ npm install

echo ""
echo installing with npm...
echo ""

# tldr
npm install -g tldr
