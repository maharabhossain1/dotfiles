# dotfiles

Ansible-managed dotfiles for macOS and Linux.

## Fresh machine setup

```bash
# 1. macOS only — install Xcode CLT (skip on Linux)
#    A popup will appear — click "Install", wait ~2 min
xcode-select --install

# Verify it finished
git --version  # should print a version number

# 2. Run bootstrap — handles everything else automatically
#    (Homebrew, Ansible, all packages, all configs, all symlinks)
curl -fsSL https://raw.githubusercontent.com/maharabhossain1/dotfiles/main/bootstrap.sh | bash
```

## Existing machine — pull and apply updates

Before pulling updates, make sure your git identity is persisted in `host_vars/<your-hostname>.yml` (see below) — otherwise `ansible-playbook` will overwrite your `.gitconfig` with the placeholder defaults.

```bash
cd ~/.dotfiles
git pull
ansible-playbook site.yml
```

## Machine-specific overrides

Bootstrap prompts for your git name and email on a fresh install. For subsequent `ansible-playbook` runs you must persist your identity in `host_vars/<your-hostname>.yml` (gitignored), otherwise the playbook overwrites `.gitconfig` with placeholders:

```yaml
# host_vars/work-macbook.yml
git_user_name: "Your Name"
git_user_email: "you@example.com"
```

## What's managed

| Role | What it does | Docs |
|---|---|---|
| `homebrew` | Installs all tools from Brewfile | — |
| `zsh` | oh-my-zsh, powerlevel10k, plugins, nvm | [docs/zsh.md](docs/zsh.md) |
| `tmux` | Config + TPM plugins | [docs/tmux.md](docs/tmux.md) |
| `nvim` | Full neovim config via symlink | [docs/nvim.md](docs/nvim.md) |
| `ghostty` | Terminal config | [docs/ghostty.md](docs/ghostty.md) |
| `git` | .gitconfig (templated), .gitignore_global | — |
| `ssh` | ~/.ssh/config only — keys managed separately | — |

## SSH Keys

Private keys are **never** committed. After bootstrap, copy your keys manually:

```bash
scp you@old-machine:~/.ssh/id_ed25519 ~/.ssh/
scp you@old-machine:~/.ssh/id_ed25519.pub ~/.ssh/
chmod 600 ~/.ssh/id_ed25519
```
