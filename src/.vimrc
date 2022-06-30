set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
"Plug 'frazrepo/vim-rainbow'
Plug 'rainglow/vim'
Plug 'kyoz/purify'
Plug 'moll/vim-node'
Plug 'hdima/python-syntax'
Plug 'dylanaraps/wal.vim'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'mattn/emmet-vim'
Plug 'joshdick/onedark.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'airblade/vim-gitgutter',
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'christoomey/vim-system-copy'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

call plug#end()

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
map <F9> :BraceyStop <Cr>
map <F8> :BraceyReload <Cr>
map <F7> :Bracey <Cr>
map <F6> :!clear && shellcheck %<CR>
map <F5> :NERDTreeToggle<CR>
map <F4> :RainbowToggle<CR>
map <F3> :RainbowLoad<CR>
map <F2> :x<CR>
map <F1> :setlocal spell! spelllang=en_us<cr>

" NERDTree
let NERDTreeShowHidden=1

" Miscellaneous settings.
set ttyfast
set nowrap

" History settings
set history=10000
set undolevels=3000
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Allows to CTRL+C in other programs and put in Vim with p and yanking in Vim with y and CTRL+V in other programs
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard=unnamed

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
set tabstop=3
set shiftwidth=3
set expandtab
set smartindent
set scrolloff=999

" Cursor
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Search
set nohlsearch
set incsearch

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

" Split window navigation
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>l :wincmd l<CR>

" Hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

" Place timestamps, be it date (YYYY-MM-DD) or time (HH:MM:SS).
if (exists("*strftime"))
	noremap <silent> <leader>date "=strftime("%d/%m/%Y")<CR>p9h
	noremap <silent> <leader>time "=strftime("%T")<CR>p7h
endif

" YouCompleteMe
set encoding=utf-8
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)

" Emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Z>'

