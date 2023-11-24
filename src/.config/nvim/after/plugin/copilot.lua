require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Toggle Copilot
keymap('n', '<leader>tc', '<cmd>lua require("copilot.suggestion").toggle_auto_trigger()<CR>', opts)
