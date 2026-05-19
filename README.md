# Terminal configuration

Personal macOS terminal setup using [Kitty](https://sw.kovidgoyal.net/kitty/), [Fish](https://fishshell.com/), and Vi-mode keybindings.

The setup is designed for a keyboard-first workflow with Kitty splits and tabs, Fish Vi editing, terminal file navigation, Homebrew-managed tools, and a compact visual style.

<p align="center">
  <img src="assets/screenshots/preview.png" width="100%" alt="Kitty terminal with Fish greeting">
</p>

## Overview

This repository contains my terminal configuration files:

```text
kitty/
  kitty.conf
  theme.conf
  kitty-themes/

fish/
  config.fish
  conf.d/
  Homebrew list.png
```

The setup is focused on my own macOS environment, but it can also be used as a reference for configuring Kitty, Fish, Vi mode, terminal navigation, and development tooling.

## Features

### Kitty

- Custom theme and background styling
- Custom Nerd Font setup
- Cursor trail
- Fish as the default shell
- macOS-friendly quit behaviour
- Split-window and scroll keybindings
- Remote control for Fish-driven Kitty commands
- Safer paste handling
- Long-command completion notifications

### Fish

- Vi mode
- Custom greeting
- Homebrew environment setup
- Clean PATH handling and de-duplication
- `pyenv`, `rbenv`, and `jenv` support
- `zoxide` for smarter directory navigation
- `atuin` for improved command history
- `direnv` for project-specific environments
- Clipboard-friendly Vi-mode bindings
- Kitty tab, window, split, and scroll controls

## Environment

The setup is built around Kitty, Fish, and Homebrew-managed tools on macOS.

<p align="center">
  <img src="assets/screenshots/versions.png" width="100%" alt="Kitty and Fish versions in split panes">
</p>

Recommended tools:

```bash
brew install fish
brew install zoxide
brew install atuin
brew install direnv
```

Optional tools used by the Fish configuration when available:

```bash
brew install pyenv
brew install rbenv
brew install jenv
brew install fzf
brew install bat
```

A Homebrew package snapshot is included as a reference:

[View Homebrew package list](fish/Homebrew%20list.png)

Kitty can be installed or updated with Homebrew Cask:

```bash
brew install --cask kitty
brew upgrade --cask kitty
```

## Font

The Kitty configuration expects this font:

```conf
font_family inarvos Nerd Font Mono
```

The font must be installed locally and visible to Kitty as a fixed-width font.

Check available Kitty fonts with:

```bash
kitten choose-fonts
```

If the font is not available, install the font locally or choose another monospace font in `kitty/kitty.conf`.

## Workflow preview

The configuration is built for terminal-based work with split panes, tabs, Fish Vi mode, ranger, Neovim, and project navigation.

<p align="center">
  <img src="assets/screenshots/workflow.png" width="100%" alt="Kitty split panes with ranger, Neovim and shell workflow">
</p>

## Installation

Back up existing configuration files first:

```bash
cp -R ~/.config/fish ~/.config/fish.backup
cp -R ~/.config/kitty ~/.config/kitty.backup
```

Copy the Fish configuration:

```bash
mkdir -p ~/.config/fish
rsync -av fish/ ~/.config/fish/
```

Copy the Kitty configuration:

```bash
mkdir -p ~/.config/kitty
rsync -av kitty/ ~/.config/kitty/
```

Restart Kitty after copying the files.

## Validation

Check Fish syntax:

```bash
fish -n ~/.config/fish/config.fish
find ~/.config/fish -name "*.fish" -print -exec fish -n {} \;
```

Check tool availability:

```bash
command -v fish
command -v kitty
command -v zoxide
command -v atuin
command -v direnv
```

Check Kitty version:

```bash
kitty --version
```

View the active Kitty configuration with:

```text
Option + Command + ,
```

Reload Kitty configuration with:

```text
Control + Command + ,
```

## Fish workflow

The Fish configuration uses Vi mode and custom normal-mode bindings.

| Binding | Action |
|---|---|
| `yy` | Copy current command line |
| `p` | Paste from macOS clipboard |
| `_` | Move to beginning of line |
| `ss` | Horizontal Kitty split |
| `sv` | Vertical Kitty split |
| `sn` | Next Kitty layout |
| `te` / `to` | New Kitty tab |
| `tc` / `tx` | Close Kitty tab |
| `tn` / `Tab` | Next Kitty tab |
| `tp` | Previous Kitty tab |
| `gg` | Scroll to top |

Kitty-specific bindings are only active inside Kitty.

## Kitty shortcuts

The Kitty configuration also defines native shortcuts:

| Shortcut | Action |
|---|---|
| `Ctrl + Shift + E` | Horizontal split |
| `Ctrl + Shift + D` | Vertical split |
| `Ctrl + B` | Scroll page up |
| `Ctrl + F` | Scroll page down |
| `Ctrl + K` | Scroll line up |
| `Ctrl + J` | Scroll line down |

## Tools

### zoxide

`zoxide` is enabled automatically when installed.

Example usage:

```bash
z terminal
z project-name
```

### Atuin

`atuin` is enabled automatically when installed.

The configuration keeps normal up-arrow behaviour and uses Atuin for improved searchable command history.

### direnv

`direnv` is enabled automatically when installed.

For each project that uses an `.envrc` file:

```bash
direnv allow
```

### ranger

`ranger` can be used for terminal file navigation.

```bash
ranger
```

Toggle hidden files in ranger with:

```text
zh
```

## Example layout

Example of the setup with ranger file navigation and Vim/Neovim opened inside Kitty splits.

<p align="center">
  <img src="assets/screenshots/ranger-vim.png" width="100%" alt="Ranger file manager and Vim in Kitty split layout">
</p>

## Notes

- The setup is macOS-focused.
- Kitty starts Fish directly.
- Fish does not need to be the global login shell.
- Optional tools are loaded only when available.
- Some paths and tools are specific to my local development environment.
- The custom font should be installed locally before using the Kitty config.
