#!/bin/bash

# Determine the bundle bundle ID via
#   mdls /Applications/iPhoto.app | grep kMDItemCF
# Determine the UTI via
#   mdls file.ext | grep kMDItemContentType

# Delay start for a few seconds. If it runs too early, the change won't register.
# sleep 5

EDITOR="com.microsoft.VSCodeInsiders"
TEXTS=(
  public.plain-text
  public.source-code
  public.data
  public.shell-script
  com.netscape.javascript-source
  .sh
  .zsh
  .zshrc
  .go
  .ts
  .tsx
  .js
  .jsx
  .css
  .scss
  .md
  .pdf
  .xml
  .cvs
  .json
  .sql
  .lua
  .vim
  .vimrc
  Makefile
  Brewfile
)

for TEXT in "${TEXTS[@]}"; do
  duti -s $EDITOR $TEXT all
done
