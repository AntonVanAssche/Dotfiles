return {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'dark',
      transparent = true,
      term_colors = true,
      lualine = {
        transparent = true,
      },
    }

    vim.cmd.colorscheme('onedark')
  end,
}
