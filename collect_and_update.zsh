#!/usr/bin/env zsh
#
# Collects local macOS dotfiles/config into this repo so they can be committed.

set -euo pipefail

if [[ "${OSTYPE:-}" != darwin* ]]; then
    echo "❌ This script only supports macOS (detected: ${OSTYPE:-unknown})"
    exit 1
fi

# Configuration
DOTSHARE_DIR=${0:A:h}
BREW_DIR=${DOTSHARE_DIR}/brew
CONFIG_DIR=${DOTSHARE_DIR}/config
OTHER_DIR=${DOTSHARE_DIR}/other

# Directories under ~/.config that are gitignored (secrets/local state) —
# skip copying them entirely instead of syncing them just to have git ignore them.
CONFIG_EXCLUDES=(fish raycast simplex uv v2raya mole)

mkdir -p "$BREW_DIR" "$CONFIG_DIR" "$OTHER_DIR"

echo "Looking for breeeeew"

if ! command -v brew > /dev/null; then
    echo "❌ Homebrew is not installed or not on PATH"
    echo "PATH: $PATH"
    exit 1
fi

if ! brew list -1 > "${BREW_DIR}/brew_packages"; then
    echo "❌ Failed to save Homebrew packages"
    echo "Brew path: $(which brew)"
    exit 1
fi

echo "Looking for config"

if [[ -d "$HOME/.config" ]]; then
    rsync -a \
        $(for d in "${CONFIG_EXCLUDES[@]}"; do echo --exclude="$d"; done) \
        --exclude=".DS_Store" \
        "$HOME/.config/" "$CONFIG_DIR/"
else
    echo "⚠️  $HOME/.config not found, skipping"
fi

GHOSTTY_CONFIG="$HOME/Library/Application Support/com.mitchellh.ghostty/config"
if [[ -f "$GHOSTTY_CONFIG" ]]; then
    cp -f "$GHOSTTY_CONFIG" "$CONFIG_DIR/ghostty.config"
else
    echo "⚠️  Ghostty config not found at $GHOSTTY_CONFIG, skipping"
fi

if [[ -f "$HOME/.zshrc" ]]; then
    cp -f "$HOME/.zshrc" "$CONFIG_DIR/zshrc"
else
    echo "⚠️  $HOME/.zshrc not found, skipping"
fi

echo "Looking for git config"

if [[ -f "$HOME/.gitconfig" ]]; then
    cp -f "$HOME/.gitconfig" "$CONFIG_DIR/gitconfig"
else
    echo "⚠️  $HOME/.gitconfig not found, skipping"
fi

echo "Looking for macOS settings"

if ! defaults read com.apple.dock > "${OTHER_DIR}/dock_settings"; then
    echo "❌ Failed to read com.apple.dock defaults"
    exit 1
fi

echo "✅ All configurations saved to ${DOTSHARE_DIR}. Exit…"
