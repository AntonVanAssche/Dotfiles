-- Skeleton files.
-- TOTALLY NOT STOLEN FROM https://github.com/lars-vc/dotfiles
local skel_group = vim.api.nvim_create_augroup('SkeletonWrites', { clear = true })
vim.api.nvim_create_autocmd('BufNewFile', {
	command = '0r ~/.config/nvim/skeletons/skel.sh',
	pattern = { '*.sh' },
	group = skel_group,
})

vim.api.nvim_create_autocmd('BufNewFile', {
	command = '0r ~/.config/nvim/skeletons/skel.py',
	pattern = { '*.py' },
	group = skel_group,
})

vim.api.nvim_create_autocmd('BufNewFile', {
	command = '0r ~/.config/nvim/skeletons/skel.tex',
	pattern = { '*.tex' },
	group = skel_group,
})

vim.api.nvim_create_autocmd('BufNewFile', {
	command = '0r ~/.config/nvim/skeletons/skel.html',
	pattern = { '*.html' },
	group = skel_group,
})

vim.api.nvim_create_autocmd('BufNewFile', {
	command = '0r ~/.config/nvim/skeletons/skel.js',
	pattern = { '*.js' },
	group = skel_group,
})
