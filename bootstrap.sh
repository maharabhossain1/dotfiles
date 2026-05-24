#!/usr/bin/env bash
set -e

DOTFILES_REPO="https://github.com/maharabhossain1/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

echo "==> Starting dotfiles bootstrap"

# ---- Detect OS ----
OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  echo "==> macOS detected"

  # Install Xcode CLT if missing
  if ! xcode-select -p &>/dev/null; then
    echo "==> Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "    Waiting for Xcode CLT to finish (click Install in the popup)..."
    until xcode-select -p &>/dev/null; do
      sleep 5
    done
    echo "==> Xcode CLT installed"
  fi

  # Install Homebrew if missing
  if ! command -v brew &>/dev/null; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Install Ansible via brew
  if ! command -v ansible &>/dev/null; then
    echo "==> Installing Ansible..."
    brew install ansible
  fi

elif [[ "$OS" == "Linux" ]]; then
  echo "==> Linux detected"

  # Detect distro
  if command -v apt &>/dev/null; then
    echo "==> Installing dependencies via apt..."
    sudo apt update -qq
    sudo apt install -y git ansible curl
  elif command -v dnf &>/dev/null; then
    echo "==> Installing dependencies via dnf..."
    sudo dnf install -y git ansible curl
  else
    echo "ERROR: Unsupported Linux distro. Install git and ansible manually."
    exit 1
  fi
fi

# ---- Clone dotfiles ----
if [[ ! -d "$DOTFILES_DIR" ]]; then
  echo "==> Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "==> Dotfiles already cloned, pulling latest..."
  git -C "$DOTFILES_DIR" pull
fi

# ---- Git identity ----
CURRENT_GIT_NAME="$(git config --global user.name 2>/dev/null || true)"
CURRENT_GIT_EMAIL="$(git config --global user.email 2>/dev/null || true)"

if [[ -n "$CURRENT_GIT_NAME" && -n "$CURRENT_GIT_EMAIL" ]]; then
  echo "==> Git identity already set: $CURRENT_GIT_NAME <$CURRENT_GIT_EMAIL>"
  GIT_USER_NAME="$CURRENT_GIT_NAME"
  GIT_USER_EMAIL="$CURRENT_GIT_EMAIL"
else
  echo ""
  if [[ -z "$CURRENT_GIT_NAME" ]]; then
    read -r -p "    Git user name:  " GIT_USER_NAME
    while [[ -z "$GIT_USER_NAME" ]]; do
      read -r -p "    Git user name (cannot be empty): " GIT_USER_NAME
    done
  else
    GIT_USER_NAME="$CURRENT_GIT_NAME"
  fi

  if [[ -z "$CURRENT_GIT_EMAIL" ]]; then
    read -r -p "    Git user email: " GIT_USER_EMAIL
    while [[ -z "$GIT_USER_EMAIL" ]]; do
      read -r -p "    Git user email (cannot be empty): " GIT_USER_EMAIL
    done
  else
    GIT_USER_EMAIL="$CURRENT_GIT_EMAIL"
  fi
  echo ""
fi

# ---- Run Ansible ----
echo "==> Running Ansible playbook..."
cd "$DOTFILES_DIR"
ansible-playbook site.yml --ask-become-pass \
  -e "git_user_name=$GIT_USER_NAME" \
  -e "git_user_email=$GIT_USER_EMAIL"

echo ""
echo "==> Done! Restart your terminal."
