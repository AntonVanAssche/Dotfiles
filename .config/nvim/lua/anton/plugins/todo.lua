return {
  'folke/todo-comments.nvim',
  config = function()
    local opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = ' ',
          color = 'error',
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
        },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
      gui_style = {
        fg = 'NONE',
        bg = 'BOLD',
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = '^.',
        multiline_context = 10,
        before = '',
        keyword = 'wide',
        after = 'fg',
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { 'DiagnosticError', 'ErrorMsg', '#E06C75' },
        warning = { 'DiagnosticWarn', 'WarningMsg', '#E5c07B' },
        info = { 'DiagnosticInfo', '#61AFEF' },
        hint = { 'DiagnosticHint', '#61AFEF' },
        default = { 'Identifier', '#C678DD' },
        test = { 'Identifier', '#ABB2BF' }
      },
      search = {
        command = 'rg',
        args = {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
        },
        pattern = [[\b(KEYWORDS):]],
      },
    }
    require('todo-comments').setup(opts)
  end,
  vim.keymap.set('n', ']t', function()
    require('todo-comments').jump_next()
  end, { desc = 'Next todo comment' }),

  vim.keymap.set('n', '[t', function()
    require('todo-comments').jump_prev()
  end, { desc = 'Previous todo comment' }),

  vim.keymap.set('n', '<leader>tt', '<cmd>TodoTrouble<cr>', { desc = 'Previous todo comment' }),
  vim.keymap.set('n', '<leader>tT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', { desc = 'Previous todo comment' }),
  vim.keymap.set('n', '<leader>tf', '<cmd>TodoTelescope<cr>', { desc = 'Previous todo comment' }),
}
