# Neovim

Plugin manager: **lazy.nvim** — Leader key: `Space`

Config lives in `~/.config/nvim/` (symlinked from dotfiles).

---

## Mental model

Neovim is modal. You are always in one of these modes:

| Mode | How to enter | What it does |
|---|---|---|
| Normal | `Esc` or `jk` | Navigate, run commands |
| Insert | `i / a / o` | Type text |
| Visual | `v / V / Ctrl+v` | Select text |
| Command | `:` | Run ex commands |
| Terminal | `Space+t` | Embedded terminal |

The entire workflow is: **Normal → do something → back to Normal**. Never stay in Insert longer than needed.

---

## Core keymaps

### General

| Key | Action |
|---|---|
| `jk` | Exit insert mode (faster than reaching for Esc) |
| `Esc` | Clear search highlight |
| `Space + w` | Save file |
| `Space + q` | Quit |
| `Space + Q` | Quit all |

### Navigation (Normal mode)

These are vim fundamentals — learn these first:

| Key | Action |
|---|---|
| `h / j / k / l` | Left / down / up / right |
| `w / b` | Jump forward / backward by word |
| `e` | Jump to end of word |
| `0 / $` | Start / end of line |
| `gg / G` | Top / bottom of file |
| `{number}G` | Jump to line number (e.g. `42G`) |
| `Ctrl+d / Ctrl+u` | Scroll half page down / up |
| `%` | Jump to matching bracket |
| `*` | Search word under cursor |
| `n / N` | Next / previous search match |

### Window splits

| Key | Action |
|---|---|
| `Ctrl+h/j/k/l` | Move between splits (also works across tmux panes) |
| `Ctrl+↑/↓` | Resize split height |
| `Ctrl+←/→` | Resize split width |
| `:vs` | Open vertical split |
| `:sp` | Open horizontal split |

### Buffers

| Key | Action |
|---|---|
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `Space + bd` | Close current buffer |
| `Space + fb` | Pick buffer from list (Telescope) |

---

## Editing

### Line operations

| Key | Action |
|---|---|
| `Alt+j / Alt+k` | Move line or selection up/down |
| `< / >` (visual) | Indent left/right, keeps selection |
| `Space + d` | Delete without overwriting clipboard |
| `yy` | Yank (copy) line |
| `dd` | Delete line |
| `p / P` | Paste after / before cursor |
| `u / Ctrl+r` | Undo / redo |
| `.` | Repeat last change — extremely powerful |

### Text objects (use with `d`, `c`, `y`, `v`)

| Key | Selects |
|---|---|
| `iw / aw` | Inner word / word with space |
| `i" / a"` | Inside quotes / quotes with content |
| `i( / a(` | Inside parens / parens with content |
| `i{ / a{` | Inside braces |
| `it / at` | Inside HTML tag |

Examples: `ci"` changes text inside quotes, `da{` deletes a whole block including braces, `yiw` yanks the word under cursor.

### Surround (nvim-surround)

| Key | Action |
|---|---|
| `ys{motion}{char}` | Add surround (e.g. `ysiw"` wraps word in quotes) |
| `cs{old}{new}` | Change surround (e.g. `cs"'` changes `"` to `'`) |
| `ds{char}` | Delete surround (e.g. `ds"` removes quotes) |
| `S{char}` (visual) | Wrap selection |

### Comments (Comment.nvim)

| Key | Action |
|---|---|
| `gcc` | Toggle comment on line |
| `gc` (visual) | Toggle comment on selection |
| `gcA` | Add comment at end of line |

---

## File explorer (Neo-tree)

| Key | Action |
|---|---|
| `Space + e` | Toggle explorer |
| `Space + o` | Focus explorer |

**Inside Neo-tree:**

| Key | Action |
|---|---|
| `Enter` | Open file |
| `v` | Open in vertical split |
| `s` | Open in horizontal split |
| `a` | Create file/directory |
| `d` | Delete |
| `r` | Rename |
| `y` | Copy |
| `x` | Cut |
| `p` | Paste |
| `?` | Show help |

Explorer auto-follows the current file and shows git status icons next to files.

---

## Fuzzy search (Telescope)

| Key | Action |
|---|---|
| `Space + ff` | Find files (includes hidden files) |
| `Space + fg` | Live grep — search text across entire project |
| `Space + fb` | Open buffers |
| `Space + fr` | Recently opened files |
| `Space + fs` | Document symbols (functions, classes) |
| `Space + fk` | All keymaps |
| `Space + fc` | Commands |
| `Space + /` | Fuzzy search inside current file |

**Inside Telescope:**

| Key | Action |
|---|---|
| `Ctrl+j / Ctrl+k` | Move up/down in results |
| `Enter` | Open selected |
| `Esc` | Close |
| `Ctrl+v` | Open in vertical split |
| `Ctrl+x` | Open in horizontal split |

**Pro tip:** `Space + fg` is your most powerful tool. Type a function name, variable, or string to find it anywhere in the project instantly.

---

## LSP — code intelligence

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find all references |
| `K` | Show hover documentation |
| `Space + la` | Code actions (fix, refactor, imports) |
| `Space + lr` | Rename symbol across project |
| `Space + lf` | Format file |
| `Space + ld` | Show diagnostic detail (float) |
| `[d` | Jump to previous diagnostic |
| `]d` | Jump to next diagnostic |

**Workflow for renaming:** Put cursor on any variable/function → `Space + lr` → type new name → Enter. Renames everywhere in the project.

**Workflow for fixing errors:** `]d` to jump to the error → `Space + la` to see available fixes → Enter to apply.

---

## Completion (nvim-cmp)

Completion triggers automatically as you type.

| Key | Action |
|---|---|
| `Ctrl+j / Ctrl+k` | Navigate completion menu |
| `Tab / Shift+Tab` | Navigate or jump through snippet placeholders |
| `Enter` | Confirm selection |
| `Ctrl+Space` | Manually trigger completion |
| `Ctrl+e` | Close completion menu |
| `Ctrl+b / Ctrl+f` | Scroll docs up/down |

Sources are prioritized: LSP → Snippets → Buffer → Path.

---

## Git (LazyGit)

| Key | Action |
|---|---|
| `Space + gg` | Open LazyGit |

**Inside LazyGit** (full TUI git client):

| Key | Action |
|---|---|
| `Space` | Stage/unstage file |
| `c` | Commit |
| `p` | Push |
| `P` | Pull |
| `b` | Branches |
| `d` | Diff |
| `z` | Undo last action |
| `q` | Quit |
| `?` | Show all keybindings |

---

## Diagnostics (Trouble)

| Key | Action |
|---|---|
| `Space + xx` | Toggle full project diagnostics panel |
| `Space + xX` | Toggle diagnostics for current buffer only |

Trouble gives you a panel at the bottom listing all errors and warnings. Click or navigate to jump directly to the issue.

---

## Terminal

| Key | Action |
|---|---|
| `Space + t` | Toggle floating terminal |
| `Esc` | Exit terminal mode back to Normal |

---

## TODO comments

The plugin highlights `TODO`, `FIXME`, `HACK`, `NOTE`, `BUG`, `WARN` in a different color anywhere in code.

Search all TODOs in the project: `:TodoTelescope`

---

## Plugin management

| Command | Action |
|---|---|
| `:Lazy` | Open plugin manager — update, install, clean |
| `:Lazy sync` | Install missing + update all plugins |
| `:Lazy clean` | Remove unused plugins |

## LSP server management

| Command | Action |
|---|---|
| `:Mason` | Open Mason UI — install/manage LSP servers, formatters, linters |
| `:checkhealth` | Diagnose issues with plugins, LSP, and dependencies |
| `:LspInfo` | Show active LSP servers for current buffer |

---

## Productivity workflows

**Find and replace across project:**
1. `Space + fg` to live grep the term
2. Inside Telescope, `Ctrl+q` to send results to quickfix list
3. `:cfdo %s/old/new/g | update` to replace in all matched files

**Quick file switching:**
- `Space + fr` for recently opened files — faster than navigating the tree
- `Space + fb` to switch between open buffers

**Multi-cursor equivalent:**
- `Space + lr` (LSP rename) for renaming symbols
- `*` to highlight all occurrences, then `cgn` + `.` to replace one by one

**Jump to any function fast:**
- `Space + fs` opens document symbols — lists all functions/classes/methods in the file

**Undo history:**
- Undo file is persistent (`undofile = true`) — you can undo changes even after closing and reopening a file

---

## Options worth knowing

| Option | Value | Effect |
|---|---|---|
| `relativenumber` | true | Line numbers relative to cursor — great for `{n}j/k` jumps |
| `scrolloff` | 8 | Keeps 8 lines above/below cursor visible |
| `clipboard` | unnamedplus | System clipboard — yank/paste works with `Cmd+V` |
| `undofile` | true | Persistent undo across sessions |
| `tabstop` | 2 (4 for Python) | 2-space indent, 4 for Python/Django files |
| `timeoutlen` | 300ms | How fast key sequences must complete |
| `updatetime` | 200ms | How fast LSP and git signs update |
