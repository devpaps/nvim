local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function()
  -- Packer can manage it self
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig' 
  use 'williamboman/nvim-lsp-installer'
  use {'romgrk/barbar.nvim', config = "require('plugins.barbar')"}
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  
  -- statusline
  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

 -- autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  --Nvim Tree
  use {'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')"}

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim'}
      }
    }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'cljoly/telescope-repo.nvim'}
  
  -- Themes
  use {'bluz71/vim-nightfly-guicolors'}
  use {'folke/tokyonight.nvim'}

  -- Git
  use {'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.gitsigns')",
    event = "BufRead"
  }

  -- Snippets & Language & Syntax
  use {'p00f/nvim-ts-rainbow', after = {'nvim-treesitter'}}
  use {'mattn/emmet-vim'}
end)
