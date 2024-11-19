#!/bin/bash

# WIP

realpath() {
  [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

safe_link() {
  local src="$1"
  [ ! "$2" = "" ] && dir="$2/" || dir=""
  local dest="$HOME/$dir`basename $src`"
  [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}

SCRIPT_PATH=`realpath $0`
DOTFILES=`dirname $SCRIPT_PATH`


safe_link $DOTFILES/bin
safe_link $DOTFILES/.zshrc

# .config/*
for f in `ls -A $DOTFILES/.config`
do
  safe_link $DOTFILES/.config/$f ".config"
done


# TODO: add git, fish, brew, ghq, fzf

# if [ "$(uname)" == "Darwin" ]; then
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#   brew tap Homebrew/bundle
#   brew bundle
#
#   xcode-select --install
# fi

echo "Done."
