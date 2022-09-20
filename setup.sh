echo "Installing dotfiles."

ln -sf `pwd`/.zshrc ~/
ln -sf `pwd`/.wezterm.lua ~/
ln -sf `pwd`/.alacritty.yaml ~/
ln -sf `pwd`/.config/nvim ~/.config/
ln -sf `pwd`/.config/fish ~/.config

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
