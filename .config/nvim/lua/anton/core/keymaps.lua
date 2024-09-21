local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap.set({ "n", "v", "i" }, "<F1>", "<Nop>", { desc = "Don't show help when pressing F1", silent = true })
keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode", silent = true })

keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlights", silent = true })

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk", silent = true })

keymap.set("n", "<M-o>", "o<ESC>", { desc = "Insert a new line down in normal mode", silent = true })

keymap.set({ "n", "v" }, "H", "10h", { desc = "Move 10 lines left", silent = true })
keymap.set({ "n", "v" }, "J", "10j", { desc = "Move 10 lines up", silent = true })
keymap.set({ "n", "v" }, "K", "10k", { desc = "Move 10 lines down", silent = true })
keymap.set({ "n", "v" }, "L", "10l", { desc = "Move 10 lines right", silent = true })

keymap.set(
  "n",
  "<C-d>",
  "<C-d>zz",
  { desc = "Keep cursor in the middle of the screen when moving half a page up or down", silent = true }
)
keymap.set(
  "n",
  "<C-u>",
  "<C-u>zz",
  { desc = "Keep cursor in the middle of the screen when moving half a page up or down", silent = true }
)

keymap.set("n", "n", "nzzzv", { desc = "Keeps search terms in the middle of the screen", silent = true })
keymap.set("n", "N", "Nzzzv", { desc = "Keeps search terms in the middle of the screen", silent = true })

keymap.set("x", "<leader>p", [["_dP]], { desc = "Better paste", silent = true })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to systemclipboard", silent = true })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to systemclipboard", silent = true })
keymap.set(
  "n",
  "<leader>cs",
  ":setlocal spell! spelllang=en_us,nl<CR>",
  { desc = "Toggle spellchecker", silent = true }
)

keymap.set("n", "<leader><leader>x", ":lua WSC()<CR>", { desc = "Source current file", silent = true })

keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace word under cursor", silent = true }
)
keymap.set("v", "<", "<gv", { desc = "Stay in indent mode", silent = true })
keymap.set("v", ">", ">gv", { desc = "Stay in indent mode", silent = true })

keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up", silent = true })
keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down", silent = true })

keymap.set("n", "+", "<C-a>", { desc = "Increment number under cursor", silent = true })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number under cursor", silent = true })

keymap.set("n", "ss", ":split<Return>", { desc = "Split window horizontally", silent = true })
keymap.set("n", "sv", ":vsplit<Return>", { desc = "Split window vertically", silent = true })

keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

keymap.set("n", "<C-n>", ":cnext<CR>", { desc = "Move to next file within the quickfix list" })
keymap.set("n", "<C-p>", ":cprev<CR>", { desc = "Move to previous file within the quickfix list" })

keymap.set("n", "<M-L>", ":vertical resize -5<CR>", { desc = "Resize window left", silent = true })
keymap.set("n", "<M-J>", ":resize +5<CR>", { desc = "Resize window down", silent = true })
keymap.set("n", "<M-K>", ":resize -5<CR>", { desc = "Resize window up", silent = true })
keymap.set("n", "<M-H>", ":vertical resize +5<CR>", { desc = "Resize window right", silent = true })
