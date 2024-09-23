return {
  -- 'navarasu/onedark.nvim',
  -- priority = 1000,
  -- config = function()
  --   require('onedark').setup {
  --     style = 'dark',
  --     transparent = true,
  --     term_colors = true,
  --     lualine = {
  --       transparent = true,
  --     },
  --   }
  --
  --   vim.cmd.colorscheme('onedark')
  -- end,
  {
    "norcalli/nvim-colorizer.lua",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        olor_overrides = {
          mocha = {
            base = "#11111b",
            mantle = "#11111b",
          },
        },
        custom_highlights = function(colors)
          return {
            WinSeparator = {
              fg = colors.lavender,
            },
          }
        end,
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = false,
        integrations = {
          cmp = true,
          harpoon = true,
          gitsigns = true,
          lsp_trouble = true,
          mini = {
            mason = true,
            enabled = true,
            indentscope_color = "",
          },
          notify = true,
          nvimtree = true,
          telescope = {
            enabled = true,
          },
          treesitter = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
