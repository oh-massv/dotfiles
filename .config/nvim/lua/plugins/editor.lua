return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["m"] = {
            "move",
            config = {
              show_path = "relative",
            },
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-dap.nvim" },
      {
        "delphinus/telescope-memo.nvim",
        keys = {
          { "<leader>mn", "<cmd>MemoNew<cr>", desc = "Memo New" },
          { "<leader>ml", "<cmd>Telescope memo list<cr>", desc = "Memo List" },
          { "<leader>mg", "<cmd>Telescope memo live_grep<cr>", desc = "Memo Grep" },
        },
        config = function()
          require("telescope").load_extension("memo")
        end,
      },
    },
    opts = {
      defaults = {
        -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = " ",
        file_ignore_patterns = { "node_modules" },
        -- selection_caret = " ",
      },
    },
  },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   event = "BufRead",
  --   dependencies = {
  --     { "kevinhwang91/promise-async" },
  --     {
  --       "luukvbaal/statuscol.nvim",
  --       config = function()
  --         local builtin = require("statuscol.builtin")
  --         require("statuscol").setup({
  --           ft_ignore = { "alpha", "neo-tree", "Trouble", "help", "toggleterm" },
  --           -- foldfunc = "builtin",
  --           -- setopt = true,
  --           relculright = true,
  --           segments = {
  --             { text = { "%s" }, click = "v:lua.ScSa" },
  --             { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
  --             { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
  --           },
  --         })
  --       end,
  --     },
  --   },
  --   config = function()
  --     -- Fold options
  --     vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  --     vim.o.foldcolumn = "1" -- '0' is not bad
  --     vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true
  --
  --     require("ufo").setup()
  --   end,
  -- },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        shade_terminals = false,
        shell = vim.o.shell,
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    enabled = false,
    keys = {
      { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    event = "VeryLazy",
    opts = {
      plugins = {
        wezterm = {
          enabled = true,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
      },
    },
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --     require("nvim-surround").setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end,
  -- },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },
}
