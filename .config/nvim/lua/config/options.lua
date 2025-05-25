-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.laststatus = 3

vim.g.autoformat = false

vim.g.snacks_animate = false

vim.filetype.add({
  extension = {
    mdx = "mdx",
  }
})

local opt = vim.opt

opt.scrolloff = 10
opt.pumblend = 0
opt.winblend = 0
