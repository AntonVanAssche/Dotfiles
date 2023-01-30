local marp_status_ok, marp = pcall(require, "marp.nvim")
if not marp_status_ok then
    return
end

vim .api.nvim_create_autocmd(
    'BufWinEnter', {
    pattern = '*.md',
    callback = function()
        vim.api.nvim_create_user_command('MarpStart', function()
            marp.ServerStart()
        end, {})
    end
})

vim .api.nvim_create_autocmd(
    'BufWinEnter', {
    pattern = '*.md',
    callback = function()
        vim.api.nvim_create_user_command('MarpStop', function()
            marp.ServerStop()
        end, {})
    end
})
