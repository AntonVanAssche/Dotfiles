local harpoon_ok, harpoon = pcall(require, "harpoon")
if not harpoon_ok then
    return
end

harpoon.setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)

vim.keymap.set("n", "<M-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<M-S-N>", function() harpoon:list():next() end)
