source ~/.config/zsh/p10k.zsh
source ~/.config/zsh/zinit.zsh

sources=()

# source user defined finctions, alias, env etc.
for file in ~/.config/zsh/sources/*.zsh; do
  sources+=$file
done

for f ($^sources(.N)) source $f
unset sources
