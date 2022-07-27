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

return packer.startup({ function(use)
  -- Packer can manage it self
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use "nathom/filetype.nvim" -- Faster statup
  -- use { 'glepnir/dashboard-nvim', config = "require('plugins.dashboard')" }
  use { 'goolord/alpha-nvim', config = "require('plugins.alpha')" }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = "require('plugins.treesitter')" }
  use 'neovim/nvim-lspconfig'
  use { 'williamboman/nvim-lsp-installer', event = 'BufEnter', after = 'cmp-nvim-lsp' }
  use { 'romgrk/barbar.nvim', config = "require('plugins.barbar')" }
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use { "numToStr/Comment.nvim", config = "require('plugins.comment')" } -- Easily comment stuff
  use { 'akinsho/nvim-toggleterm.lua', config = "require('plugins.toggleterm')" }
  use "kyazdani42/nvim-web-devicons"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
  use { 'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter" }
  use { 'folke/trouble.nvim', config = "require('plugins.trouble')" }
  use 'ggandor/lightspeed.nvim'
  use { 'sindrets/diffview.nvim' }
  use { 'github/copilot.vim' }
  use 'xiyaowong/nvim-transparent'
  use 'wakatime/vim-wakatime'
    use({
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use { 'jose-elias-alvarez/typescript.nvim' }

  -- Sessionmanager
  use { 'Shatur/neovim-session-manager', config = "require('plugins.session-manager')" }

  -- Rust
  use { 'simrat39/rust-tools.nvim', config = "require('plugins.rust')" }

  -- Show loading LSP status
  use { 'j-hui/fidget.nvim', config = "require('plugins.fidget')" }

  -- Themes
  -- use {'bluz71/vim-nightfly-guicolors'}
  -- use {'folke/tokyonight.nvim'}
  -- use {'EdenEast/nightfox.nvim'}
  -- use { 'gruvbox-community/gruvbox' }
  use 'rebelot/kanagawa.nvim'

  --CSS color
  use { 'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')" }

  --Markdown preview, Glow
  use { "ellisonleao/glow.nvim" }

  -- Harpoon
  -- use {'ThePrimeagen/harpoon'}

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = "require('plugins.lualine')"
  }

  -- indent line
  use { 'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')" }

  -- autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  --LSP
  -- use { "jose-elias-alvarez/null-ls.nvim", config = "require('lsp.null-ls')" } -- for formatters and linters
  -- use { 'jose-elias-alvarez/nvim-lsp-ts-utils', after = { 'nvim-treesitter' } } -- for typescript

  -- autocomplete
  use { 'hrsh7th/nvim-cmp', config = "require('plugins.nvim-cmp')" }
  use { 'onsails/lspkind-nvim' }
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  --Nvim Tree
  use { 'kyazdani42/nvim-tree.lua', branch = "master", config = "require('plugins.tree')" }
  use { 'airblade/vim-rooter' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim',
    config = "require('plugins.telescope/init')",
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim' }
    }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'cljoly/telescope-repo.nvim' }


  -- Git
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.gitsigns')",
    event = "BufRead"
  }

  -- use {
  --   "AckslD/nvim-neoclip.lua",
  --   config = function()
  --     require("neoclip").setup()
  --   end,
  -- }

end,
})
