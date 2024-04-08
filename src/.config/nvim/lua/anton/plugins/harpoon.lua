return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local keymap = vim.keymap

    harpoon.setup()

    keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    keymap.set("n", "<leader>d", function() harpoon:list():remove() end)
    keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
    keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
    keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
    keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
    keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)

    keymap.set("n", "<M-S-P>", function() harpoon:list():prev() end)
    keymap.set("n", "<M-S-N>", function() harpoon:list():next() end)
  end,
}
