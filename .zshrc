source ~/.config/zsh/p10k.zsh
source ~/.config/zsh/zinit.zsh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/eval.zsh

for file in ~/.config/zsh/sources/*.zsh; do
  source $file
done
unset file

source ~/.config/zsh/plugins.zsh
