local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

vim.cmd([[ syntax enable ]])
opt.termguicolors = true
opt.background = "dark"

opt.mouse = "a"
opt.mousemodel = "extend"

opt.conceallevel = 2

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 9999

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.pumheight = 10
opt.cmdheight = 1

opt.scrolloff = 999
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 300

opt.colorcolumn = "100"

opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.foldenable = false

opt.splitright = true
opt.splitbelow = true

vim.g.tzvt_vim_include_path = "bash"
vim.g.tzvt_vim_path_before = 0
vim.g.tzvt_vim_force_tmux_title_change = 1

-- Remeber the last cursor position. Neovim doesn't remember the cursor
-- position when you close a buffer. This is a workaround.
vim.cmd([[ au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- Clipboard support on Wayland
vim.g.clipboard = {
	name = "myClipboard",
	copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy",
	},
	paste = {
		["+"] = "wl-paste",
		["*"] = "wl-paste",
	},
	cache_enabled = 1,
}
