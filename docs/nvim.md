# neovim

Plugin manager: lazy.nvim. Leader key: `Space`

## General
| Key | Action |
|---|---|
| `Space + w` | Save file |
| `Space + q` | Quit |
| `Space + Q` | Quit all |
| `jk` | Exit insert mode (instead of Esc) |
| `Esc` | Clear search highlight |

## Window navigation
| Key | Action |
|---|---|
| `Ctrl+h/j/k/l` | Move between splits (works in tmux too) |
| `Ctrl+↑/↓` | Resize split height |
| `Ctrl+←/→` | Resize split width |

## Buffers
| Key | Action |
|---|---|
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `Space + bd` | Delete/close buffer |

## File explorer (Neo-tree)
| Key | Action |
|---|---|
| `Space + e` | Toggle file explorer |
| `Space + o` | Focus file explorer |

## Fuzzy search (Telescope)
| Key | Action |
|---|---|
| `Space + ff` | Find files |
| `Space + fg` | Live grep (search text in all files) |
| `Space + fb` | List open buffers |
| `Space + fr` | Recent files |
| `Space + fs` | Document symbols |
| `Space + fk` | Show all keymaps |
| `Space + fc` | Commands |
| `Space + /` | Fuzzy search in current file |

## LSP (code intelligence)
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Hover documentation |
| `Space + la` | Code actions |
| `Space + lr` | Rename symbol |
| `Space + lf` | Format file |
| `Space + ld` | Show diagnostic (error details) |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

## Editing
| Key | Action |
|---|---|
| `Alt+j/k` | Move line/selection up or down |
| `< / >` (visual) | Indent left/right and keep selection |
| `Space + d` | Delete without copying to clipboard |

## Git
| Key | Action |
|---|---|
| `Space + gg` | Open LazyGit |

## Terminal
| Key | Action |
|---|---|
| `Space + t` | Toggle terminal |
| `Esc` (in terminal) | Exit terminal mode |

## Diagnostics (Trouble)
| Key | Action |
|---|---|
| `Space + xx` | Toggle diagnostics panel |
| `Space + xX` | Toggle buffer diagnostics |

## Tips
- Run `:Lazy` to manage plugins (update, install, clean)
- Run `:Mason` to manage LSP servers and formatters
- Run `:checkhealth` to diagnose issues
