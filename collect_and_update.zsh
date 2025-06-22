#!/usr/bin/env zsh

# Configuration
DOTSHARE_DIR="$HOME/Development/dotshare"
BREW_DIR="${DOTSHARE_DIR}/brew"
CONFIG_DIR="${DOTSHARE_DIR}/config"
OTHER_DIR="${DOTSHARE_DIR}/other"

# mkdir -p "${BREW_DIR}" "${CONFIG_DIR}" "${OTHER_DIR}"

echo "Looking for breeeeew"
brew list -1 > $BREW_DIR/brew_packages

echo "Looking for config"
rsync -avh --delete "${HOME}/.config/" "${CONFIG_DIR}" \
    --exclude='.DS_Store' \
    --exclude='*.cache*' \
    --exclude='*.log' \
    --exclude='Session.vim'

cat $HOME/Library/Application\ Support/com.mitchellh.ghostty/config > $CONFIG_DIR/ghostty.config

echo "Looking for git config"
cat $HOME/.gitconfig > $CONFIG_DIR/gitconfig

echo "Looking for macOS settings"
defaults read com.apple.dock > "${OTHER_DIR}/dock_settings"

echo "All configurations saved to ${DOTSHARE_DIR}. Exit…"
