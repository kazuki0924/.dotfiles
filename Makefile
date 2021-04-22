.PHONY: setup install

all: setup install

setup:
	./scripts/setup.sh

install:
	brew bundle --no-lock
