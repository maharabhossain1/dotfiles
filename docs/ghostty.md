# ghostty

Font: Operator Mono Lig 13.5px. Theme: Catppuccin (auto light/dark). Opacity: 92%.

## Keybinds
| Key | Action |
|---|---|
| `Cmd + backtick` | Toggle quick terminal (global, works anywhere) |
| `Cmd + n` | New window |
| `Cmd + t` | New tab |
| `Cmd + w` | Close surface (tab/split) |
| `Cmd + shift + r` | Reload config (no restart needed) |
| `Cmd + d` | Split right (vertical) |
| `Cmd + shift + d` | Split down (horizontal) |
| `Cmd + shift + h/l/k/j` | Navigate splits |
| `Cmd + shift + = / -` | Resize split |
| `Cmd + 1-5` | Go to tab by number |

## Appearance settings
| Setting | Value | What it does |
|---|---|---|
| `background-opacity` | `0.92` | Slight transparency (0.0–1.0) |
| `background-blur` | `true` | Blurs what's behind the window |
| `cursor-style` | `bar` | Thin blinking bar cursor |
| `cursor-color` | `#89b4fa` | Catppuccin blue cursor |
| `font-thicken` | `true` | Slightly bolder font rendering |

## Font note
`Operator Mono Lig` is a paid font — not in the repo.
Must be installed manually on each new Mac (AirDrop from main Mac).
Located at `~/Library/Fonts/` on macOS.

## Changing transparency
Edit `~/.dotfiles/roles/ghostty/files/config`:
```
background-opacity = 0.92   # 1.0 = solid, 0.0 = fully transparent
```
Then `Cmd + shift + r` to reload. No restart needed.

## Theme
Auto-switches between Catppuccin Latte (light mode) and Catppuccin Mocha (dark mode)
based on macOS system appearance setting.
