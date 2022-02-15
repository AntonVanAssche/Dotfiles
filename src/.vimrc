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

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"Put your non plugin stuff after this line
set number relativenumber
set nu rnu
set noshowmode
set splitbelow splitright
set wildmode=longest,list,full

"Lightline plugin configuration
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'purify',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"Rainbow plugin configuration
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1

"All key mappings
map <F6> :!clear && shellcheck %<CR>
map <F5> :NERDTreeToggle<CR>
map <F4> :RainbowToggle<CR>
map <F3> :RainbowLoad<CR>
map <F2> :x<CR>

"NERDTree
let NERDTreeShowHidden=1

"Mouse integration
set ttyfast
set mouse=a

"Colorschemes
syntax on
set termguicolors
set background=dark
colorscheme purify
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

"Tab
set softtabstop=4
" number of spaces in tab when editing
set tabstop=4
" number of visual spaces per tab
set shiftwidth=4
" insert space characters whenever the tab key is pressed
set expandtab
" Keeps cursor centerd
set scrolloff=999
