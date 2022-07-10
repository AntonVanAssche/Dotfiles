local fn = vim.fn

-- Automatically install packer.
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
vim.cmd [[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
]]

-- Use a protected call so we don't error out on first use.
packer = require "packer"

-- Have packer use a popup window
packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "rounded" }
      end,
   },
}

-- Install your plugins here.
return packer.startup(function(use)
  -- General
   use { 'wbthomason/packer.nvim' }
   use { 'windwp/nvim-autopairs' }
   use { 'numToStr/Comment.nvim' }
   use { 'kyazdani42/nvim-web-devicons' }
   use { 'kyazdani42/nvim-tree.lua' }
   use { 'moll/vim-bbye' }
   use { 'lewis6991/impatient.nvim' }
   use { 'lukas-reineke/indent-blankline.nvim' }
   use { 'goolord/alpha-nvim' }
   use { 'prettier/vim-prettier', 
      run = 'npm install --frozen-lockfile --production',
      ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
   }
   use { 'tpope/vim-surround' }
   use { 'mattn/emmet-vim' }

   -- Better copy and paste interaction.
   use { 'christoomey/vim-system-copy' }

   -- Better undo.
   use { 'mbbill/undotree' }

   -- Appearance.
   use { 'itchyny/lightline.vim' }
   use { 'miyakogi/conoline.vim' }

   -- Display colors.
   use { 'norcalli/nvim-colorizer.lua' }

   -- Colorschemes.
   use { 'joshdick/onedark.vim' }
   use { 'kyoz/purify' }

   -- CMP plugins.
   use { 'hrsh7th/nvim-cmp' }
   use { 'hrsh7th/cmp-buffer' }
   use { 'hrsh7th/cmp-path' }
   use { 'saadparwaiz1/cmp_luasnip' }
   use { 'hrsh7th/cmp-nvim-lsp' }
   use { 'hrsh7th/cmp-nvim-lua' }

   -- Snippets.
   use { 'L3MON4D3/LuaSnip' }
   use { 'rafamadriz/friendly-snippets' }

   -- Code completion.
   use { 'github/copilot.vim' }
   use { 'tabnine/YouCompleteMe', run = 'python3 install.py --all' }

   -- Telescope.
   use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
   }

   -- Treesitter.
   use { 'nvim-treesitter/nvim-treesitter' }

   -- Git.
   use { 'lewis6991/gitsigns.nvim' }

   -- DAP.
   use { 'mfussenegger/nvim-dap' }
   use { 'rcarriga/nvim-dap-ui' }
   use { 'ravenxrz/DAPInstall.nvim' }

   -- Markdown preview.
   use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm instal' }

   -- Live-server.
   use { 'turbio/bracey.vim',  run = 'npm install --prefix server' }

   -- Cheat sheet.
   use { 'sudormrfbin/cheatsheet.nvim' }

   -- Cursor hold fix.
   use { 'antoinemadec/FixCursorHold.nvim' }

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if PACKER_BOOTSTRAP then
      require("packer").sync()
   end
end)
