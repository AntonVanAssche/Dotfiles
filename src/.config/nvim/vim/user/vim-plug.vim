" +-----------------------------------+
" | Plugins to install using Vim-Plug |
" +-----------------------------------+

call plug#begin('$HOME/.config/nvim/plugged')

" Colorschemes / Apearance
Plug 'joshdick/onedark.vim'
Plug 'kyoz/purify'
Plug 'ryanoasis/vim-devicons'

" Statusbar
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Current line highlight
Plug 'miyakogi/conoline.vim'

" Display colors
Plug 'norcalli/nvim-colorizer.lua'

" Code formating
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'

" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Better copy and paste integration
Plug 'christoomey/vim-system-copy'

" Better file explorer
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Coment and uncomment
Plug 'numToStr/Comment.nvim'

" Code completion
Plug 'github/copilot.vim' " THIS IS A BEAST!
Plug 'tabnine/YouCompleteMe', { 'do': 'python3 install.py --all' } " This is a fork of YouCompleteMe by Tabnine.

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Better undo
Plug 'mbbill/undotree'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

" Live-server
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" Cheat sheet
Plug 'sudormrfbin/cheatsheet.nvim'

call plug#end()

