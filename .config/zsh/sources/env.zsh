# general
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less -R"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# go
# also in ~/.config/zsh/eval.zsh
export GOENV_ROOT="$HOME/.goenv"

# python
# Todo: use pyenv
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# alacritty
export PATH="$PATH:/Applications/Alacritty.app/Contents/MacOS"

# nnn
export NNN_OPTS="acdfrwAFH"
export NNN_TRASH="1"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_BMS='d:~/.dotfiles;c:~/Repositories/my-cheat-sheet-2021;m:~/Miscellaneous'
export NNN_PLUG='f:_open .*;x:_chmod +x $nnn;p:preview-tui-ext;c:fzcd'
export ICONLOOKUP=1
export GUI=1
export USE_PISTOL=1
export SPLIT="v"

# bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -RFX"
