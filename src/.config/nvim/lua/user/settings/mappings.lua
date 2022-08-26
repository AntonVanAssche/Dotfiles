-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-K>", ":resize -2<CR>", opts)
keymap("n", "<C-J>", ":resize +2<CR>", opts)
keymap("n", "<C-H>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-L>", ":vertical resize +2<CR>", opts)

-- Faster navigation
keymap("n", "H", "10h", opts)
keymap("n", "J", "10j", opts)
keymap("n", "K", "10k", opts)
keymap("n", "L", "10l", opts)
keymap("v", "H", "10h", opts)
keymap("v", "J", "10j", opts)
keymap("v", "K", "10k", opts)
keymap("v", "L", "10l", opts)

-- Split window navigation
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

keymap("n", "<leader>r", ":source $MYVIMRC<CR>", opts)

-- Toggle spellchecker
keymap("n", "<leader>cs", ":setlocal spell! spelllang=en_us<CR>", opts)

-- Fast quit
keymap("n", "<leader>x", ":x<CR>", opts)

-- Run shellcheck on the current file
keymap("n", "<leader>sc", ":!clear && shellcheck %s<CR>", opts)

-- Remove double- or single-quotes, or graves wrapped around a string
keymap("n", "<leader>rdq", ':mmF"xf"x`m')
keymap("n", "<leader>rsq", ":mmF'xf'x`m")
keymap("n", "<leader>rg", ":mmF`xf`x`m")

-- Move the current line up or down
keymap("n", "<A-k>", ":move +1<CR>", opts)
keymap("n", "<A-j>", ":move -2<CR>", opts)

-- Place timestamps, be it date (DD-MM-YYYY) or time (HH:MM:SS)
keymap("n", "<leader>date", ":=strftime('%d-%m-%Y')<CR>", opts)
keymap("n", "<leader>time", ":=strftime('%H:%M:%S')<CR>", opts)

-- Toggle between paste and insert mode
vim.cmd('set pastetoggle=<leader>p')

-- Open a terminal on the right side of the screen
-- keymap("n", "<leader>t", ":vsplit tjrm://bash<CR>", opts)

-- Toggle colorcolumn
keymap("n", "<leader>cc", ":call ToggleColorcolumn()<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
