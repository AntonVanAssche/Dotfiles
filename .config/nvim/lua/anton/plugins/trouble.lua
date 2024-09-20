return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup({})

      vim.keymap.set('n', '<leader>td', function()
        require('trouble').toggle('diagnostics')
      end)

      vim.keymap.set('n', '<leader>tq', function()
        require('trouble').toggle('quickfix')
      end)

      vim.keymap.set('n', ']g', function()
        require('trouble').next({ skip_groups = true, jump = true });
      end)

      vim.keymap.set('n', '[g', function()
        require('trouble').prev({ skip_groups = true, jump = true });
      end)
    end
  },
}
