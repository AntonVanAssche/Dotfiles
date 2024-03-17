local indent_blankline_status_ok, indent_blankline = pcall(require, "ibl")
if not indent_blankline_status_ok then
    return
end

indent_blankline.setup()

vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
   "help",
   "NvimTree",
}
vim.g.show_current_context = true
