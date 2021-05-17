#!/bin/bash -e

# Required:
# cargo setup done

# sudo
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# install Alacritty
git clone https://github.com/alacritty/alacritty "$HOME"/.oss/alacritty
cd "$HOME"/.oss/alacritty
rustup override set stable
rustup update stable
make app
cp -r target/release/osx/Alacritty.app /Applications/

# man
mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
