local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local mocha = require("catppuccin.palettes").get_palette "mocha"

bufferline.setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get {
    styles = { "italic", "bold" },
    custom = {
      all = {
        fill = { bg = "#000000" },
      },
      mocha = {
        background = { fg = mocha.text },
      },
    },
  },
  options = {
    mode = "buffers",
    separator_style = "slant",
    always_show_bufferline = true,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'none',
    },
    color_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
      -- return " " .. icon
    end,
    show_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = false,
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
