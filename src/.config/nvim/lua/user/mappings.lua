-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Don't show help when pressing F1
-- Disables the default F1 key mapping in normal, visual and insert mode.
keymap({"n", "v", "i"}, "<F1>", "<Nop>", opts)

-- Resize with h, j, k, l.
keymap("n", "<C-K>", ":resize -2<CR>", opts)
keymap("n", "<C-J>", ":resize +2<CR>", opts)
keymap("n", "<C-H>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-L>", ":vertical resize +2<CR>", opts)

-- Faster navigation.
keymap({"n", "v"}, "H", "10h", opts)
keymap({"n", "v"}, "J", "10j", opts)
keymap({"n", "v"}, "K", "10k", opts)
keymap({"n", "v"}, "L", "10l", opts)

-- Keep cursor in the middle of the screen when moving
-- half a page up or down
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Split window navigation
keymap("n", "<leader>h", ":wincmd h<CR>", opts)
keymap("n", "<leader>j", ":wincmd j<CR>", opts)
keymap("n", "<leader>k", ":wincmd k<CR>", opts)
keymap("n", "<leader>l", ":wincmd l<CR>", opts)

-- Keeps search terms in the middle of the screen
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Better paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to systemclipboard : asbjornHaland.
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete everything behind the cursor until the end of the line.
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

keymap("n", "<leader>r", ":source $MYVIMRC<CR>", opts)

-- Toggle spellchecker
keymap("n", "<leader>cs", ":setlocal spell! spelllang=en_us<CR>", opts)

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
keymap("n", "<leader>date", ':r! date "+\\%d-\\%m-\\%Y" <CR>', opts)
keymap("n", "<leader>time", ':r! date "+\\%H:\\%M:\\%S" <CR>', opts)

-- Toggle colorcolumn
-- keymap("n", "<leader>cc", ":call ToggleColorcolumn()<CR>", opts)
keymap("n",
    "<leader>cc",
    function()
        local value = vim.api.nvim_get_option_value("colorcolumn", {})
        if value == "0" then
            vim.api.nvim_set_option_value("colorcolumn", "80", {})
            vim.cmd [[highlight colorcolumn guibg=#E06C75]]
        else
            vim.api.nvim_set_option_value("colorcolumn", "0", {})
        end
    end,
    { silent = true }
)

-- Disable Q it's the worst place in the universe ;)
keymap("n", "Q", "<nop>")

-- Replace the current word
-- Ref: https://github.com/Allaman/nvim/commit/78e32885972947240b0907df6a8a1cceea9fce19
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected code 1 line up or down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

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
