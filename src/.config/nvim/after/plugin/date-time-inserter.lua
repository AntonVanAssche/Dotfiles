local date_time_inserter_status_ok, date_time_inserter = pcall(require, "date-time-inserter")
if not date_time_inserter_status_ok then
    date_time_inserter = {}
end

date_time_inserter.setup {
    date_format = 'DDMMYYYY',               -- Arange the letter in the order you want the date to appear.
    time_format = 24,                       -- 12 or 24.
    show_seconds = false,                    -- true or false.

    date_separator = '-',                   -- Character to separate the date.

    insert_date_map = '<leader>dt',         -- Keymap to insert the date in normal mode.
    insert_time_map = '<leader>tt',         -- Keymap to insert the time in normal mode.
    insert_date_time_map = '<leader>dtt',   -- Keymap to insert the date and time in normal mode.

}
