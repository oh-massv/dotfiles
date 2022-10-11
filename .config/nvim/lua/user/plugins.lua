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

  ---- Themes
  use "lunarvim/horizon.nvim"
  use "tiagovla/tokyodark.nvim"
  use "olivercederborg/poimandres.nvim"
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  -- use 'navarasu/onedark.nvim'
  -- use 'matsuuu/pinkmare'
  -- use 'Shatur/neovim-ayu'
  -- use 'nvim-lualine/lualine.nvim'
  use "feline-nvim/feline.nvim"
  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
  }

  ---- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  }
  use "nvim-telescope/telescope-file-browser.nvim"

  ---- Syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  ---- Lsp
  use { "neovim/nvim-lspconfig" } -- LSP
  -- use "ray-x/lsp_signature.nvim"
  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "onsails/lspkind-nvim" -- vscode-like pictograms

  ---- Git
  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim" -- For git blame & browse
  use "kdheepak/lazygit.nvim"
  --
  ---- Auto-complete
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
      "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    },
  } -- Completion

  ---- UI Helpers
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  }
  use { "akinsho/toggleterm.nvim", tag = "v2.*" }
  use { "iamcco/markdown-preview.nvim" } -- need to run 'yarn install' at packer start dir
  use "tpope/vim-commentary"
  use "norcalli/nvim-colorizer.lua"
  use "folke/which-key.nvim"
  use({
    "folke/noice.nvim",
    -- event = "VimEnter",
    -- config = function()
    --   require("noice").setup()
    -- end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })
  use 'stevearc/dressing.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use "lukas-reineke/indent-blankline.nvim"
  use "folke/zen-mode.nvim"
  use "folke/twilight.nvim"

  use "MunifTanjim/prettier.nvim" -- Prettier plugin for Neovim's built-in LSP client

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "kyazdani42/nvim-web-devicons"
  use 'jbyuki/nabla.nvim'

  -- use 'github/copilot.vim'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
