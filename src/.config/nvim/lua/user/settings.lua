local opt = vim.opt                         -- Just so we can use opt instead of vim.opt.
                                            -- I don;t want to type vim.opt all the time.
                                            -- I know I'm lazy! ;)

opt.fileencoding = 'utf-8'                  -- The encoding written to file.
opt.encoding = 'utf-8'                      -- The encoding displayed.

vim.cmd [[ syntax enable ]]                 -- Enables syntax highlighing.
opt.termguicolors = true                    -- Enables colors in terminal.
opt.background = 'dark'                     -- Tell vim what the background color looks like.

opt.pumheight = 10                          -- Makes popup menu smaller.
opt.cmdheight = 2                           -- More space for displaying messages.

opt.mouse = 'a'                             -- Enables mouse support.

opt.updatetime = 300                        -- Faster completion.

opt.wrap = false                            -- Display long lines as just one line.
opt.number = true                           -- Line numbers.
opt.relativenumber = true                   -- Relative line numbers.
opt.splitright = true                       -- Vertical splits will automatically be to the right.
opt.splitbelow = true                       -- Horizontal splits will automatically be below.
opt.showmode = false                        -- We don't need to see things like -- INSERT -- anymore.
opt.timeoutlen = 500                        -- By default timeoutlen is 1000 ms.
opt.wildmode = {'longest', 'list', 'full'}  -- Command-line completion mode.

opt.hidden = true                           -- Required to keep multiple buffers open multiple buffers.
opt.history = 10000                         -- More history.
opt.undolevels = 3000                       -- Higher undo level.
opt.swapfile = false                        -- Don't use a swapfile. I don't like to have them in a project directory.
opt.backup = false                          -- Don't create a backup file.
opt.undodir = '~/.config/nvim/undos'        -- Set the undo directory.
opt.undofile = true                         -- Enable persistent undo.

-- Allows to CTRL+C in other programs and put in Vim with p and yanking in Vim with y and CTRL+V in other programs.
-- https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
-- opt.clipboard = 'unnamedplus'

opt.softtabstop = 4                         -- Number of spaces in a tab when editing.
opt.tabstop = 4                             -- Insert 4 spaces for a tab.
opt.shiftwidth = 4                          -- Change the number of space characters inserted for indentation.
opt.expandtab = true                        -- Converts tabs to spaces.
opt.smartindent = true                      -- Makes indenting smarter.
opt.autoindent = true                       -- Good auto indent.
opt.scrolloff = 999                         -- Simple trick to keep the cursor centered when scrolling.

-- Reference of the values:
--   Ps = 0  -> blinking block.
--   Ps = 1  -> blinking block (default).
--   Ps = 2  -> steady block.
--   Ps = 3  -> blinking underline.
--   Ps = 4  -> steady underline.
--   Ps = 5  -> blinking bar.
--   Ps = 6  -> steady bar.
vim.api.nvim_set_option('t_SI', '\\e[5 q')  -- Set the cursor to a line shape.
vim.api.nvim_set_option('t_EI', '\\e[2 q')  -- Set the cursor to a block shape.
-- opt.ruled = true                            -- Show the cursor position all the time.
opt.cursorline = true                       -- Enable highlighting of the current line.
opt.signcolumn = 'yes'                      -- Always show the signcolumn, otherwise it would shift the text each time.
                                            -- This is needed for the ToggleColorColumn function in my mappings (<leader>cc).

opt.ignorecase = true                       -- Ignore case when searching.
opt.smartcase = true                        -- Smart case.
opt.incsearch = true                        -- Show where the search matches as you type.
opt.hlsearch = true                         -- Highlight all matches on previous search pattern.

-- Remeber the last cursor position. Neovim doesn't remember the cursor
-- position when you close a buffer. This is a workaround.
vim.cmd [[ au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

-- The characters shown when `<leader>list` (`set list`) is used.
opt.listchars = {
  tab = '»·',
  trail = '·',
  extends = '»',
  precedes = '«',
  nbsp = '␣',
}
