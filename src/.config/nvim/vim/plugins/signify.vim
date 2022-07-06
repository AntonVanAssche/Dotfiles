" +---------+
" | Signify |
" +---------+

" SIGNS
" `+`     This line was added.
" `!`     This line was modified.
" `_1`    The number of deleted lines below this sign. If the number is larger
" `99`    than 9, the `_` will be omitted. For numbers larger than 99, `_>`
" `_>`    will be shown instead.
" `!1`    This line was modified and the lines below were deleted.
" `!>`    It is a combination of `!` and `_`. If the number is larger than 9,
"         `!>` will be shown instead.
" `‾`     The first line was removed. It's a special case of the `_` sign.

" See |g:signify_sign_add| on how to use different signs.

" Change some signs.
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" Disable the numbers.
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" If want colors, uncomment the following lines.
" highlight SignifySignAdd                  guifg=#ABB2BF guibg=#98C379
" highlight SignifySignDelete ctermfg=black guifg=#ABB2BF guibg=#E06C75
" highlight SignifySignChange ctermfg=black guifg=#ABB2BF guibg=#E5C07B
"
