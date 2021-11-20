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

setup: symlink

.PHONY: setup

symlink:
> @ ~/.dotscripts/tasks/symlink.sh
> @ ~/.dotscripts//macos_copy_dotfile_fonts.sh

.PHONY: symlink
