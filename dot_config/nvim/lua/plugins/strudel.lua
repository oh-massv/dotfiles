return {
  {
    "gruvw/strudel.nvim",
    build = "npm ci",
    config = function()
      local strudel = require("strudel")
      strudel.setup()

      vim.keymap.set("n", "<leader>hl", strudel.launch, { desc = "Launch Strudel" })
      vim.keymap.set("n", "<leader>hq", strudel.quit, { desc = "Quit Strudel" })
      vim.keymap.set("n", "<leader>ht", strudel.toggle, { desc = "Strudel Toggle Play/Stop" })
      vim.keymap.set("n", "<leader>hu", strudel.update, { desc = "Strudel Update" })
      vim.keymap.set("n", "<leader>hs", strudel.stop, { desc = "Strudel Stop Playback" })
      vim.keymap.set("n", "<leader>hb", strudel.set_buffer, { desc = "Strudel set current buffer" })
      vim.keymap.set("n", "<leader>hx", strudel.execute, { desc = "Strudel set current buffer and update" })
    end,
  },
}
