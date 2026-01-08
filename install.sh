#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
    [[ -e "$2" && ! -L "$2" ]] && mv "$2" "$2.bak"
    [[ -L "$2" ]] && rm "$2"
    ln -sf "$1" "$2"
    echo "✓ $2"
}

# Shell
link "$DIR/.zshrc" ~/.zshrc
link "$DIR/.zprofile" ~/.zprofile
link "$DIR/.p10k.zsh" ~/.p10k.zsh
link "$DIR/.zpreztorc" ~/.zpreztorc

# Git
link "$DIR/.gitconfig" ~/.gitconfig
link "$DIR/.gitignore_global" ~/.gitignore

# Editors
link "$DIR/.wezterm.lua" ~/.wezterm.lua
link "$DIR/.aerospace.toml" ~/.aerospace.toml
mkdir -p ~/.config
link "$DIR/nvim" ~/.config/nvim

# Tools
link "$DIR/.tool-versions" ~/.tool-versions
link "$DIR/starship.toml" ~/.config/starship.toml

# SSH (config only)
mkdir -p ~/.ssh && chmod 700 ~/.ssh
link "$DIR/ssh_config" ~/.ssh/config

# Claude
mkdir -p ~/.claude
link "$DIR/CLAUDE.md" ~/.claude/CLAUDE.md
link "$DIR/claude_settings.json" ~/.claude/settings.json

echo "Done! Old files backed up with .bak suffix"
