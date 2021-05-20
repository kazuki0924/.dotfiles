#!/bin/bash

# coc.nivm: symlink vscode snippets to coc

VS_CODE_DIR="$HOME/Library/Application Support/Code - Insiders/User/snippets"

VS_CODE_SNIPPET_BASH="$VS_CODE_DIR/shellscript.json"

COC_DIR="$HOME/.dotfiles/.config/coc/vs-code-snippets"

COC_BASH="$COC_DIR/sh.json"

ln -sfnv "$COC_BASH" "$VS_CODE_SNIPPET_BASH"
