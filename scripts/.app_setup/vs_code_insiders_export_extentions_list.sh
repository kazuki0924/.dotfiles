#!/bin/bash -e

EXT=$HOME/.dotfiles/.config/vs-code/vsc-extensions.txt

trash-put "$EXT"
code-insiders --list-extensions >"$EXT"
