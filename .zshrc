source ~/.config/zsh/p10k.zsh
source ~/.config/zsh/zinit.zsh

for file in ~/.config/zsh/sources/*.zsh; do
  source $file
done
