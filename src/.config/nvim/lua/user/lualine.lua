-- +---------+
-- | Lualine |
-- +---------+

require('lualine').setup {
   options = {
      icons_enabled = true,                                                    -- Enable icons.
      theme = 'onedark',                                                       -- LuaLine theme.
      section_separators = '',                                                 -- Disable section separators.
      component_separators = '',                                               -- Disable component separators.
      disabled_filetypes = {},
      always_divide_middle = true,                                             -- Always divide the middle of a line.
      globalstatus = false,                                                    -- Disable global status.
   },
   sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
   },
      inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
   },
   tabline = {},
   extensions = {}
}

