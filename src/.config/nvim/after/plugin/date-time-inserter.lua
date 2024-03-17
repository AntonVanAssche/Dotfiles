local date_time_inserter_status_ok, date_time_inserter = pcall(require, "date-time-inserter")
if not date_time_inserter_status_ok then
    date_time_inserter = {}
end

date_time_inserter.setup {
    date_format = 'DDMMYYYY',               -- Arange the letter in the order you want the date to appear.
    time_format = 24,                       -- 12 or 24.
    show_seconds = false,                   -- true or false.

    date_separator = '-',                   -- Character to separate the date.
}

vim.keymap.set("n", "<leader>dt", "<cmd>InsertDate<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>InsertTime<cr>")
vim.keymap.set("n", "<leader>dtt", "<cmd>InsertDateTime<cr>")
vim.keymap.set("i", "<M-;>", "<cmd>InsertDateTime<cr>")
