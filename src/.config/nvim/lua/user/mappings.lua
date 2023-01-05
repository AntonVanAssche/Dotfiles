-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- I know this doesn't makes much sense.
-- But hey it's my config, so I can do whatever I WANT. ;)
keymap('i', '<C-c>', '<Esc>')

-- Don't show help when pressing F1
-- Disables the default F1 key mapping in normal, visual and insert mode.
keymap({'n', 'v', 'i'}, '<F1>', '<Nop>', opts)

-- Get rid of the annoying yellow highlight when searching
-- by pressing <Esc> in normal mode.
keymap('n', '<Esc>', ':noh<CR>', opts)

-- Resize with h, j, k, l.
keymap('n', '<C-K>', ':resize -2<CR>', opts)
keymap('n', '<C-J>', ':resize +2<CR>', opts)
keymap('n', '<C-H>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-L>', ':vertical resize +2<CR>', opts)

-- Faster navigation.
keymap({'n', 'v'}, 'H', '10h', opts)
keymap({'n', 'v'}, 'J', '10j', opts)
keymap({'n', 'v'}, 'K', '10k', opts)
keymap({'n', 'v'}, 'L', '10l', opts)

-- Keep cursor in the middle of the screen when moving
-- half a page up or down.
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')

-- Split window navigation.
keymap('n', '<leader>h', ':wincmd h<CR>', opts)
keymap('n', '<leader>j', ':wincmd j<CR>', opts)
keymap('n', '<leader>k', ':wincmd k<CR>', opts)
keymap('n', '<leader>l', ':wincmd l<CR>', opts)

-- Keeps search terms in the middle of the screen.
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

-- Better paste
keymap('x', '<leader>p', [["_dP]])

-- Copy to systemclipboard : asbjornHaland.
keymap({'n', 'v'}, '<leader>y', [["+y]])
keymap('n', '<leader>Y', [["+Y]])

-- Delete everything behind the cursor until the end of the line.
keymap({'n', 'v'}, '<leader>d', [["_d]])

-- Reload Configuration.
keymap('n', '<leader>r', ':source $MYVIMRC<CR>', opts)

-- Toggle spellchecker.
keymap('n', '<leader>cs', ':setlocal spell! spelllang=en_us,nl<CR>', opts)

-- Run shellcheck on the current file.
keymap('n', '<leader>sc', ':!clear && shellcheck %s<CR>', opts)

-- Remove double- or single-quotes, or graves wrapped around a string.
keymap('n', '<leader>rdq', ':mmF"xf"x`m')
keymap('n', '<leader>rsq', ':mmF"xf"x`m')
keymap('n', '<leader>rg', ':mmF`xf`x`m')

-- Toggle colorcolumn. (ref functions.lua)
keymap('n', '<leader>cc', ':lua SCC()<CR>', opts)

-- Source current file. (ref: functions.lua)
-- This is useful when editing nvim config files and when developing plugins.
keymap('n', '<leader><leader>x', ':lua WSC()<CR>', opts)

-- Disable Q it's the worst place in the universe! ;)
keymap('n', 'Q', '<nop>')

-- Replace the current word.
-- Ref: https://github.com/Allaman/nvim/commit/78e32885972947240b0907df6a8a1cceea9fce19
keymap('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable.
keymap('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Stay in indent mode.
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move selected code 1 line up or down.
keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv')
keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv')
