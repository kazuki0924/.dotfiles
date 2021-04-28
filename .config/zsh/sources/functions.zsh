function gacp {
  printf "zsh function executing following:\n\ngit add --all\ngit commit -m \$@\ngit push origin HEAD\n\n"
  readonly COMMENT=${@:?"The comment cannot be empty."}

  ga
  gc "$COMMENT"
  gpush
}

function avim {
  nohup alacritty -t "Alacritty - vim" -e $SHELL -lc "nvim $(pwd)/$1" >/dev/null & 
}

function atn {
  nohup alacritty -t "test" -e $SHELL -lc "tmux new-session" >/dev/null & 
}
