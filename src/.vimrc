set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
"Plugin 'frazrepo/vim-rainbow'
Plugin 'rainglow/vim'
Plugin 'kyoz/purify'
Plugin 'sh.vim'
Plugin 'moll/vim-node'
Plugin 'hdima/python-syntax'
Plugin 'dylanaraps/wal.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'alvan/vim-closetag'
Plugin 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plugin 'mattn/emmet-vim'
Plugin 'joshdick/onedark.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" Put your non plugin stuff after this line
set number relativenumber
set nu rnu
set noshowmode
set splitbelow splitright
set wildmode=longest,list,full

" Lightline plugin configuration
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Rainbow plugin configuration
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

" All key mappings
map <F6> :!clear && shellcheck %<CR>
map <F5> :NERDTreeToggle<CR>
map <F4> :RainbowToggle<CR>
map <F3> :RainbowLoad<CR>
map <F2> :x<CR>

" NERDTree
let NERDTreeShowHidden=1

" Miscellaneous settings.
set undolevels=3000
set history=10000
set ttyfast

" Colorschemes
syntax on
set termguicolors
set background=dark
colorscheme onedark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" Tab
set softtabstop=3
" number of spaces in tab when editing
set tabstop=3
" number of visual spaces per tab
set shiftwidth=3
" insert space characters whenever the tab key is pressed
set expandtab
" Keeps cursor centerd
set scrolloff=999

" map the leader key to <SPACE>
nnoremap <SPACE> <Nop>
let mapleader=' '

" Underline the current line, based on its length.
noremap <silent> <leader>ul mmyypVr-<Esc>`m

" Remove double- or single-quotes, or graves wrapped around a string.
noremap <silent> <leader>rdq mmF"xf"x`m
noremap <silent> <leader>rsq mmF'xf'x`m
noremap <silent> <leader>rg mmF`xf`x`m

" The characters shown when `<leader>list` (`set list`) is used.
set listchars=tab:»→,trail:␣

" Show the 'list' characters.
noremap <silent> <leader>ls :set list!<CR>

" Go to the next or previous file in the queue.
noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>

" Temporarily highlights the currently searched string.
set incsearch

" Toggle the highlighting or searches. Use the spacebar to clear the highlight.
noremap <silent> <leader>hl :set hlsearch!<CR>
noremap <silent> <SPACE> :noh<CR>

" Move the current line up or down.
noremap <silent> <C-l> :move -2<CR>
noremap <silent> <C-k> :move +1<CR>

" Jump up or down by 10 lines.
noremap <silent> J 10j
noremap <silent> K 10k

" Disable arrow keys in insert mode.
inoremap <Down>  <ESC>:echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>

" Disable arrow keys in normal mode.
nnoremap <Down>  :echoe "Use j"<CR>
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>

" Disable arrow keys in visual mode.
vnoremap <Down>  <ESC>:echoe "Use j"<CR>
vnoremap <Left>  <ESC>:echoe "Use h"<CR>
vnoremap <Right> <ESC>:echoe "Use l"<CR>
vnoremap <Up>    <ESC>:echoe "Use k"<CR>

" Hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

" Place timestamps, be it date (YYYY-MM-DD) or time (HH:MM:SS).
if (exists("*strftime"))
	noremap <silent> <leader>date "=strftime("%d/%m/%Y")<CR>p9h
	noremap <silent> <leader>time "=strftime("%T")<CR>p7h
endif
