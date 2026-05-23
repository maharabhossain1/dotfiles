return {
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window  = true,
        popup_border_style    = "rounded",
        enable_git_status     = true,
        enable_diagnostics    = true,
        window = {
          width = 30,
          mappings = {
            ["<cr>"] = "open",
            ["v"]    = "open_vsplit",
            ["s"]    = "open_split",
            ["a"]    = "add",
            ["d"]    = "delete",
            ["r"]    = "rename",
            ["y"]    = "copy_to_clipboard",
            ["x"]    = "cut_to_clipboard",
            ["p"]    = "paste_from_clipboard",
            ["c"]    = "copy",
            ["?"]    = "show_help",
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles  = false,
            hide_gitignored = true,
          },
          follow_current_file   = { enabled = true },
          use_libuv_file_watcher = true,
        },
        default_component_configs = {
          icon = {
            folder_empty = "󰜌",
          },
          git_status = {
            symbols = {
              added      = "✚",
              modified   = "",
              deleted    = "✖",
              renamed    = "󰁕",
              untracked  = "",
              ignored    = "",
              unstaged   = "󰄱",
              staged     = "",
              conflict   = "",
            },
          },
        },
      })
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions   = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix   = "  ",
          selection_caret = " ",
          path_display    = { "smart" },
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
          preview = {
            treesitter = false,
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<Esc>"] = actions.close,
              ["<C-u>"] = false,
            },
          },
        },
        pickers = {
          find_files = { hidden = true },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- Auto close brackets/quotes
  {
    "windwp/nvim-autopairs",
    event  = "InsertEnter",
    config = true,
  },

  -- Surround words/selections
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    config  = true,
  },

  -- Comment/uncomment with gc
  {
    "numToStr/Comment.nvim",
    event  = "VeryLazy",
    config = true,
  },

  -- TODO/FIXME/HACK highlights
  {
    "folke/todo-comments.nvim",
    event        = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config       = true,
  },

  -- Better diagnostics list (<leader>xx)
  {
    "folke/trouble.nvim",
    cmd          = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config       = true,
  },

}
