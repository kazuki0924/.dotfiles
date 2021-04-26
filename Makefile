SHELL=/bin/bash

.PHONY: setup symlink mac install homebrew nnn_plugins

all: setup install

setup: symlink mac 

symlink:
	./scripts/symlink.sh

mac:
	./scripts/mac.sh

install: homebrew nnn_plugins 

homebrew:
	./scripts/homebrew.sh

nnn_plugins:
	curl -sL https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | bash
