# general bin paths
fish_add_path /usr/local/bin
fish_add_path $HOME/bin # will be moved

# go
set -gx GOPATH (go env GOPATH)
fish_add_path (go env GOPATH)/bin

# rust
fish_add_path $HOME/.cargo/bin

# docker
source /Users/massv/.docker/init-fish.sh || true # Added by Docker Desktop

# commands
abbr -a cp 'cp -i'
abbr -a mv 'mv -i'
abbr -a rm 'trash-put'
abbr -a vi 'nvim'
abbr -a . cd ../
abbr -a .. cd ../../
abbr -a ... cd ../../../

# eza
if command -q eza
  abbr -a ls 'eza --icons'
  abbr -a lt 'eza -lhag --tree --level=2 --long --icons --git'
  abbr -a ll 'eza --icons -lhag'
  abbr -a ltree 'eza --icons --tree'
end

# global variables
set -gx FZF_DEFAULT_OPTS "\
--height 40% --layout=reverse --info inline \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR nvim

# set -U fish_user_paths (echo $fish_user_paths | tr ' ' '\n' | sort -u)

starship init fish | source
