echo "Installing dotfiles."

ln -sf `pwd`/config/nvim ~/.config/
ln -sf `pwd`/config/vim/.vimrc ~/
ln -sf `pwd`/config/zsh/.zshrc ~/
ln -sf `pwd`/config/zsh/.zsh_history ~/
ln -sf `pwd`/config/tmux/.tmux.conf ~/

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\\n\\nRunning on OSX"

    source install/brew.sh
    source install/osx.sh
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

if [ ! -d ~/.zplug ]; then
  curl -sL zplug.sh/installer | zsh
fi

echo "Done. Reload your terminal."
