" +----------------------+
" | General key mappings |
" +----------------------+

" Faster navigation
noremap <silent> J 10j
noremap <silent> K 10k
noremap <silent> H 10h
noremap <silent> L 10l

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

" Use alt + hjkl to resize windows.
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else.
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS.
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

nnoremap <TAB> :bnext<CR>               " TAB in general mode will move to text buffer.
nnoremap <S-TAB> :bprevious<CR>         " SHIFT-TAB will go back.
nnoremap <C-s> :w<CR>                   " Alternate way to save.
nnoremap <C-Q> :wq!<CR>                 " Alternate way to quit.
nnoremap <C-c> <Esc>                    " Use control-c instead of escape.

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

map <F1> :setlocal spell! spelllang=en_us<cr>        " Toggle spell checking.
map <F2> :x<CR>                                      " Close the current tab.
map <F3> :RainbowLoad<CR>                            " Load the rainbow color scheme.
map <F4> :RainbowToggle<CR>                          " Toggle the rainbow color scheme.
map <F5> :NERDTreeToggle<CR>                         " Toggle the file explorer.
map <F6> :!clear && shellcheck %<CR>                 " Run shellcheck on the current file.
map <F7> :set pasteToggle<CR>                        " Toggle between paste and insert mode.
map <F8> :vsplit term://bash<CR>                     " Open a terminal in the right side of the screen.

noremap <leader>ccl :call ToggleColorcolumn()<CR>    " Toggle the colorcolumn. (See: ~/.config/nvim/general/settings.vim)

noremap <silent> <leader>ul mmyypVr-<Esc>`m          " Underline the current line, based on its length.

" Remove double- or single-quotes, or graves wrapped around a string.
noremap <silent> <leader>rdq mmF"xf"x`m
noremap <silent> <leader>rsq mmF'xf'x`m
noremap <silent> <leader>rg mmF`xf`x`m

" Show the 'list' characters.
noremap <silent> <leader>ls :set list!<CR>

" Go to the next or previous file in the queue.
noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>

" Toggle the highlighting or searches. Use the spacebar to clear the highlight.
noremap <silent> <leader>hl :set hlsearch!<CR>
noremap <silent> <SPACE> :noh<CR>

" Move the current line up or down.
noremap <silent> <C-k> :move +1<CR>
noremap <silent> <C-j> :move -2<CR>

" Place timestamps, be it date (YYYY-MM-DD) or time (HH:MM:SS).
if (exists("*strftime"))
   noremap <silent> <leader>date "=strftime("%d/%m/%Y")<CR>p9h
   noremap <silent> <leader>time "=strftime("%T")<CR>p7h
endif

" +---------------------+
" | Plugin key mappings |
" +---------------------+


