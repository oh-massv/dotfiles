local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
  plugins = {
    twilight = { enabled = false },
  }
}

-- vim.keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })
