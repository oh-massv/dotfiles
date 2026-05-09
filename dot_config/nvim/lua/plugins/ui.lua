return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        -- section_separators = "",
      },
      sections = {
        lualine_a = { { "mode", separator = { left = " " }, padding = { left = 1, right = 2 } } },
        lualine_z = {
          {
            function()
              return " " .. os.date("%R")
            end,
            separator = { right = " " },
            padding = { left = 2, right = 1 },
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      views = {
        mini = {
          win_options = { winblend = 0 },
        },
      },
      presets = {
        command_palette = false,
        lsp_doc_border = true,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "Bekaboo/dropbar.nvim",
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
        toggles = {
          hidden = false,
          ignored = false,
        },
      },
    },
  },
}
