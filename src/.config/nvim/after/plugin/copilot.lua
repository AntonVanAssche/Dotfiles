vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Unmap <Tab> with iunmap
vim.keymap.del('i', '<Tab>')

-- Function to toggle Copilot on and off
function _G.toggle_copilot()
    if vim.g.copilot_enabled then
        vim.g.copilot_enabled = false
    else
        vim.g.copilot_enabled = true
    end
    vim.cmd('Copilot status')
end

-- Key mappings
vim.api.nvim_set_keymap("n", "<leader>tc", ":lua toggle_copilot()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>dn", ":lua require('copilot').next()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>cp", ":lua require('copilot').prev()<CR>", {noremap = true})

-- Disable Copilot by default
vim.g.copilot_enabled = false
