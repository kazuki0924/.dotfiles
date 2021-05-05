# go / goenv
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# dircolors / gdircolors
eval "$(gdircolors $HOME/Miscellaneous/dircolors-solarized/dircolors.256dark)"
