local map = vim.keymap.set

-- ---- GENERAL ----
map("n", "<Esc>",     "<cmd>nohlsearch<CR>")
map("i", "jk",        "<Esc>")
map("n", "<leader>w", "<cmd>w<CR>",  { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>",  { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })

-- ---- WINDOW NAVIGATION ----
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Resize splits
map("n", "<C-Up>",    "<cmd>resize +2<CR>")
map("n", "<C-Down>",  "<cmd>resize -2<CR>")
map("n", "<C-Left>",  "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- ---- BUFFERS ----
map("n", "<Tab>",   "<cmd>bnext<CR>",   { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>",   { desc = "Prev buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- ---- EDITING ----
map("n", "<A-j>", "<cmd>m .+1<CR>==",       { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==",       { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv",      { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv",      { desc = "Move selection up" })
map("v", "<",     "<gv",                    { desc = "Indent left" })
map("v", ">",     ">gv",                    { desc = "Indent right" })
map("n", "<leader>d", '"_d',                { desc = "Delete without yank" })
map("v", "<leader>d", '"_d',                { desc = "Delete without yank" })

-- ---- FILE EXPLORER ----
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "File explorer" })
map("n", "<leader>o", "<cmd>Neotree focus<CR>",  { desc = "Focus explorer" })

-- ---- TELESCOPE (fuzzy search) ----
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",          { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",           { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",             { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",            { desc = "Recent files" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>",{ desc = "Symbols" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>",             { desc = "Keymaps" })
map("n", "<leader>fc", "<cmd>Telescope commands<CR>",            { desc = "Commands" })
map("n", "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search buffer" })

-- ---- LSP ----
map("n", "gd",        "<cmd>lua vim.lsp.buf.definition()<CR>",    { desc = "Go to definition" })
map("n", "gD",        "<cmd>lua vim.lsp.buf.declaration()<CR>",   { desc = "Go to declaration" })
map("n", "gi",        "<cmd>lua vim.lsp.buf.implementation()<CR>",{ desc = "Go to implementation" })
map("n", "gr",        "<cmd>Telescope lsp_references<CR>",        { desc = "References" })
map("n", "K",         "<cmd>lua vim.lsp.buf.hover()<CR>",         { desc = "Hover docs" })
map("n", "<leader>la","<cmd>lua vim.lsp.buf.code_action()<CR>",   { desc = "Code action" })
map("n", "<leader>lr","<cmd>lua vim.lsp.buf.rename()<CR>",        { desc = "Rename" })
map("n", "<leader>lf","<cmd>lua vim.lsp.buf.format()<CR>",        { desc = "Format" })
map("n", "<leader>ld","<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic float" })
map("n", "[d",        "<cmd>lua vim.diagnostic.goto_prev()<CR>",  { desc = "Prev diagnostic" })
map("n", "]d",        "<cmd>lua vim.diagnostic.goto_next()<CR>",  { desc = "Next diagnostic" })

-- ---- TERMINAL ----
map("n", "<leader>t", "<cmd>ToggleTerm<CR>",    { desc = "Toggle terminal" })
map("t", "<Esc>",     "<C-\\><C-n>",            { desc = "Exit terminal mode" })

-- ---- GIT ----
map("n", "<leader>gg", "<cmd>LazyGit<CR>",       { desc = "LazyGit" })

-- ---- TROUBLE ----
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",              { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics" })
