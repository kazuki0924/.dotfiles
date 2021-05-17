#!/bin/bash -e

### homebrew
which brew >/dev/null 2>&1 || sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

which brew >/dev/null 2>&1 && brew doctor

which brew >/dev/null 2>&1 && brew update --verbose

brew bundle --global --verbose
