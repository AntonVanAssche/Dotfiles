return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local tmux = require("nvim-tmux-navigation")
    tmux.setup({
      disable_when_zoomed = true -- defaults to false
    })

    local keymap = vim.keymap
    keymap.set('n', "<C-h>", tmux.NvimTmuxNavigateLeft)
    keymap.set('n', "<C-j>", tmux.NvimTmuxNavigateDown)
    keymap.set('n', "<C-k>", tmux.NvimTmuxNavigateUp)
    keymap.set('n', "<C-l>", tmux.NvimTmuxNavigateRight)
    keymap.set('n', "<C-\\>", tmux.NvimTmuxNavigateLastActive)
    keymap.set('n', "<C-Space>", tmux.NvimTmuxNavigateNext)
  end,
}
