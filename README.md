# Dotfiles

Managed with [chezmoi](https://github.com/twpayne/chezmoi)

> [!WARNING]
> Currently under construction!

## Quick Start

```bash
/bin/bash -c "$(curl -fsLS get.chezmoi.io)" -- init --apply oh-massv
```

Homebrew installation and `brew bundle` are disabled by default.

To enable them on a personal macOS machine, create
`~/.config/chezmoi/chezmoi.toml` before running Quick Start:

```toml
[data]
installBrew = true
```

## Notes

`chezmoi apply` does not install Homebrew packages unless `installBrew` is set.

Some tools may still download dependencies when they are first used:

- `nvim` bootstraps `lazy.nvim` and installs plugins/LSP tooling through AstroNvim.
- `mise` may install configured runtimes and tools when invoked.

tmux plugins are not installed automatically. To enable them:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
~/.local/share/tmux/plugins/tpm/bin/install_plugins
```
