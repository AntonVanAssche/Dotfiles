-- I like to orgenize my Neovim configuration by using separate files.
-- This way I can keep my configuration clean and easy to maintain.

-- Load the settings.
require "user.settings.plugins"
require "user.settings.settings"
require "user.settings.mappings"

-- Load the themes. (Uncomment your preferred theme.)
require "user.themes.onedark"
-- require "user.themes.purify"

-- Load the plugin settings. (Configured using Lua)
require "user.plugins.autopairs"
require "user.plugins.comment"
require "user.plugins.copilot"
require "user.plugins.gitsigns"
require "user.plugins.impatient"
require "user.plugins.indentline"
require "user.plugins.nvim-cmp"
require "user.plugins.nvim-tree"
require "user.plugins.telescope"
require "user.plugins.toggleterm"
require "user.plugins.lualine"
require "user.plugins.treesitter"

-- Load the plugin settings. (Configured using vimscript)
require "user.plugins.vimscript"

-- LSP
require "user.lsp"

