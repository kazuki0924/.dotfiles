function gacp {
  printf "zsh function executing following:\n\ngit add --all\ngit commit -m \$@\ngit push origin HEAD\n\n"
  readonly COMMENT=${@:?"The comment cannot be empty."}

  ga
  gc "$COMMENT"
  gpush
}
