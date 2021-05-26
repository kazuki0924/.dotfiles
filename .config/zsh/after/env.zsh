# general
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less -R"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export IFS=$'\n\t'

# also check ~/.config/zsh/eval.zsh

# go / goenv
export GOENV_ROOT="$HOME/.goenv"

# python / pyenv
export PYENV_ROOT="$HOME/.pyenv"

# nodejs / fnm
export PATH="$PATH:$HOME/.fnm"

# rust / cargo
export PATH="$PATH:$HOME/.cargo/bin"

# alacritty
export PATH="$PATH:/Applications/Alacritty.app/Contents/MacOS"

# vs code
export PATH="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin:$PATH"

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

# gmake
export PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"
