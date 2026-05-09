return {
  {
    "folke/sidekick.nvim",
    enabled = false,
    opts = {
      -- add any options here
      cli = {
        win = {
          layout = "float",
        },
        mux = {
          backend = "tmux",
          enabled = false,
        },
      },
    },
  },
}
