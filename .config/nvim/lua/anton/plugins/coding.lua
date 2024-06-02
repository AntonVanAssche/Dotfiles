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
  {
    "folke/todo-comments.nvim",
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#E06C75" },
        warning = { "DiagnosticWarn", "WarningMsg", "#E5c07B" },
        info = { "DiagnosticInfo", "#61AFEF" },
        hint = { "DiagnosticHint", "#61AFEF" },
        default = { "Identifier", "#C678DD" },
        test = { "Identifier", "#ABB2BF" }
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    }
  },
}
