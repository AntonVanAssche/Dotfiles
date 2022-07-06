" +----------+
" | init.vim |
" +----------+

" I like to orgenize my Neovim configuration by using separate files.
" This way I can keep my configuration clean and easy to maintain.

" +----------------------------+
" | Source the different files |
" +----------------------------+

source $HOME/.config/nvim/general/settings.vim " General settings.
source $HOME/.config/nvim/general/mappings.vim " Mappings.
source $HOME/.config/nvim/general/vim-plug.vim  " vim-plug.
source $HOME/.config/nvim/themes/onedark.vim " OneDark theme.
" source $HOME/.config/nvim/themes/purify.vim " Purify theme.

" +----------------------------+
" | Source the plugin settings |
" +----------------------------+

source $HOME/.config/nvim/plugins-config/lightline.vim " Lightline.
source $HOME/.config/nvim/plugins-config/Commenter.vim " Commenter.
source $HOME/.config/nvim/plugins-config/copilot.vim " Copilot.
source $HOME/.config/nvim/plugins-config/bracey.vim " Bracey.
source $HOME/.config/nvim/plugins-config/conoline.vim " Conoline.
source $HOME/.config/nvim/plugins-config/emmet.vim " Emmet.
source $HOME/.config/nvim/plugins-config/markdown.vim " Markdown.
source $HOME/.config/nvim/plugins-config/nerdtree.vim " NerdTree.
source $HOME/.config/nvim/plugins-config/rainbow_parentheses.vim " RainbowParentheses.
source $HOME/.config/nvim/plugins-config/signify.vim " Signify.
source $HOME/.config/nvim/plugins-config/tabnine.vim " TabNine.
source $HOME/.config/nvim/plugins-config/telescope.vim " Telescope.

" +--------------------+
" | Load the Lua files |
" +--------------------+

autocmd VimEnter * lua require("plug-colorizer")

