#!/usr/bin/env bash
set -euo pipefail

cleanup() {
  [[ -n "${tmp:-}" && -f "$tmp" ]] && rm -f "$tmp"
  tmux -L default-reset -f /dev/null kill-server >/dev/null 2>&1 || true
}

trap cleanup EXIT

# Start a clean tmux server to capture factory default key bindings.
tmp=$(mktemp)
tmux -f /dev/null -L default-reset start-server \; list-keys >"$tmp"

# Apply the captured bindings to the current server.
tmux source-file "$tmp"
