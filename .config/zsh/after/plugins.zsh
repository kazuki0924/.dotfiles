# zsh-z
# up
# zsh-fzy
# zsh-autopair
zinit wait lucid for \
  agkozak/zsh-z \
  peterhurford/up.zsh \
  aperezdc/zsh-fzy \
  hlissner/zsh-autopair

# CTRL-T: Place the selected file path in the command line
bindkey '^T' fzy-file-widget

__zsh-history-substring-search_config() {
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
  zstyle ":history-search-multi-word" page-size "50"
  zle -N history-substring-search-up
  zle -N history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# history-search-multi-word
# zsh-history-substring-search
# k
zinit wait"1" lucid for \
  zdharma/history-search-multi-word \
  atinit"__zsh-history-substring-search_config" \
  zsh-users/zsh-history-substring-search \
  supercrabtree/k

__zinit_last_completion_related_plugin() {
  ZINIT[COMPINIT_OPTS]=-C
  zicompinit
  zicdreplay
}

# fast-syntax-highlighting
# zsh-completions
# zsh-autosuggestions
zinit wait"2" lucid for \
  atinit"__zinit_last_completion_related_plugin" \
  zdharma/fast-syntax-highlighting \
  blockf \
  zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions
