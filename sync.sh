#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Pulling latest dotfiles..."
git -C "$DOTFILES_DIR" pull

echo "==> Upgrading Homebrew packages..."
brew upgrade

echo "==> Applying dotfiles..."
ansible-playbook "$DOTFILES_DIR/site.yml"
