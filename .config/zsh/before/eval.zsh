# go / goenv
eval "$(goenv init -)"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# python / pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

# nodejs / fnm
eval "$(fnm env)"
export PATH="$PATH:$HOME/.fnm"

# dircolors / gdircolors
eval "$(gdircolors $HOME/Miscellaneous/dircolors-solarized/dircolors.256dark)"

# iTerm2
if [ "$TERM_PROGRAM" = "iTerm.app" ] && [ -e $HOME/.iterm2_shell_integration.zsh ]; then
  source $HOME/.iterm2_shell_integration.zsh
fi
