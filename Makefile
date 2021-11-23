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

all: setup

setup: symlink fonts

.PHONY: setup

symlink:
> @ .symlink

.PHONY: symlink

fonts:
> cp -r ~/.dotfiles/assets/Fonts ~/Library/Fonts

.PHONY: symlink
