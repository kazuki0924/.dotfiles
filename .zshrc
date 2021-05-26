__source() {
  for file in ~/.config/"$1"/*.zsh; do
    source $file
  done
}

__source "zsh/before"
__source "zsh"
__source "zsh/after"
unset -f __source
