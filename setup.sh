echo "Installing dotfiles."

ln -sf `pwd`/.zshrc ~/
ln -sf `pwd`/.wezterm.lua ~/
ln -sf `pwd`/.alacritty.yml ~/
ln -sf `pwd`/.config/nvim ~/.config
ln -sf `pwd`/.config/fish/config.fish ~/.config/fish
ln -sf `pwd`/.yabairc ~/
ln -sf `pwd`/.skhdrc ~/

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
