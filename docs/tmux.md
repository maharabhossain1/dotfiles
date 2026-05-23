# tmux

Theme: Catppuccin Mocha. Prefix: `Ctrl+Space` (not the default `Ctrl+b`).

All keybinds below need the prefix first unless stated otherwise.

---

## Mental model

tmux has three layers:

```
Session  →  one project / context (e.g. "dotfiles", "backend")
  Window   →  like a browser tab inside a session
    Pane     →  splits inside a window (side by side or top/bottom)
```

You live inside a **session**. Switch windows like tabs. Split into panes when you need two things visible at once.

---

## Sessions

Sessions survive terminal closes — detach and come back later, everything still running.

| Key | Action |
|---|---|
| `prefix + s` | List all sessions — navigate and switch |
| `prefix + $` | Rename current session |
| `prefix + d` | Detach (leaves session running in background) |
| `prefix + (` | Switch to previous session |
| `prefix + )` | Switch to next session |

**From the terminal (outside tmux):**

| Command | Action |
|---|---|
| `tmux` | New unnamed session |
| `tmux new -s name` | New named session |
| `tmux attach -t name` | Attach to a named session |
| `tmux attach` | Attach to last session |
| `tmux ls` | List all sessions |
| `tmux kill-session -t name` | Kill a session |

**Workflow:** Name your sessions by project. `tmux new -s backend`, `tmux new -s dotfiles`. Switch between them with `prefix + s`.

---

## Windows (tabs)

| Key | Action |
|---|---|
| `prefix + c` | New window (opens in current path) |
| `prefix + ,` | Rename window |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + 1-9` | Jump to window by number |
| `prefix + &` | Kill window |
| `prefix + w` | Visual window list (pick and switch) |

Windows start at index 1 (not 0). They auto-renumber when you close one.

---

## Panes (splits)

| Key | Action |
|---|---|
| `prefix + \|` | Split vertically (side by side) |
| `prefix + -` | Split horizontally (top/bottom) |
| `prefix + h/j/k/l` | Navigate panes (vim keys) |
| `prefix + H/J/K/L` | Resize pane (hold and repeat) |
| `prefix + z` | Zoom pane — fullscreen toggle |
| `prefix + x` | Kill pane |
| `prefix + {` / `}` | Swap pane position left/right |
| `prefix + q` | Show pane numbers (press number to jump) |

**Without prefix** — vim-tmux-navigator lets you move between panes AND nvim splits with the same keys:

| Key | Action |
|---|---|
| `Ctrl+h` | Move left |
| `Ctrl+j` | Move down |
| `Ctrl+k` | Move up |
| `Ctrl+l` | Move right |

This works whether you're in a tmux pane or inside nvim — same keys, no context switching.

---

## Copy mode (scroll + select)

| Key | Action |
|---|---|
| `prefix + Enter` | Enter copy mode (lets you scroll up) |
| `v` | Start selection |
| `y` | Copy selection to clipboard |
| `Ctrl+v` | Block/rectangle selection |
| `q` | Exit copy mode |

Navigation inside copy mode uses vim keys: `h/j/k/l`, `Ctrl+u/d` to scroll, `gg/G` for top/bottom, `/` to search.

---

## Config

| Key | Action |
|---|---|
| `prefix + r` | Reload tmux config live |
| `prefix + I` | Install plugins (TPM) |
| `prefix + U` | Update plugins |

---

## Plugins

- `tmux-sensible` — sane defaults (faster escape, larger history)
- `tmux-yank` — clipboard integration with pbcopy
- `vim-tmux-navigator` — unified pane/split navigation with nvim

---

## Quick reference

```
New session:       tmux new -s myproject
Attach:            tmux attach -t myproject
Split vertical:    prefix + |
Split horizontal:  prefix + -
Switch pane:       Ctrl+h/j/k/l  (no prefix needed)
Switch window:     prefix + 1-9
Switch session:    prefix + s
Detach:            prefix + d
Zoom pane:         prefix + z
```
