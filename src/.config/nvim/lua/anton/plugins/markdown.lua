return {
  {
    "AntonVanAssche/date-time-inserter.nvim",
    opts = {
      date_format = 'DDMMYYYY',   -- Arange the letter in the order you want the date to appear.
      time_format = 24,           -- 12 or 24.
      show_seconds = false,       -- true or false.

      date_separator = '-',       -- Character to separate the date.
    },
    keys = {
      { "<leader>dt", "<cmd>InsertDate<CR>", desc = "Insert date" },
      { "<leader>tt", "<cmd>InsertTime<CR>", desc = "Insert time" },
      { "<leader>dtt", "<cmd>InsertDateTime<CR>", desc = "Insert date and time" },
    },
  },
  {
    "AntonVanAssche/md-headers.nvim",
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('md-headers').setup({
        width = 60,
        height = 10,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        popup_auto_close = true -- or false
      })

      local keymap = vim.keymap
      keymap.set('n', '<leader>mdh', ':MarkdownHeaders<CR>', { silent = true })
      keymap.set('n', '<leader>mdhc', ':MarkdownHeadersClosest<CR>', { silent = true })

      vim.api.nvim_set_hl(0, "MarkdownHeadersBorder", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "MarkdownHeadersTitle", { fg = "#61afef" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm instal",
  }
}
