" This file contains the general settings.

let g:mapleader = "\<Space>"            " Map the leader key to `space`.

set fileencoding=utf-8                  " The encoding written to file
set encoding=utf-8                      " The encoding displayed
set t_Co=256                            " Support 256 colors

set pumheight=10                        " Makes popup menu smaller
set cmdheight=2                         " More space for displaying messages

set mouse=a                             " Enable your mouse

set updatetime=100                      " Faster completion

set nowrap                              " Display long lines as just one line
set number relativenumber               " Show line numbers relative to the current line.
set splitright                          " Vertical splits will automatically be to the right
set splitbelow                          " Horizontal splits will automatically be below
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set wildmode=longest,list,full

set hidden                              " Required to keep multiple buffers open multiple buffers
set history=10000                       " Number of entries in the history.
set undolevels=3000                     " Number of undo levels.
set noswapfile                          " Don't use a swap file. I don't like to have swap files in a project.
set nobackup                            " Don't make backup files.
set undodir=~/.config/nvim/undos        " Where to store the undo files.
set undofile                            " Use a single undo file.

" Allows to CTRL+C in other programs and put in Vim with p and yanking in Vim with y and CTRL+V in other programs
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard=unnamedplus               " Copy paste between vim and everything else
noremap <C-c> "+y e " Use CTRL+c to copy to system clipboard.

syntax enable                           " Enables syntax highlighing.
set termguicolors                       " Enables colors in terminal.
set background=dark                     " tell vim what the background color looks like.
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

set softtabstop=3                       " Number of spaces in a tab when editing..
set tabstop=3                           " Insert 3 spaces for a tab.
set shiftwidth=3                        " Change the number of space characters inserted for indentation.
set expandtab                           " Converts tabs to spaces.
set smartindent                         " Makes indenting smart.
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set autoindent                          " Good auto indent
set scrolloff=999                       " Keep de cursor in the middle of the screen.

" Reference of the values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar.
"   Ps = 6  -> steady bar.
let &t_SI = "\e[5 q"                    " Set the cursor to a line shape.
let &t_EI = "\e[2 q"                    " Set the cursor to a block shape.
set ruler                               " Show the cursor position all the time
set cursorline                          " Enable highlighting of the current line.

set ignorecase                          " Ignore the case of normal letters while searching.
set smartcase                           " Override the 'ignorecase' option if the search pattern contains uppercase characters.
set incsearch                           " Show where the pattern matches while typing.
set nohlsearch                          " Disable highlighting when done searching.

" Display a vertical ruler on the hundredth column.
set signcolumn=yes

function ToggleColorcolumn()
	if &colorcolumn == 0
		set colorcolumn=100
		highlight colorcolumn guibg=#E06C75
	else
		set colorcolumn=0
	endif
endfunction

" Remeber the last cursor position. Neovim doesn't remember the cursor
" position when you close a buffer. This is a workaround.
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

set listchars=tab:»→,trail:␣                        " The characters shown when `<leader>list` (`set list`) is used.

