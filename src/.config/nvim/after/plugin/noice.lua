local noice_status_ok, noice = pcall(require, 'noice')
if not noice_status_ok then
    return
end

noice.setup {
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
}

vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIconCmdline", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#61afef" })
