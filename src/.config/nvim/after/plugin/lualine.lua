local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
    return
end

local git_blame_status_ok, git_blame = pcall(require, "gitblame")
if not git_blame_status_ok then
    return
end
vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_date_format = '%r'

lualine.setup {
    options = {
        theme = "onedark",
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch', { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { { 'filename', separator = { left = '' }, right_padding = 2 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
    },
    tabline = {},
    extensions = {},
}
