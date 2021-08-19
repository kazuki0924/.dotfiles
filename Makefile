SHELL := bash
.ONESHELL:
.DELETE_ON_ERROR:
.SHELLFLAGS := -Eeuo pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

all: gitpull symlink

gitpull:
> @ echo git pull .dotfiles, .nvimfiles, .vscodefiles, .golandfiles, .zshfiles, and .dotscripts:
> @ git -C ~/.dotfiles pull
> @ [[ ! -d ~/.nvimfiles ]] && git clone https://github.com/kazuki0924/.nvimfiles ~/.nvimfiles
> @ git -C ~/.nvimfiles pull
> @ [[ ! -d ~/.vscodefiles ]] && git clone https://github.com/kazuki0924/.vscodefiles ~/.vscodefiles
> @ git -C ~/.vscodefiles pull
> @ [[ ! -d ~/.golandfiles ]] && git clone https://github.com/kazuki0924/.golandfiles ~/.golandfiles
> @ git -C ~/.golandfiles pull
> @ [[ ! -d ~/.zshfiles ]] && git clone https://github.com/kazuki0924/.zshfiles ~/.zshfiles
> @ git -C ~/.zshfiles pull
> @ [[ ! -d ~/.dotscripts ]] && git clone https://github.com/kazuki0924/.dotscripts ~/.dotscripts
> @ git -C ~/.dotscripts pull

symlink:
> @ cd ~/.dotscripts && make symlink

.PHONY: gitpull symlink
