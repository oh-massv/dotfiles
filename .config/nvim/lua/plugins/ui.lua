return {
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        format = {
          cmdline = { icon = "" },
        },
      },
      presets = {
        command_palette = false,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          border = { style = "single" },
        },
        mini = {
          win_options = { winblend = 0 },
        },
        hover = {
          border = { style = "single" },
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
      timeout = 3000,
      render = "compact",
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "freddiehaddad/feline.nvim",
    enabled = false,
    lazy = false,
    opts = function()
      local ctp_feline = require("catppuccin.groups.integrations.feline")
      return {
        components = ctp_feline.get(),
      }
    end,
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
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[ 
███╗   ███╗ █████╗ ███████╗███████╗██╗   ██╗
████╗ ████║██╔══██╗██╔════╝██╔════╝██║   ██║
██╔████╔██║███████║███████╗███████╗██║   ██║
██║╚██╔╝██║██╔══██║╚════██║╚════██║╚██╗ ██╔╝
██║ ╚═╝ ██║██║  ██║███████║███████║ ╚████╔╝ 
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝  ╚═══╝  
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
