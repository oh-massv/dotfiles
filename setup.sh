echo "Installing dotfiles."

ln -sf $PWD/.zshrc ~/
ln -sf $PWD/.wezterm.lua ~/
ln -sf $PWD/.config/alacritty/alacritty.yml ~/.config/alacritty
ln -sf $PWD/.config/kitty ~/.config
ln -sf $PWD/.config/nvim ~/.config
ln -sf $PWD/.config/zellij ~/.config
ln -sf $PWD/.config/fish ~/.config
ln -sf $PWD/.config/starship.toml ~/.config
ln -sf $PWD/.yabairc ~/
ln -sf $PWD/.skhdrc ~/
ln -sf $PWD/.tmux.conf ~/
ln -sf $PWD/.tmux ~/

# --- need ---
# fish
# git
# anyenv
# -- nodenv - node
# python
# go
# fzf
# ghq

echo "Done! Reload your terminal."
