if [[ -o interactive ]]; then
  exec /opt/homebrew/bin/fish
fi

source /Users/massv/.docker/init-zsh.sh || true # Added by Docker Desktop
