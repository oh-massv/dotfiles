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
