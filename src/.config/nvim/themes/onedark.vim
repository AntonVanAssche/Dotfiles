" +---------------+
" | Onedark theme |
" +---------------+

syntax enable                           " Enables syntax highlighing.
colorscheme onedark                     " Sets the color scheme.
set termguicolors                       " Enables colors in terminal.
set background=dark                     " tell vim what the background color looks like.
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" Don't set a background color when running in a terminal.
if (has("autocmd") && !has("gui_running"))
  augroup colorset
   autocmd!
   let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
   autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

highlight Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

