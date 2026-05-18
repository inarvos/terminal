# Terminal configuration

Personal macOS terminal setup using [Kitty](https://sw.kovidgoyal.net/kitty/) and [Fish](https://fishshell.com/) with Vi-mode keybindings.

The configuration is designed for a keyboard-first workflow with Kitty window control, Fish Vi editing, Homebrew-based tooling, and a compact visual style.

## Overview

This repository contains:

```text
kitty/
  kitty.conf
  theme.conf
  kitty-themes/

fish/
  config.fish
  conf.d/
```

The setup is primarily intended for my own Mac environment, but it can also be used as a reference for configuring Kitty, Fish, Vi mode, and terminal-based development tools.

## Main features

### Kitty

- Custom theme and background styling
- Custom Nerd Font setup
- Cursor trail
- Fish as the default shell
- macOS-friendly quit behaviour
- Split-window and scroll keybindings
- Remote control enabled for Fish-driven Kitty commands
- Safer paste handling
- Long-command completion notifications

### Fish

- Vi mode
- Custom greeting
- Stable Homebrew environment setup
- Clean PATH handling and de-duplication
- `pyenv`, `rbenv`, and `jenv` support
- `zoxide` for smarter directory navigation
- `atuin` for improved command history
- `direnv` for project-specific environments
- Clipboard-friendly Vi-mode bindings
- Kitty tab, window, split, and scroll controls

## Requirements

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

Kitty can be installed or updated with Homebrew Cask:

```bash
brew install --cask kitty
brew upgrade --cask kitty
```

## Font

The Kitty configuration expects:

```conf
font_family inarvos Nerd Font Mono
```

The font must be installed and visible to Kitty as a fixed-width font.

Check available Kitty fonts with:

```bash
kitten choose-fonts
```

If Kitty does not show the expected font, check macOS Font Book and confirm that the font is active and recognised as fixed width.

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

Examples:

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

## zoxide

`zoxide` is enabled automatically when installed.

Example usage:

```bash
z terminal
z project-name
```

## Atuin

`atuin` is enabled automatically when installed.

The configuration keeps normal up-arrow behaviour and uses Atuin for improved searchable command history.

## direnv

`direnv` is enabled automatically when installed.

For each project that uses an `.envrc` file:

```bash
direnv allow
```

## Notes

- The setup is macOS-focused.
- Kitty starts Fish directly.
- Fish does not need to be the global login shell.
- Optional tools are loaded only when available.
- Some paths and tools are specific to my local development environment.
