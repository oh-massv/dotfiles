# general bin paths
fish_add_path /usr/local/bin
fish_add_path $HOME/bin # will be moved

# go
set -gx GOPATH (go env GOPATH)
fish_add_path (go env GOPATH)/bin

# rust
fish_add_path $HOME/.cargo/bin

# asdf
#set -gx ASDF_CONFIG_FILE $HOME/.config/asdf/.asdfrc
#source /opt/homebrew/opt/asdf/libexec/asdf.fish # Added by asdf

# docker
source /Users/massv/.docker/init-fish.sh || true # Added by Docker Desktop

# commands
abbr -a cp 'cp -i' # or alias cp='cp -i'
abbr -a mv 'mv -i'
abbr -a rm 'trash-put'
abbr -a vi 'nvim'
abbr -a . cd ../
abbr -a .. cd ../../
abbr -a ... cd ../../../

# global variables
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --info inline --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:-1,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#98c379,marker:#e5c07b,spinner:#61afef,header:#61afef'
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR nvim
set -gx TERM xterm-256color
# set -gx TERM tmux-256color

# set -U fish_user_paths (echo $fish_user_paths | tr ' ' '\n' | sort -u)

starship init fish | source
