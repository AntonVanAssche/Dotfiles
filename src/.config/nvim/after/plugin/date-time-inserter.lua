local date_time_inserter_status_ok, date_time_inserter = pcall(require, "date-time-inserter")
if not date_time_inserter_status_ok then
    date_time_inserter = {}
end

local keymap = vim.keymap.set
local opts = {
    noremap = true,
    silent = true,
}

date_time_inserter.setup {
    date_format = 'DDMMYYYY', -- Arange the letter in the order you want the date to appear.
    time_format = 24,         -- 12 or 24.
    show_seconds = false,     -- true or false.

    date_separator = '-',     -- Character to separate the date.
}

keymap('n', '<leader>dt', date_time_inserter.insert_date, opts)
keymap('n', '<leader>tt', date_time_inserter.insert_time, opts)
