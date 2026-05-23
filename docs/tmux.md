# tmux

Theme: Catppuccin Mocha. Prefix changed from `Ctrl+b` to `Ctrl+Space`.

## Prefix
All shortcuts below require pressing the prefix first: `Ctrl+Space`

## Sessions
| Key | Action |
|---|---|
| `prefix + $` | Rename session |
| `prefix + s` | List and switch sessions |
| `prefix + d` | Detach from session |
| `tmux new -s name` | New named session |
| `tmux attach -t name` | Attach to session |
| `tmux ls` | List sessions |

## Windows (tabs)
| Key | Action |
|---|---|
| `prefix + c` | New window (inherits current path) |
| `prefix + ,` | Rename window |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + 1-9` | Go to window by number |
| `prefix + &` | Kill window |

## Panes (splits)
| Key | Action |
|---|---|
| `prefix + \|` | Split vertical (side by side) |
| `prefix + -` | Split horizontal (top/bottom) |
| `prefix + h/j/k/l` | Navigate panes (vim keys) |
| `prefix + H/J/K/L` | Resize pane (repeatable) |
| `prefix + x` | Kill pane |
| `prefix + z` | Zoom pane (fullscreen toggle) |
| `prefix + {` / `}` | Swap pane left/right |

## Copy mode
| Key | Action |
|---|---|
| `prefix + Enter` | Enter copy mode |
| `v` | Start selection |
| `y` | Copy selection to clipboard (pbcopy) |
| `Ctrl+v` | Rectangle/block selection |
| `q` | Exit copy mode |

## Other
| Key | Action |
|---|---|
| `prefix + r` | Reload tmux config |
| `prefix + I` | Install plugins (TPM) |
| `prefix + U` | Update plugins (TPM) |

## Plugins installed
- `tmux-sensible` — sane defaults
- `tmux-yank` — better clipboard support
- `vim-tmux-navigator` — seamless vim/tmux pane navigation with Ctrl+h/j/k/l
