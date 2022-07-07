" I like to orgenize my Neovim configuration by using separate files.
" This way I can keep my configuration clean and easy to maintain.

" +----------------------------+
" | Source the different files |
" +----------------------------+

source $HOME/.config/nvim/vim/user/settings.vim " vim/user settings.
source $HOME/.config/nvim/vim/user/mappings.vim " Mappings.
source $HOME/.config/nvim/vim/user/vim-plug.vim  " vim-plug.
source $HOME/.config/nvim/vim/themes/onedark.vim " OneDark theme.
" source $HOME/.config/nvim/themes/purify.vim " Purify theme.

" +----------------------------+
" | Source the plugin settings |
" +----------------------------+

source $HOME/.config/nvim/vim/plugins/copilot.vim " Copilot.
source $HOME/.config/nvim/vim/plugins/bracey.vim " Bracey.
source $HOME/.config/nvim/vim/plugins/conoline.vim " Conoline.
source $HOME/.config/nvim/vim/plugins/emmet.vim " Emmet.
source $HOME/.config/nvim/vim/plugins/lightline.vim " Lightline.
source $HOME/.config/nvim/vim/plugins/markdown.vim " Markdown.
source $HOME/.config/nvim/vim/plugins/nerdtree.vim " NerdTree.
source $HOME/.config/nvim/vim/plugins/rainbow_parentheses.vim " RainbowParentheses.
source $HOME/.config/nvim/vim/plugins/signify.vim " Signify.
source $HOME/.config/nvim/vim/plugins/tabnine.vim " TabNine.
source $HOME/.config/nvim/vim/plugins/telescope.vim " Telescope.

" +--------------------+
" | Load the Lua files |
" +--------------------+

autocmd VimEnter * lua require("user/plug-colorizer")
" autocmd VimEnter * lua require("user/lualine")
autocmd vimEnter * lua require("user/commenter")

