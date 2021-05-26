# List of terminal emulators to not use the powerlevel10k
TERMINALS_TO_EXCLUDE=(
  Apple_Terminal
)

if [ ! " ${TERMINALS_TO_EXCLUDE[@]} " =~ " ${TERM_PROGRAM} " ]; then
  # powerlevel10k
  zinit ice lucid atload'source ~/.p10k.zsh;' nocd
  zinit light romkatv/powerlevel10k
fi

# LS_COLORS
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
  atpull'%atclone' pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"'
zinit light trapd00r/LS_COLORS

autoload -U colors
colors
