return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fm", "<cmd>Telescope memo list<cr>", desc = "Memo List", }
  },
  dependencies = {
    "delphinus/telescope-memo.nvim",
  },
  opts = function()
    local telescope = require("telescope")
    telescope.load_extension("memo")
  end
}
