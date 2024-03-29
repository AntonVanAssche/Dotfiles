local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Packer specific keybindings.
vim.keymap.set('n', '<leader>pC', ':PackerCompile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pS', ':PackerSync<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ps', ':PackerStatus<CR>', { noremap = true, silent = true })

-- Install your plugins here
return packer.startup(function(use)
  -- General
    use { 'wbthomason/packer.nvim' }
    use { 'numToStr/Comment.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'prettier/vim-prettier',
        run = 'npm install --frozen-lockfile --production',
        ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html' }
    }

    -- Better undo
    use { 'mbbill/undotree' }

    -- Appearance
    use { 'nvim-lualine/lualine.nvim' }
    use { 'miyakogi/conoline.vim' }
    use { 'folke/zen-mode.nvim' }

    -- Display colors
    use { 'norcalli/nvim-colorizer.lua' }

    -- Colorschemes
    use { 'navarasu/onedark.nvim' }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- LSP Support
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'RRethy/vim-illuminate' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'zbirenbaum/copilot-cmp', requires = 'zbirenbaum/copilot.lua' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-cmdline' },
            { 'onsails/lspkind.nvim' },
            { 'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp' },
            -- { 'github/copilot.vim' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'nvim-treesitter/playground' }

    -- Git
    use { 'lewis6991/gitsigns.nvim' }

    -- TODO shit
    use { 'folke/todo-comments.nvim' }

    -- Markdown preview
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm instal' }

    -- Cyclist
    use { 'AntonVanAssche/cyclist.vim' }

    -- Self written plugins, GO CHECK THEM OUT!
    use { 'AntonVanAssche/date-time-inserter.nvim'}
    -- use { '/home/anton/Projects/date-time-inserter.nvim'}
    use {
    'AntonVanAssche/md-headers.nvim',
    -- '/home/anton/Projects/md-headers.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use {
        'AntonVanAssche/music-controls.nvim',
        requires = {
            'rcarriga/nvim-notify'
        }
    }

    use { 'alexghergh/nvim-tmux-navigation' }

    -- Terraform
    use { 'hashivim/vim-terraform' }

    use {
        'theprimeagen/harpoon',
        branch = 'harpoon2',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
