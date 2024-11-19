return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets = {
        command_palette = false,
        lsp_doc_border = true,
      }
      opts.views = {
        cmdline_popup = {
          -- border = { style = "single" },
        },
        mini = {
          win_options = { winblend = 0 },
        },
        hover = {
          -- border = { style = "single" },
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "echasnovski/mini.icons",
    -- enabled = false,
  },
  {
    "freddiehaddad/feline.nvim",
    -- enabled = false,
    config = function(_, opts)
      local ctp_feline = require("catppuccin.groups.integrations.feline")

      ctp_feline.setup({
        view = {
          lsp = {
            progress = true, -- if true the status bar will display an lsp progress indicator
            name = true, -- if true the status bar will display the lsp servers name, otherwise it will display the text "Lsp"
            exclude_lsp_names = {}, -- lsp server names that should not be displayed when name is set to true
            separator = "|", -- the separator used when there are multiple lsp servers
          },
        },
      })

      require("feline").setup({
        components = ctp_feline.get(),
        force_inactive = {
          filetypes = {
            "^NvimTree$",
            "^packer$",
            "^startify$",
            "^fugitive$",
            "^fugitiveblame$",
            "^qf$",
            -- "^help$",
          },
          buftypes = {},
        },
        disable = {
          filetypes = {
            "^Trouble$",
            "^Outline$",
            "^qf$",
            "^git$",
            "^dapui_scopes$",
            "^dapui_breakpoints$",
            "^dapui_stacks$",
            "^dapui_watches$",
            "^dapui_repl$",
            "^dap%-repl$",
            "^dapui_console$",
            "^Codewindow$",
            "^JABSwindow$",
            "^dashboard$",
            "^alpha$",
            "^starter$",
          },
        },
      })
    end,
  },
}
