# ripgrep
zinit ice as"program" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"
zinit light BurntSushi/ripgrep

# exa
zinit ice as"program" from"gh-r" mv"exa* -> exa"
zinit light ogham/exa

# bat
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# fd
zinit ice as"program" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# fzy
zinit ice as"command" make"\!PREFIX=$ZPFX install" \
    atclone"cp contrib/fzy-* $ZPFX/bin/" \
    pick"$ZPFX/bin/fzy*"
zinit load jhawthorn/fzy
