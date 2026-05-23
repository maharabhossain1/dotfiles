# dotfiles

Ansible-managed dotfiles for macOS and Linux.

## Fresh machine setup

```bash
# 1. macOS only — install Xcode CLT (skip on Linux)
#    A popup will appear — click "Install", wait ~2 min
xcode-select --install

# Verify it finished
git --version  # should print a version number

# 2. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Add Homebrew to PATH (run both lines — Homebrew will remind you at the end too)
#    Line 1: permanent fix — adds brew to PATH on every terminal launch
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
#    Line 2: immediate fix — makes brew available right now without restarting
eval "$(/opt/homebrew/bin/brew shellenv)"

# 4. Install Ansible
brew install ansible

# 5. Run bootstrap — clones repo and sets everything up automatically
curl -fsSL https://raw.githubusercontent.com/maharabhossain1/dotfiles/main/bootstrap.sh | bash
```

## Existing machine — pull and apply updates

```bash
cd ~/.dotfiles
git pull
ansible-playbook site.yml
```

## Machine-specific overrides

Create `~/.dotfiles.local` (gitignored) and source it in your shell.  
Or create `host_vars/<your-hostname>.yml` (also gitignored) to override any variable:

```yaml
# host_vars/work-macbook.yml
git_user_email: "you@company.com"
git_user_name: "Your Work Name"
```

## What's managed

| Role | What it does |
|---|---|
| `homebrew` | Installs all tools from Brewfile |
| `zsh` | oh-my-zsh, powerlevel10k, plugins, nvm |
| `tmux` | Config + TPM plugins |
| `nvim` | Full neovim config via symlink |
| `ghostty` | Terminal config |
| `git` | .gitconfig (templated), .gitignore_global |
| `ssh` | ~/.ssh/config only — keys managed separately |

## SSH Keys

Private keys are **never** committed. After bootstrap, copy your keys manually:

```bash
scp you@old-machine:~/.ssh/id_ed25519 ~/.ssh/
scp you@old-machine:~/.ssh/id_ed25519.pub ~/.ssh/
chmod 600 ~/.ssh/id_ed25519
```
