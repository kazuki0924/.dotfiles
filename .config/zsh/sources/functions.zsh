function git_add_commit_push {
  printf "zsh function executing following:\n\ngit add --all\ngit commit -m \$@\ngit push origin HEAD\n\n"
  echo git add .
  echo git commit -m
  echo Commit Message: "$@"
  echo git push origin HEAD
  readonly COMMENT=${@:?"The comment cannot be empty."}

  git add .
  git commit -m "$COMMENT"
  git push origin HEAD
}

alias gacp="git_add_commit_push"

function alacritty_nvim {
  nohup alacritty -t "Alacritty - vim" -e $SHELL -lc "nvim $(pwd)/$1" >/dev/null & 
}

function alacritty_new_instance {
  nohup alacritty -t "Alacritty" -e $SHELL -lc "tmux new-session" >/dev/null & 
}

alias ani="alacritty_new_instance"

function tmux_split_horizontal {
  tmux split-window -h
}

function tmux_split_vertical {
  tmux split-window -v
}

function mkdir_nvim {
  mkdir -p "$(dirname "$1")" && touch "$1" && nvim "$1"
}

function icloud_dir {
  echo "$HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
}

function __dircopy {
  DIR="${2-"$(pwd)"}"
  
  function __home {
    echo -n "\"$DIR\""| sed "s|$HOME|\$HOME|" | pbcopy
  }

  case ${1-""} in

  --tilde | -t)
    echo -n "$DIR"| sed "s|$HOME|~|" | pbcopy
    ;;

  --full-path | -f)
    echo -n "$DIR" | pbcopy
    ;;

  --home | -h | "")
    __home
    ;;

  *)
    __home
    ;;
  esac
}

function __fuzzy_find_dir {
  if [[ "$1" ]]; then
    echo "$(fd -t d "$1" | head -1)"
  else 
    fd -t d | fzy
  fi
}

function __fuzzy_find_dot_dir {
  if [[ "$1" ]]; then
    echo "$(fd -H -t d "$HOME/.dotfiles" "$1" | head -1)"
  else 
    fd -H -t d . "$HOME/.dotfiles" | fzy
  fi
}

function __fuzzy_find_file {
  if [[ "$1" ]]; then
    echo "$(fd -t f "$1" | head -1)"
  else 
    fd -t f | fzy
  fi
}


function __fuzzy_find_dot_file {
  if [[ "$1" ]]; then
    echo "$(fd -H -t f "$HOME/.dotfiles" "$1" | head -1)"
  else 
    fd -H -t f . "$HOME/.dotfiles" | fzy
  fi
}

function fuzzy_find_nvim {
  if [[ "$1" ]]; then
    nvim $(__fuzzy_find_file "$1")
  else
    nvim $(__fuzzy_find_file)
  fi
}

alias ffv="fuzzy_find_nvim"

function fuzzy_find_dot_nvim {
  if [[ "$1" ]]; then
    nvim "$(__fuzzy_find_dot_file "$1")"
  else
    nvim "$(__fuzzy_find_dot_file)"
  fi
}

alias ffdv="fuzzy_find_dot_nvim"
alias fdv="fuzzy_find_dot_nvim"
alias fv="fuzzy_find_dot_nvim"

function fuzzy_exec_sh {
  if [[ "$1" ]]; then
    bash $(__fuzzy_find_file "$1")
  else
    bash $(__fuzzy_find_file)
  fi
}

alias fes="fuzzy_exec_sh"

function fuzzy_exec_dot_sh {
  if [[ "$1" ]]; then
    bash $(__fuzzy_find_dot_file "$1")
  else
    bash  $(__fuzzy_find_dot_file)
  fi
}

alias feds="fuzzy_exec_dot_sh"

function fuzzy_find_cd {
  if [[ "$1" ]]; then
    cd $(__fuzzy_find_dir "$1")
  else
    cd $(__fuzzy_find_dir)
  fi
}

alias ffcd="fuzzy_find_cd"

function fuzzy_find_dot_cd {
  if [[ "$1" ]]; then
    cd $(__fuzzy_find_dot_dir "$1")
  else
    cd $(__fuzzy_find_dot_dir)
  fi
}

alias ffdcd="fuzzy_find_dot_cd"

function fuzzy_find_copy_dir {
  if [[ "$2" ]]; then
    __dircopy "$(fd -t d -p "$2" | head -1)"
  else 
    __dircopy ${1-""} $(fd -t d -p | fzy)
  fi
}

alias ffcpd="fuzzy_find_copy_dir"

function fuzzy_find_copy_dot_dir {
  if [[ "$2" ]]; then
    __dircopy "$(fd -t d -p -H "$2" "$HOME/.dotfiles" | head -1)"
  else
    __dircopy ${1-""} $(fd -t d -p -H . "$HOME/.dotfiles" | fzy)
  fi
}

alias ffcpdd="fuzzy_find_copy_dot_dir"

alias pbcopy_pwd="__dircopy"
alias pp="__dircopy"
alias p="__dircopy"

function rgd {
  rg --hidden -p "$@" "$HOME/.dotfiles"
}
