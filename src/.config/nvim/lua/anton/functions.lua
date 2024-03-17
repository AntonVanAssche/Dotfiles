-- Print the human-readable representation of the given object.
-- e.g. :lua P(require("date-time-inserter"))
-- @param obj The object to print.
P = function(obj)
    print(vim.inspect(obj))
    return obj
end

-- Sort the selected lines in ascending order
-- and replace the selection with the result.
-- SL: Sort Lines
SL = function()
    -- Get the current selection.
    local visual_mode = vim.api.nvim_eval("visualmode()")

    if visual_mode ~= "" then
        -- Get the start and end line numbers of the selection
        local start_line = vim.api.nvim_eval("getpos(\"'<\")")[2] - 1
        local end_line = vim.api.nvim_eval("getpos(\"'>\")")[2]

        -- Get the lines from the current buffer
        local buffer = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_get_lines(buffer, start_line, end_line, false)


        -- Sort the lines.
        print(vim.inspect(lines))
        table.sort(lines, function(a, b) return a < b end)

        -- Replace the selection with the result.
        vim.api.nvim_buf_set_lines(buffer, start_line, end_line, false, lines)
    end
end

-- Toggle the colorcolumn on the 100th column.
-- SCC: Show ColorColumn
SCC = function()
    local value = vim.api.nvim_get_option_value("colorcolumn", {})
    if value == "0" then
        vim.api.nvim_set_option_value("colorcolumn", "100", {})
        vim.cmd [[highlight colorcolumn guibg=#E06C75]]
    else
        vim.api.nvim_set_option_value("colorcolumn", "0", {})
    end
end

-- Write and source the current file.
-- WSC: Write Source Current
WSC = function()
    vim.api.nvim_command('write')
    local current_file = vim.fn.expand('%')
    vim.api.nvim_command('source ' .. current_file)
end
