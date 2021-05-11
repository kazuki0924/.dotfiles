# go / goenv
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# python / pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/bin:$PATH"

# nodejs / fnm
eval "$(fnm env)"

# dircolors / gdircolors
eval "$(gdircolors $HOME/Miscellaneous/dircolors-solarized/dircolors.256dark)"

# iTerm2
if [ "$TERM_PROGRAM" = "iTerm.app" ] && [ -e $HOME/.iterm2_shell_integration.zsh ]; then
  source $HOME/.iterm2_shell_integration.zsh
fi
