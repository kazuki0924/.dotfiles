SHELL := /usr/local/bin/bash

.PHONY: setup symlink fonts mac install homebrew npm_install_g curl

all: setup install

setup: symlink fonts mac 

symlink:
	./scripts/symlink.sh

fonts:
	./scripts/fonts.sh

mac:
	./scripts/mac.sh

install: homebrew npm_install_g curl 

homebrew:
	./scripts/homebrew.sh

npm_install_g :
	./scripts/npm_install_g.sh

curl:
	./scripts/curl.sh
