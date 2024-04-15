return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup {
        style = "dark",
        transparent = true,
        term_colors = true,
        lualine = {
          transparent = true,
        },
      }

      vim.cmd.colorscheme("onedark")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")
      lualine.setup {
        options = {
          theme = "onedark",
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = { 'filename', 'branch' },
          lualine_c = { 'fileformat' },
          lualine_x = {},
          lualine_y = { 'filetype', 'progress' },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { { 'filename', separator = { left = '' }, right_padding = 2 } },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "fade_in_slide_out",
        on_open = nil,
        on_close = nil,
        render = "default",
        timeout = 175,
        background_colour = "#202020",
        minimum_width = 10,
        icons = {
          ERROR = '',
          WARN = '',
          INFO = '',
          DEBUG = '',
          TRACE = '',
        },
      })

      vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "NotifyWARNBorder",  { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "NotifyINFOBorder",  { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#ABB2BF" })
      vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "NotifyERRORIcon",   { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "NotifyWARNIcon",    { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "NotifyINFOIcon",    { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "NotifyDEBUGIcon",   { fg = "#ABB2BF" })
      vim.api.nvim_set_hl(0, "NotifyTRACEIcon",   { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "NotifyERRORTitle",  { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "NotifyWARNTitle",   { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "NotifyINFOTitle",   { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "NotifyDEBUGTitle",  { fg = "#ABB2BF" })
      vim.api.nvim_set_hl(0, "NotifyTRACETitle",  { fg = "#C678DD" })
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local noice = require("noice")
      noice.setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })

      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle",  { fg = "#e06c75" })
      vim.api.nvim_set_hl(0, "NoiceCmdlineIconCmdline", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#61afef" })
    end,
  },
  {
	"folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    opts = {
      plugins = {
	    gitsigns = true,
        tmux = true,
      },
      window = {
        width = 110,
        options = {
          number = true,
          relativenumber = true,
        }
      },
    },
  },
  {
    "miyakogi/conoline.vim",
    config = function()
      local g = vim.g
      g.conoline_auto_enable = 1                        -- Enable Conoline automatically.
      g.conoline_use_colorscheme_default_normal=1       -- Use the default colorscheme for normal mode.
      g.conoline_use_colorscheme_default_insert=1       -- Use the default colorscheme for insert mode.
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local ibl = require("ibl")
      ibl.setup()

      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
      vim.g.indent_blankline_filetype_exclude = {
       "help",
       "NvimTree",
      }
      vim.g.show_current_context = true
    end,
  },
  {
    "AntonVanAssche/cyclist.vim",
  },
  {
    "letieu/btw.nvim",
    config = function()
      require('btw').setup()
    end,
  },
}
