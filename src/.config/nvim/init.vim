set nocompatible
filetype off

" +-----------------------------------+
" | Plugins to install using Vim-Plug |
" +-----------------------------------+

call plug#begin('~/.vim/plugged')

" Colorschemes / Apearance
Plug 'joshdick/onedark.vim'
Plug 'kyoz/purify'
Plug 'rainglow/vim'
Plug 'ryanoasis/vim-devicons'

" Statusbar
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Current line highlight
Plug 'miyakogi/conoline.vim'

" Language packs
Plug 'moll/vim-node'
Plug 'sheerun/vim-polyglot'

" Display colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Code formating
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-surround'

" Git integration
Plug 'airblade/vim-gitgutter',
Plug 'tpope/vim-fugitive'

" Better copy and paste integration
Plug 'christoomey/vim-system-copy'

" Better file explorer
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Coment and uncomment
Plug 'preservim/nerdcommenter'

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

" +--------------+
" | Key mappings |
" +--------------+

map <F8> :vsplit term://bash<CR> " Open a terminal in the right side of the screen.
map <F7> :set pasteToggle<CR> " Toggle between paste and insert mode.
map <F6> :!clear && shellcheck %<CR> " Run shellcheck on the current file.
map <F5> :NERDTreeToggle<CR> " Toggle the file explorer.
map <F4> :RainbowToggle<CR> " Toggle the rainbow color scheme.
map <F3> :RainbowLoad<CR> " Load the rainbow color scheme.
map <F2> :x<CR> " Close the current tab.
map <F1> :setlocal spell! spelllang=en_us<cr> " Toggle spell checking.

nnoremap <SPACE> <Nop>
let mapleader=' '

" +------------+
" | Navigation |
" +------------+

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

" Tab navigation
nmap <silent> <leader>t :tabnext<CR>
nmap <silent> <leader>T :tabprevious<CR>

" Reload configuration file
nmap <leader>r :source $MYVIMRC<CR>

" +----------------------------------+
" | General settings an key mappings |
" +----------------------------------+

set number relativenumber
set nu rnu
set noshowmode
set splitbelow splitright
set wildmode=longest,list,full

" Miscellaneous settings.
set ttyfast
set nowrap
set cmdheight=2 " Give more space for displaying messages.

" History settings
set history=10000
set undolevels=3000
set noswapfile
set nobackup
set undodir=~/.config/nvim/undos
set undofile

" Allows to CTRL+C in other programs and put in Vim with p and yanking in Vim with y and CTRL+V in other programs
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard=unnamed
noremap <C-c> "+y e " Use CTRL+c to copy to system clipboard.
noremap <C-v> "+p e " Use CTRL+v to paste from system clipboard.

" Colorscheme
syntax on
set termguicolors
set background=dark
colorscheme onedark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" Tab
set softtabstop=3 " Yes I know I'm weird. DEAL WITH IT!
set tabstop=3
set shiftwidth=3
set smartindent
set scrolloff=999

" Cursor
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Search
set nohlsearch
set incsearch

" Display a vertical ruler on eightieth column.
set signcolumn=yes
set colorcolumn=100

highlight colorcolumn guibg=#E06C75

" Underline the current line, based on its length.
noremap <silent> <leader>ul mmyypVr-<Esc>`m

" Remeber the last cursor position.
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

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

" Toggle the highlighting or searches. Use the spacebar to clear the highlight.
noremap <silent> <leader>hl :set hlsearch!<CR>
noremap <silent> <SPACE> :noh<CR>

" Move the current line up or down.
noremap <silent> <C-l> :move -2<CR>
noremap <silent> <C-k> :move +1<CR>

" Faster navigation
noremap <silent> J 10j
noremap <silent> K 10k
noremap <silent> H 10h
noremap <silent> L 10l

" Place timestamps, be it date (YYYY-MM-DD) or time (HH:MM:SS).
if (exists("*strftime"))
   noremap <silent> <leader>date "=strftime("%d/%m/%Y")<CR>p9h
   noremap <silent> <leader>time "=strftime("%T")<CR>p7h
endif

" +-----------------+
" | Plugin settings |
" +-----------------+

" Lightline
set laststatus=2
let g:lightline = {
   \ 'colorscheme': 'onedark',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
   \ },
   \ 'tabline': {
   \   'left': [ ['buffers'] ],
   \   'right': [ ['close'] ]
   \ },
   \ 'component_expand': {
   \   'buffers': 'lightline#bufferline#buffers'
   \ },
   \ 'component_type': {
   \   'buffers': 'tabsel'
   \ }
   \ }

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeDirArrow=0
autocmd VimEnter * NERDTree | wincmd p " Start NERDTree and put the cursor back in the other window. 
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif " Open the existing NERDTree on each new tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " Close the NERDTree if it's the only tab.

" Hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

" Emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Z>'

" GitHub Copilot
imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Telescope settings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Tabnine
nmap <C-d> <plug>(YCMHover) " Toggle to manually trigger or hide the popup.

" Markdown preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
   \ 'mkit': {},
   \ 'katex': {},
   \ 'uml': {},
   \ 'maid': {},
   \ 'disable_sync_scroll': 0,
   \ 'sync_scroll_type': 'middle',
   \ 'hide_yaml_meta': 1,
   \ 'sequence_diagrams': {},
   \ 'flowchart_diagrams': {},
   \ 'content_editable': v:false,
   \ 'disable_filename': 0,
   \ 'toc': {}
   \ }

let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'dark'
set updatetime=100

" Conoline
let g:conoline_auto_enable = 1 " Enable Conoline automatically.
let g:conoline_use_colorscheme_default_normal=1 " Use the default colorscheme for normal mode.
let g:conoline_use_colorscheme_default_insert=1 " Use the default colorscheme for insert mode.

" Bracey (live-server)
let g:bracey_browser_command = 0 " Use the default browser.
let g:bracey_auto_start_browser = 1 " Start the browser when Bracey is started.
let g:bracey_refresh_on_save = 1 " Refresh the page when saving.
let g:bracey_auto_start_server = 1 " Start the server when Bracey is started.
let g:bracey_server_allow_remote_connections = 1 " Allow remote connections. This is useful when  if you want to view what changes will look like on other platforms at the same time.
let g:bracey_server_port = 8080 " The port to use for the server.
let g:bracey_server_host = "http://127.0.0.1" " The host to use for the server.

