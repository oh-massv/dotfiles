local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local conf = function(name)
  return require("massv.plugins.config." .. name)
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim' -- Common utilities

  ---- Themes
  use { 'lunarvim/horizon.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'olivercederborg/poimandres.nvim' }
  use { "catppuccin/nvim", as = "catppuccin", config = conf('catppuccin') }
  -- use 'navarasu/onedark.nvim'
  -- use 'matsuuu/pinkmare'
  -- use 'Shatur/neovim-ayu'
  use { 'nvim-lualine/lualine.nvim', config = conf('lualine') } -- Statusline
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = conf('bufferline')
  }

  ---- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = conf('telescope')
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  ---- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = conf('nvim-treesitter')
  }

  ---- Lsp
  use { 'neovim/nvim-lspconfig', config = require('massv.plugins.lsp') } -- LSP
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use { 'williamboman/mason.nvim', config = conf('mason') }
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  ---- Git
  use { 'lewis6991/gitsigns.nvim', config = conf('gitsigns') }
  use { 'dinhhuy258/git.nvim', config = conf('git') } -- For git blame & browse
  use 'kdheepak/lazygit.nvim'
  --
  ---- Auto-complete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
      'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
      'L3MON4D3/LuaSnip',
    },
    config = conf('nvim-cmp')
  } -- Completion
  use { 'onsails/lspkind-nvim', config = conf('lspkind') } -- vscode-like pictograms

  ---- UI Helpers
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = conf('nvim-tree')
  }
  use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = conf('toggleterm') }
  use { 'iamcco/markdown-preview.nvim' } -- need to run 'yarn install' at packer start dir
  use 'tpope/vim-commentary'
  use { 'norcalli/nvim-colorizer.lua', config = conf('nvim-colorizer') }
  use { "folke/which-key.nvim", config = conf('which-key') }
  -- use { 'fgheng/winbar.nvim', config = conf('winbar') }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = conf('navic')
  }
  -- use {
  --   "ur4ltz/surround.nvim",
  --   config = function()
  --     require "surround".setup { mappings_style = "surround" }
  --   end
  -- }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use { 'lukas-reineke/indent-blankline.nvim', config = conf('indent-blankline') }
  use { "folke/zen-mode.nvim", config = conf('zen-mode') }
  use "folke/twilight.nvim"

  use { 'MunifTanjim/prettier.nvim', config = conf('prettier') } -- Prettier plugin for Neovim's built-in LSP client

  use { 'windwp/nvim-autopairs', config = conf('nvim-autopairs') }
  use { 'windwp/nvim-ts-autotag', config = conf('nvim-ts-autotag') }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use { 'kyazdani42/nvim-web-devicons', config = conf('web-devicons') }

  -- use 'github/copilot.vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
