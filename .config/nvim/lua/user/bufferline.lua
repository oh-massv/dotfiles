local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- local mocha = require("catppuccin.palettes").get_palette "mocha"

bufferline.setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    mode = "buffers",
    separator_style = "slant",
    always_show_bufferline = true,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "none",
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
      -- return " " .. icon
    end,
    show_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    offsets = {
      {
        filetype = "NvimTree",
        separator = false, -- use a "true" to enable the default, or set your own character
        -- text = "Explorer",
        -- highlight = "PanelHeading",
        -- highlight = "Directory",
        -- padding = 1,
      },
    },
  },
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
