SHELL=/bin/bash

.PHONY: setup symlink mac install homebrew nnn_plugins

all: setup install

setup: symlink fonts mac 

symlink:
	./scripts/symlink.sh

fonts:
	./scripts/fonts.sh

mac:
	./scripts/mac.sh

install: homebrew nnn_plugins 

homebrew:
	./scripts/homebrew.sh

nnn_plugins:
	curl -sL https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | bash
