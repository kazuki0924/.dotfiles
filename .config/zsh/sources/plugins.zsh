# zsh-autopair
zinit ice wait"0" lucid
zinit load hlissner/zsh-autopair

# cd
zinit ice wait"0" lucid
zinit light changyuheng/zsh-interactive-cd

# zsh-navigation-tools
zinit ice wait"1" lucid
zinit load psprint/zsh-navigation-tools

# history-search-multi-word
zstyle ":history-search-multi-word" page-size "50"
zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

# z
zinit load agkozak/zsh-z

# up
zinit load peterhurford/up.zsh

# k
zplugin ice silent wait"1"
zplugin light supercrabtree/k

# Don't bind these keys until ready
bindkey -r '^[[A'
bindkey -r '^[[B'
function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

zinit ice wait lucid atload'__bind_history_keys'
zinit light zsh-users/zsh-history-substring-search

# zsh-history-substring-search
# zinit lucid wait for zsh-users/zsh-history-substring-search
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
# zle -N history-substring-search-up
# zle -N history-substring-search-down
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# History substring searching
zinit ice wait lucid atload'__bind_history_keys'

# jarun/nnn, a file browser, using the for-syntax
zinit pick"misc/quitcd/quitcd.zsh" sbin make light-mode for jarun/nnn

# Install fzy-using widgets
zinit ice wait lucid silent
zinit load aperezdc/zsh-fzy
# ALT-C: cd into the selected directory
# CTRL-T: Place the selected file path in the command line
# CTRL-R: Place the selected command from history in the command line
# CTRL-P: Place the selected process ID in the command line
# Todo: load only when loaded
bindkey 'ç' fzy-cd-widget
bindkey '^T'  fzy-file-widget
bindkey '^R'  fzy-history-widget
bindkey '^P'  fzy-proc-widget

# fast-syntax-highlighting
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# Recommended Be Loaded Last.
zinit ice wait blockf lucid atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-completions
