#!/bin/bash

# WIP

realpath() {
  readlink -f "$1" 2>/dev/null || echo "$PWD/${1#./}"
}

safe_link() {
	local src="$1"
	[ ! "$2" = "" ] && dir="$2/" || dir=""

	local dest
  [ ! -d "$HOME/$dir" ] && mkdir -p "$HOME/$dir"

  dest="$HOME/$dir$(basename "$src")"

	[ ! -e "$dest" ] && ln -sf "$src" "$dest"
}

SCRIPT_PATH=$(realpath "$0")
DOTFILES=$(dirname "$SCRIPT_PATH")

safe_link "$DOTFILES"/.zshrc

# .config/*
for f in "$DOTFILES"/.config/*; do
	safe_link "$f" ".config"
done

# TODO: add git, fish, brew, ghq, fzf

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "MacOS detected"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew tap Homebrew/bundle
  brew bundle

  xcode-select --install
fi


echo "Done."
