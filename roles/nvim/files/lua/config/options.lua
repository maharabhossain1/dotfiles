-- Ensure NVM's node is in PATH so Mason can install LSP servers
local nvm_dirs = vim.fn.glob(vim.fn.expand("$HOME") .. "/.nvm/versions/node/*/bin", false, true)
if #nvm_dirs > 0 then
  table.sort(nvm_dirs)
  local node_bin = nvm_dirs[#nvm_dirs] -- latest version
  if not vim.env.PATH:find(node_bin, 1, true) then
    vim.env.PATH = node_bin .. ":" .. vim.env.PATH
  end
end

local opt = vim.opt

-- Line numbers
opt.number         = true
opt.relativenumber = true

-- Indentation
opt.tabstop    = 2
opt.shiftwidth = 2
opt.expandtab  = true
opt.smartindent = true

-- Python/Django override (4 spaces)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.opt_local.tabstop    = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- UI
opt.wrap        = false
opt.cursorline  = true
opt.signcolumn  = "yes"
opt.termguicolors = true
opt.showmode    = false
opt.scrolloff   = 8
opt.sidescrolloff = 8
opt.pumheight   = 10

-- Search
opt.ignorecase = true
opt.smartcase  = true
opt.hlsearch   = false
opt.incsearch  = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files
opt.swapfile = false
opt.backup   = false
opt.undofile = true
opt.undodir  = vim.fn.stdpath("data") .. "/undo"

-- Performance
opt.updatetime = 200
opt.timeoutlen = 300

-- Misc
opt.clipboard     = "unnamedplus"
opt.mouse         = "a"
opt.conceallevel  = 2
opt.completeopt   = "menu,menuone,noselect"
opt.breakindent   = true
opt.linebreak     = true
