return {
  {
    "echasnovski/mini.align",
    opts = {
      mappings = {
        start = "",
        start_with_preview = "gA"
      }
    },
    keys = { { "gA", desc = "Align with preview", mode = { "n", "x" } } },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mapings = { -- Emulate Tpope's original mapping
        add = "ys",
        delete = "ds",
        find = "]s",
        find_left = "[s",
        highlight = "vs",
        replace = "cs",
        update_n_lines = "gsn",
      },
    },
  },
  { 
    "echasnovski/mini.operators",
    opts = {},
    keys = { "g=", "gx", "gm", "gr", "gs" } },
  {
    "mini.comment",
    enabled = not vim.fn.has("nvim-0.10")
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" }
  },
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = true
  },
  {
    "tpope/vim-sleuth",
    event = "VeryLazy"
  },
  {
    "ThePrimeagen/refactoring.nvim",
    opts = {},
    cmd = "Refactor"
  },
}
