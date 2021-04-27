# powerlevel10k
zinit ice lucid atload'source ~/.p10k.zsh;' nocd
zinit light romkatv/powerlevel10k

# LS_COLORS
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
  atpull'%atclone' pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"'
zinit light trapd00r/LS_COLORS

autoload -U colors
colors
