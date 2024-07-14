return {
  "alexghergh/nvim-tmux-navigation",
  opts = {
    disable_when_zoomed = true, -- defaults to false
  },
  lazy = true,
  cmd = {
    "NvimTmuxNavigateLeft",
    "NvimTmuxNavigateDown",
    "NvimTmuxNavigateUp",
    "NvimTmuxNavigateRight",
    "NvimTmuxNavigateLastActive",
    "NvimTmuxNavigateNext",
  },
  keys = {
    {
      "<C-h>",
      "<cmd>NvimTmuxNavigateLeft<cr>",
      desc = "Move one nvim/tmux pane to the left",
    },
    {
      "<C-j>",
      "<cmd>NvimTmuxNavigateDown<cr>",
      desc = "Move one nvim/tmux pane down",
    },
    {
      "<C-k>",
      "<cmd>NvimTmuxNavigateUp<cr>",
      desc = "Move one nvim/tmux pane up",
    },
    {
      "<C-l>",
      "<cmd>NvimTmuxNavigateRight<cr>",
      desc = "Move one nvim/tmux pane to the right",
    },
    {
      "<C-\\>",
      "<cmd>NvimTmuxNavigateLastActive<cr>",
      desc = "Move to the last active nvim/tmux pane",
    },
    {
      "<C-Space>",
      "<cmd>NvimTmuxNavigateNext<cr>",
      desc = "Move to the next nvim/tmux pane",
    },
  },
}
