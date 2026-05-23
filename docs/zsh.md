# zsh

Theme: Powerlevel10k. Shell: oh-my-zsh with 4 plugins.

## Plugins
- `zsh-autosuggestions` — suggests commands as you type (accept with `→`)
- `zsh-syntax-highlighting` — colors valid/invalid commands as you type
- `zsh-completions` — extra tab completions
- `git` — git aliases and prompt info

## Navigation shortcuts
| Key | Action |
|---|---|
| `→` (right arrow) | Accept autosuggestion |
| `Tab` | Autocomplete / cycle options |
| `Ctrl+r` | Search command history |
| `Ctrl+t` | Fuzzy find files (fzf) |
| `Alt+c` | Fuzzy cd into directory (fzf) |
| `Ctrl+c` | Cancel current command |
| `Ctrl+l` | Clear screen |

## Git aliases
| Alias | Command |
|---|---|
| `g` | `git` |
| `gs` | `git status` |
| `ga` | `git add .` |
| `gc "msg"` | `git commit -m "msg"` |
| `gp` | `git push` |
| `gl` | `git pull` |
| `gco` | `git checkout` |
| `gcb` | `git checkout -b` |
| `gb` | `git branch` |
| `gd` | `git diff` |
| `glog` | `git log --oneline --graph --decorate --all` |
| `gundo` | `git reset --soft HEAD~1` (undo last commit, keep changes) |
| `gst` | `git stash` |
| `gstp` | `git stash pop` |

## Navigation aliases
| Alias | Command |
|---|---|
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |
| `ll` | `ls -la` |
| `la` | `ls -A` |

## Tool aliases
| Alias | Command |
|---|---|
| `v` | `nvim` |
| `vim` | `nvim` |
| `lg` | `lazygit` |
| `pn` | `pnpm` |
| `py` | `python3` |

## Custom functions
| Function | Usage | What it does |
|---|---|---|
| `mkcd` | `mkcd my-folder` | Creates folder and cd into it |
| `port` | `port 3000` | Shows what process is using a port |
| `extract` | `extract file.tar.gz` | Extracts any archive format |

## Zoxide (smarter cd)
Zoxide learns your most visited directories. After visiting a dir a few times:
```bash
z dotfiles      # jumps to ~/.dotfiles
z pro           # jumps to your most used "pro" matching dir
zi              # interactive fuzzy cd with fzf
```

## History
- 50,000 lines saved
- Shared across all terminal sessions
- Duplicates ignored
- Commands starting with a space are not saved
