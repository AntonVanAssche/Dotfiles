vim.o.list = true

if not vim.g.loaded_cyclist then
    return
end

vim.call("cyclist#add_listchar_option_set", "limited", {
    eol = '↲',
    tab = '»',
    trail = '·',
    extends = '<',
    precedes = '>',
    conceal = '┊',
    nbsp = '␣',
})

vim.call("cyclist#add_listchar_option_set", "busy", {
    eol = '↲',
    tab = '»',
    space = '␣',
    trail = '-',
    extends = '☛',
    precedes = '☚',
    conceal = '┊',
    nbsp = '☠',
})

vim.keymap.set("n", "<leader>cl", "CyclistNext<CR>", { noremap = true, silent = true})
