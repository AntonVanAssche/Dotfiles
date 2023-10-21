-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Set keymap
keymap('n', '<leader>mdh', ':MarkdownHeaders<CR>', opts)
keymap('n', '<leader>mdhc', ':MarkdownHeadersClosest<CR>', opts)

do
    vim.cmd [[
        highlight! MarkdownHeadersTitle guifg=#61afef
        highlight! MarkdownHeadersBorder guifg=#61afef
    ]]
end
