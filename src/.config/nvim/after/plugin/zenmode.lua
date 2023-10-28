local zenmode_status_ok, zenmmode = pcall(require, 'zen-mode')
if not zenmode_status_ok then
  return
end

zenmmode.setup {
    window = {
        width = 110,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle({
        window = {
            width = 110,
            options = {
                number = true,
                relativenumber = true,
            }
        },
    })
    vim.wo.wrap = false
end)
