-- I like to orgenize my Neovim configuration by using separate files.
-- This way I can keep my configuration clean and easy to maintain.

-- Load the settings.
require "user.settings"

-- Load my preffered colorsheme. (Uncomment your preferred theme.)
require "user.themes.onedark"
-- require "user.themes.purify"

-- Plugins
require "user.plugins"

-- LSP
require "user.lsp"

