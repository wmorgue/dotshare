#!/usr/bin/env zsh

# Configuration
DOTSHARE_DIR=`pwd`
BREW_DIR=${DOTSHARE_DIR}/brew
CONFIG_DIR=${DOTSHARE_DIR}/config
OTHER_DIR=${DOTSHARE_DIR}/other

echo "Looking for breeeeew"

if ! brew list -1 > ${BREW_DIR}/brew_packages; then
    echo "❌ Failed to save Homebrew packages"
    echo "PATH: $PATH"
    echo "Brew path: $(which brew)"
    exit 1
fi

echo "Looking for config"
cp -Rf $HOME/.config/* $CONFIG_DIR

cat $HOME/Library/Application\ Support/com.mitchellh.ghostty/config > $CONFIG_DIR/ghostty.config

echo "Looking for git config"
cat $HOME/.gitconfig > $CONFIG_DIR/gitconfig

echo "Looking for macOS settings"
defaults read com.apple.dock > ${OTHER_DIR}/dock_settings

echo "All configurations saved to ${DOTSHARE_DIR}. Exit…"
