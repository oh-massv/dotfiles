local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
})

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim" -- Common utilities

  -- Themes
  use "lunarvim/horizon.nvim"
  use "tiagovla/tokyodark.nvim"
  use "olivercederborg/poimandres.nvim"
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Syntax
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "windwp/nvim-ts-autotag"
  use { "kylechui/nvim-surround", tag = "*" }

  -- Lsp
  use "neovim/nvim-lspconfig" -- LSP
  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "ray-x/lsp_signature.nvim"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "SmiteshP/nvim-navic"


  -- Git
  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim" -- For git blame & browse
  use "kdheepak/lazygit.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp" -- Completion
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"

  -- Snippet
  use "L3MON4D3/LuaSnip"

  -- UI Helpers
  use "kyazdani42/nvim-tree.lua"
  use { "akinsho/toggleterm.nvim", tag = "v2.*" }
  use "norcalli/nvim-colorizer.lua"

  -- TabLine
  use { "akinsho/bufferline.nvim", tag = "v2.*" }

  -- StatusLine
  use "feline-nvim/feline.nvim"

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- Utility
  use 'stevearc/dressing.nvim'
  use "folke/noice.nvim"
  use "MunifTanjim/nui.nvim"
  use "rcarriga/nvim-notify"

  -- Editing Support
  use "windwp/nvim-autopairs"
  use "folke/zen-mode.nvim"
  use "folke/twilight.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Formatter
  use "MunifTanjim/prettier.nvim" -- Prettier plugin for Neovim's built-in LSP client

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"

  -- Comment
  use "tpope/vim-commentary"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "folke/todo-comments.nvim"

  -- Markdown
  use { "iamcco/markdown-preview.nvim" } -- need to run 'yarn install' at packer start dir

  -- ()
  use 'jbyuki/nabla.nvim'
  use 'stevearc/vim-arduino'
  -- use 'vim-denops/denops.vim'
  -- use 'kat0h/bufpreview.vim'

  -- Graveyard
  -- use 'github/copilot.vim'
  -- use 'nvim-telescope/telescope-ui-select.nvim'
  -- use 'navarasu/onedark.nvim'
  -- use 'matsuuu/pinkmare'
  -- use 'Shatur/neovim-ayu'
  -- use 'nvim-lualine/lualine.nvim'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
