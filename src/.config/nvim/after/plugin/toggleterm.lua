local toggle_term_status_ok, toggle_term = pcall(require, "toggleterm")
if not toggle_term_status_ok then
    return
end

toggle_term.setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = false,
    direction = "float",
    float_opts = {
        border = "rounded",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
    winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
        return term.name
    end
    },
}
