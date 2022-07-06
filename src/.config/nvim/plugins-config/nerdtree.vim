" +----------+
" | nerdTREE |
" +----------+

let NERDTreeShowHidden=1 " Show hidden files in NERDTree
let NERDTreeShowLineNumbers=1 " Show line numbers.
let g:NERDTreeDirArrowExpandable = '' " Quick and dirty way to hide the arrow in the directory tree.
let g:NERDTreeDirArrowCollapsible = '' " Quick and dirty way to hide the arrow in the directory tree.

" autocmd VimEnter * NERDTree | wincmd p " Start NERDTree and put the cursor back in the other window. 
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif " Open the existing NERDTree on each new tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " Close the NERDTree if it's the only tab.
