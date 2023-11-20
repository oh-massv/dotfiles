# echo "Installing dotfiles."

ln -sf $PWD/.zshrc $HOME/
ln -sf $PWD/bin $HOME/.bin
ln -sf $PWD/.config/tmux $HOME/.config
ln -sf $PWD/.config/wezterm $HOME/.config
ln -sf $PWD/.config/alacritty $HOME/.config
ln -sf $PWD/.config/kitty $HOME/.config
ln -sf $PWD/.config/nvim $HOME/.config
# ln -sf $PWD/.config/AstroNvim $HOME/.config
# ln -sf $PWD/.config/LazyVim $HOME/.config
ln -sf $PWD/.config/zellij $HOME/.config
ln -sf $PWD/.config/fish $HOME/.config
ln -sf $PWD/.config/starship.toml $HOME/.config
ln -sf $PWD/.config/yabai $HOME/.config
ln -sf $PWD/.config/skhd $HOME/.config
ln -sf $PWD/.config/lazygit $HOME/.config
ln -sf $PWD/.config/asdf $HOME/.config

# --- need ---
# fish
# git
# python
# go
# fzf
# ghq

# echo "Done! Reload your terminal."
