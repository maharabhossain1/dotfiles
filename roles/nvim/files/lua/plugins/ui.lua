return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "monokai-pro",
          component_separators = { left = "", right = "" },
          section_separators   = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Buffer tabs
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
          offsets = {
            {
              filetype  = "neo-tree",
              text      = "Files",
              highlight = "Directory",
              separator = true,
            },
          },
        },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope  = { enabled = true },
      })
    end,
  },

  -- Nicer cmdline, messages, notifications
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search       = true,
          command_palette     = true,
          long_message_to_split = true,
        },
      })
    end,
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "                                                    ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                    ",
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file",    "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("g", "  Live grep",    "<cmd>Telescope live_grep<CR>"),
        dashboard.button("e", "  New file",     "<cmd>ene <BAR> startinsert<CR>"),
        dashboard.button("c", "  Config",       "<cmd>e $MYVIMRC<CR>"),
        dashboard.button("l", "󰒲  Lazy",         "<cmd>Lazy<CR>"),
        dashboard.button("q", "  Quit",         "<cmd>qa<CR>"),
      }
      require("alpha").setup(dashboard.config)
    end,
  },

  -- Show keybinds on partial press
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        win = { border = "rounded" },
      })
    end,
  },

  -- Git decorations in gutter
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "" },
          topdelete    = { text = "" },
          changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
          local gs  = package.loaded.gitsigns
          local map = function(l, r, desc)
            vim.keymap.set("n", l, r, { buffer = bufnr, desc = desc })
          end
          map("]h", gs.next_hunk,    "Next hunk")
          map("[h", gs.prev_hunk,    "Prev hunk")
          map("<leader>hp", gs.preview_hunk, "Preview hunk")
          map("<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
          map("<leader>hr", gs.reset_hunk,   "Reset hunk")
          map("<leader>hs", gs.stage_hunk,   "Stage hunk")
        end,
      })
    end,
  },

  -- LazyGit inside Neovim
  {
    "kdheepak/lazygit.nvim",
    cmd  = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Floating terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size      = 20,
        direction = "float",
        float_opts = { border = "curved" },
      })
    end,
  },

  -- Icons (required by many plugins)
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
