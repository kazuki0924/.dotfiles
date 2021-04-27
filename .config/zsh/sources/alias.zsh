# yarn
alias y="yarn"
alias yi="yarn init"
alias ya="yarn add"
alias yd="yarn add -D"
alias yrm="yarn remove"
alias yr="yarn run"
alias ys="yarn start"
alias yt="yarn test"
alias yu="yarn upgrade"
alias yui="yarn upgrade-interactive --latest"

# git
alias ga="git add --all"
alias gc="git commit -m "
alias gpush="git push origin HEAD"
alias gpull="git pull origin master"
alias gf="git fetch origin"
alias grs="git reset --soft HEAD~1"
alias s="source ~/.zshrc"

# vsc
alias vsc="code-insiders ."
alias vsch="cd && code-insiders ."
alias vscd="cd && code-insiders ~/.dotfiles"

# misc
alias air='$(go env GOPATH)/bin/air'
alias medis="cd /Applications/medis && npm start"

# tmux
alias tks="tmux kill-server"
alias tka="tmux neww && tmux killw -a && tmux killp -a"
alias tn="tmux new-session -d && tmux switch-client -n"

# exa
# general use
alias e='exa'                                                          # ls
alias el='exa -lbF --git'                                              # list, size, type, git
alias ell='exa -lbGF --git'                                            # long list
alias ellm='exa -lbGd --git --sort=modified'                           # long list, modified date sort
alias ela='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale' # all list
alias ex='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias elS='exa -1'               # one column, just names
alias elt='exa --tree --level=2' # tree

# homebrew
# install these homebrew formula globally:
alias bb="brew bundle --no-lock"
# list all installed homebrew formula not in this brewfile:
alias bbcl="brew bundle cleanup"
# uninstall all installed homebrew formula not in this brewfile:
alias bbc="brew bundle cleanup --force"

# python
alias pip="pip3"
alias python="python3"

# trash-cli
alias rm='echo "This is not the command you are looking for."; false'
alias t="trash-put -v"
alias te="trash-empty"
alias tls="trash-list"
alias trestore="trash-restore"
alias trm="trash-rm"

# git-secret
alias gs="git-secret"

# nnn
alias n="nnn -deH"

# cd
alias cdsource="cd ~/.dotfiles/.config/zsh/sources/"

# edit
alias valias="vim ~/.dotfiles/.config/zsh/sources/alias.zsh"

# zsh-diff-so-fancy
alias gdsf="git dsf"
