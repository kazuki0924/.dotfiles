#!/bin/bash

ext=$HOME/.dotfiles/.config/vs-code/vsc-extensions.txt

trash-put $ext 
code-insiders --list-extensions > $ext 

