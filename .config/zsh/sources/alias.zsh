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
alias vs="code-insiders ."
alias vsr="cd && code-insiders ."
alias vsz="cd && code-insiders .zshrc"
alias vszc="cd ~/.config && code-insiders ."

# misc
alias air='$(go env GOPATH)/bin/air'
alias medis="cd /Applications/medis && npm start"
alias ssh="pbcopy < ~/.ssh/id_rsa.pub"
alias dokku="ssh root@157.245.240.4"

# tmux
alias tks="tmux kill-server"
alias tka="tmux neww && tmux killw -a && tmux killp -a"
alias tn="tmux new-session -d && tmux switch-client -n"

# exa
# general use
# alias ls='exa'                                                          # ls
# alias l='exa -lbF --git'                                                # list, size, type, git
# alias ll='exa -lbGF --git'                                             # long list
# alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
# alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
# alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
# alias lS='exa -1'                                                              # one column, just names
# alias lt='exa --tree --level=2'                                         # tree

# Homebrew

# Install these Homebrew formula globally:
alias bb="brew bundle --no-lock --file=~/.Brewfile"

# List all installed Homebrew formula not in this Brewfile:
alias bbcl="brew bundle cleanup --file=~/.Brewfile"

# Uninstall all installed Homebrew formula not in this Brewfile:
alias bbc="brew bundle cleanup --force --file=~/.Brewfile"

# Python
alias pip="pip3"
alias python="python3"

# trash-cli
alias rm='echo "This is not the command you are looking for."; false'
alias t="trash-put -v --trash-dir=$HOME/.Trash"
alias te="trash-empty --trash-dir=$HOME/.Trash"
alias tls="trash-list --trash-dir=$HOME/.Trash"
alias trestore="trash-restore --trash-dir=$HOME/.Trash"
alias trm="trash-rm --trash-dir=$HOME/.Trash"

# git-secret
alias gs="git-secret"
