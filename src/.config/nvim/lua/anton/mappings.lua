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

-- Faster navigation.
keymap({'n', 'v'}, 'H', '10h', opts)
keymap({'n', 'v'}, 'J', '10j', opts)
keymap({'n', 'v'}, 'K', '10k', opts)
keymap({'n', 'v'}, 'L', '10l', opts)

-- Keep cursor in the middle of the screen when moving
-- half a page up or down.
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')

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

-- Reload Configuration
keymap('n', '<leader>r', ':source $MYVIMRC<CR>', opts)

-- Spellchecker
keymap('n', '<leader>cs', ':setlocal spell! spelllang=en_us,nl<CR>', opts)

-- Shellcheck
keymap('n', '<leader>sc', ':!clear && shellcheck %s<CR>', opts)

-- Toggle colorcolumn
keymap('n', '<leader>cc', ':lua SCC()<CR>', opts)

-- Source current file. (ref: functions.lua)
-- This is useful when editing nvim config files and when developing plugins.
keymap('n', '<leader><leader>x', ':lua WSC()<CR>', opts)

-- Disable Q it's the worst place in the universe! ;)
keymap('n', 'Q', '<nop>')

-- Replace the current word
-- Ref: https://github.com/Allaman/nvim/commit/78e32885972947240b0907df6a8a1cceea9fce19
keymap('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move selected code 1 line up or down
keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv')
keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv')

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)

-- Resize window
keymap("n", "<C-w><left>", "<C-w><")
keymap("n", "<C-w><right>", "<C-w>>")
keymap("n", "<C-w><up>", "<C-w>+")
keymap("n", "<C-w><down>", "<C-w>-")

-- Terraform
keymap("n", "<leader>ti", ":!terraform init<CR>", opts)
keymap("n", "<leader>tv", ":!terraform validate<CR>", opts)
keymap("n", "<leader>tp", ":!terraform plan<CR>", opts)
keymap("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", opts)
