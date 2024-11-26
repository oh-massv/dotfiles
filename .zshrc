if [[ -o interactive ]]; then
  if /opt/homebrew/bin/fish -n ~/.config/fish/config.fish; then
    exec /opt/homebrew/bin/fish
  else
    echo "Warning: fish configuration has errors. Falling back to zsh."
  fi
fi

# source /Users/massv/.docker/init-zsh.sh || true # Added by Docker Desktop
