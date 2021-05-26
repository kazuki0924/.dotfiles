zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache on
# do not include pwd after ../
zstyle ':completion:*' ignore-parents parent pwd
# Hide nonexistant matches, speeds up completion a bit
zstyle ':completion:*' accept-exact '*(N)'
# divide man pages by sections
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*' menu select

# Completion for Docker
zinit ice wait lucid as'completion'
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# Docker Compose
zinit ice wait lucid as'completion'
zinit snippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

zinit ice as"completion"
zinit snippet "$HOME/.config/zsh/completions/_fnm"

zinit ice as"completion"
zinit snippet "$HOME/.oss/alacritty/extra/completions/_alacritty"
