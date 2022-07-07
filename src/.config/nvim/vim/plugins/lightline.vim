" +-----------+
" | Lightline |
" +-----------+

set laststatus=2
let g:lightline = {
   \ 'colorscheme': 'onedark',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'absolutepath' ], [ 'readonly', 'modified' ] ],
   \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'filetype' ] ]
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
   \ },
   \ 'component_function': {
   \   'gitbranch': 'FugitiveHead'
   \ },
   \ }


