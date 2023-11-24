local opt = vim.opt

opt.fileencoding = 'utf-8'
opt.encoding = 'utf-8'

vim.cmd [[ syntax enable ]]
opt.termguicolors = true
opt.background = 'dark'

opt.pumheight = 10
opt.cmdheight = 1

opt.mouse = 'a'
opt.mousemodel = 'extend'

opt.updatetime = 300

opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.showmode = false
opt.timeoutlen = 500
opt.wildmode = {'longest', 'list', 'full'}

opt.hidden = true
opt.history = 10000
opt.undolevels = 3000
opt.swapfile = false
opt.backup = false

local home_dir = os.getenv( "HOME" )
if home_dir then
    opt.undodir = home_dir .. '/.config/nvim/undos'
end

opt.undofile = true

opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.scrolloff = 999

-- Reference of the values:
--   Ps = 0  -> blinking block.
--   Ps = 1  -> blinking block (default).
--   Ps = 2  -> steady block.
--   Ps = 3  -> blinking underline.
--   Ps = 4  -> steady underline.
--   Ps = 5  -> blinking bar.
--   Ps = 6  -> steady bar.
vim.api.nvim_set_option('t_SI', '\\e[5 q')
vim.api.nvim_set_option('t_EI', '\\e[2 q')
-- opt.ruled = true
opt.cursorline = true
opt.signcolumn = 'yes'


opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Remeber the last cursor position. Neovim doesn't remember the cursor
-- position when you close a buffer. This is a workaround.
vim.cmd [[ au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

-- Clipboard support on Wayland
vim.g.clipboard = {
    name = 'myClipboard',
    copy = {
        ['+'] = 'wl-copy',
        ['*'] = 'wl-copy',
    },
    paste = {
        ['+'] = 'wl-paste',
        ['*'] = 'wl-paste',
    },
    cache_enabled = 1,
}

-- Clipboard support on X11
-- vim.g.clipboard = {
--     name = 'myClipboard',
--     copy = {
--         ['+'] = 'xsel',
--         ['*'] = 'xsel',
--     },
--     paste = {
--         ['+'] = 'xsel',
--         ['*'] = 'xsel',
--     },
--     cache_enabled = 1,
-- }
