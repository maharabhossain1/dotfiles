local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- Resize splits when window is resized
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Close these filetypes with just 'q'
autocmd("FileType", {
  pattern = { "help", "man", "qf", "lspinfo", "mason", "lazy", "notify", "trouble" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- Strip trailing whitespace on save (except for certain filetypes)
autocmd("BufWritePre", {
  callback = function()
    local ft = vim.bo.filetype
    local skip = { "markdown", "diff" }
    for _, v in ipairs(skip) do
      if ft == v then return end
    end
    local pos = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", pos)
  end,
})
